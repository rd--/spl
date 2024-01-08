CategoryDictionary : [Object] { | domainDictionary |

	categoriesOf { :self :domain :entry |
		let dictionary = self.domain(domain);
		dictionary.indices.select { :each |
			dictionary[each].includes(entry)
		}
	}

	categoriesOf { :self :entry |
		self.domains.collect { :each |
			self.categoriesOf(each, entry)
		}.concatenation
	}

	categorize { :self :domain :category :entry |
		self.category(domain, category).add(entry)
	}

	categorizeAll { :self :domain :category :entries |
		let simpleCategory = category.splitBy('-').first;
		self.category(domain, simpleCategory).includeAll(entries)
	}

	categorizeDictionary { :self :domain :aBlock:/1 :aDictionary |
		aDictionary.withIndexDo { :value :key |
			self.categorizeAll(domain, key, value.collect(aBlock:/1))
		}
	}

	categorizeDictionary { :self :domain :aDictionary |
		self.categorizeDictionary(domain, identity:/1, aDictionary)
	}

	category { :self :domain :category |
		self.domain(domain).atIfAbsentPut(category) {
			Set()
		}
	}

	categoryOf { :self :domain :entry |
		let all = self.categoriesOf(domain, entry);
		all.size.caseOfOtherwise([
			0 -> {
				self.categorize(domain, '*Uncategorized*', entry);
				'*Uncategorized*'
			},
			1 -> {
				all[1]
			}
		]) {
			self.error('categoryOf: multiple categories: ' ++ [domain, entry])
		}
	}

	categoryOf { :self :entry |
		let answer = self.categoriesOf(entry);
		answer.size.caseOfOtherwise([
			{ 0 } -> { '*Uncategorized*' },
			{ 1 } -> { answer.first }
		]) {
			self.error('categoryOf: multiple categories: ' ++ entry)
		}
	}

	domain { :self :domain |
		self.domainDictionary.atIfAbsentPut(domain) {
			Record()
		}
	}

	domains { :self |
		self.domainDictionary.indices
	}

	entries { :self |
		let answer = Set();
		self.domainDictionary.do { :each |
			each.valuesDo { :item |
				answer.includeAll(item)
			}
		};
		answer
	}

	hasDomain { :self :domain |
		self.domainDictionary.includes(domain)
	}

	isCategorized { :self :domain :entry |
		self.domain(domain).anySatisfy { :each |
			each.includes(entry)
		}
	}

	isCategorized { :self :entry |
		self.domains.anySatisfy { :each |
			self.isCategorized(each, entry)
		}
	}

	isCategoryName { :self :domain :category |
		self.domain(domain).includesIndex(category)
	}

	isCategoryName { :self :category |
		self.domains.anySatisfy { :each |
			self.isCategoryName(each, category)
		}
	}

	multiplyCategorized { :self :domain |
		self.entries.collect { :each |
			each -> self.categoriesOf(domain, each)
		}.select { :each |
			each.value.size > 1
		}
	}

}

+Void {

	CategoryDictionary {
		newCategoryDictionary().initializeSlots(Record())
	}

}

+@Cache {

	categoryDictionary { :self |
		self.cached('categoryDictionary') {
			CategoryDictionary()
		}
	}

}

+String {

	categoryNameParts { :self |
		self.splitBy('-')
	}

}
