@Set {

	addInPlace { :self :anObject |
		self.includes(anObject).ifTrue {
			self.error('@Set>>addInPlace: includes item')
		};
		self.includeInPlace(anObject)
	}

	collect { :self :aBlock/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.includeInPlace(aBlock(each))
		};
		answer
	}

	equalBy { :self :anObject :aBlock/2 |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includesBy(each, aBlock/2)
				}
			}
		}
	}

	isDuplicateFree { :unused |
		true
	}

	isSet { :unused |
		true
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).if {
			1
		} {
			0
		}
	}

	removeInPlace { :self :anObject |
		self.removeIfAbsent(anObject) {
			self.error('@Set>>removeInPlace: item does not exist')
		}
	}

	withoutInPlace { :self :anObject |
		self.removeIfAbsent(anObject) { };
		self
	}

	uncheckedInclude { :self :anObject |
		self.includeInPlace(anObject)
	}

}

+@Dictionary {

	[dictionaryToSet, asSet] { :self |
		self.values.asSet
	}

}

+@Collection {

	[collectionToSet, asSet] { :self |
		SortedSet(self)
	}

	Set { :self |
		SortedSet(self)
	}

}

+Void {

	Set {
		SortedSet()
	}

}

+List {

	setIntersection { :self |
		self.collect(asSet/1).reduce(intersection/2)
	}

}
