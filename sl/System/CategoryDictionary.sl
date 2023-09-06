CategoryDictionary : [Object] { | domainDictionary |

	categoriesOf { :self :domain :entry |
		| dictionary = self.domain(domain); |
		dictionary.indices.select { :each |
			dictionary[each].includes(entry)
		}
	}

	categorize { :self :domain :category :entry |
		self.category(domain, category).add(entry)
	}

	categorizeAll { :self :domain :category :entries |
		| simpleCategory = category.splitBy('-').first; |
		self.category(domain, simpleCategory).addAll(entries)
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
		| all = self.categoriesOf(domain, entry); |
		all.size.caseOfOtherwise([
			0 -> {
				self.categorize(domain, '*Uncategorized*', entry);
				'*Uncategorized*'
			},
			1 -> {
				all[1]
			}
		]) {
			self.error('categoryOf: multiple categories: ' ++ entry)
		}
	}

	domain { :self :domain |
		self.domainDictionary.atIfAbsentPut(domain) {
			Record()
		}
	}

	hasDomain { :self :domain |
		self.domainDictionary.includes(domain)
	}

	isCategorized { :self :domain :entry |
		self.domain(domain).anySatisfy { :each |
			each.includes(entry)
		}
	}

	isCategoryName { :self :domain :entry |
		self.domain(domain).includesIndex(entry)
	}

}

+Void {

	CategoryDictionary {
		newCategoryDictionary().initializeSlots(Record())
	}

}

+@SystemCache {

	categoryDictionary { :self |
		self.cache.atIfAbsentPut('categoryDictionary') {
			CategoryDictionary()
		}
	}

}
