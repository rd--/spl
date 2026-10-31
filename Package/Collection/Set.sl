@Set {

	add! { :self :anObject |
		self.includes(anObject).ifTrue {
			self.error('@Set>>add!: includes item')
		};
		self.include!(anObject)
	}

	collect { :self :aBlock/1 |
		let answer = self.new;
		self.do { :each |
			answer.include!(aBlock(each))
		};
		answer
	}

	isDuplicateFree { :unused |
		true
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includesBy(each, aBlock/2)
				}
			}
		}
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

	remove! { :self :anObject |
		self.removeIfAbsent!(anObject) {
			self.error('@Set>>remove!: item does not exist')
		}
	}

	uncheckedInclude! { :self :anObject |
		self.include!(anObject)
	}

	without! { :self :anObject |
		self.removeIfAbsent!(anObject) { };
		self
	}

}

+@Dictionary {

	[Set, dictionaryToSet] { :self :comparator/2 |
		Set(self.values, comparator/2)
	}

}

+@Collection {

	[Set, collectionToSet] { :self :comparator/2 |
		let answer = comparator/2.comparatorToEmptySet;
		answer.includeAll!(self);
		answer
	}

	[Set, collectionToSet] { :self |
		self.allTrue(isImmediate/1).if {
			Set(self, ==)
		} {
			Set(self, =)
		}
	}

}

+List {

	setIntersection { :self :aBlock/2 |
		self.collect { :x |
			Set(x, aBlock/2)
		}.reduce(intersection/2)
	}

}
