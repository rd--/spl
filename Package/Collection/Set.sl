@Set {

	add! { :self :anObject |
		self.includes(anObject).ifTrue {
			self.error('@Set>>add!: includes item', [anObject])
		};
		self.include!(anObject)
	}

	collect { :self :aFunction/1 |
		let answer = self.new;
		self.do { :each |
			answer.include!(aFunction(each))
		};
		answer
	}

	isDuplicateFree { :unused |
		true
	}

	isEqualBy { :self :anObject :aFunction/2 |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includesBy(each, aFunction/2)
				}
			}
		}
	}

	isSet { :unused |
		true
	}

	occurrencesOf { :self :anObject |
		self.includes(anObject).boole
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
		let answer = comparatorToSet(comparator/2);
		answer.includeAll!(self);
		answer
	}

	Set { :self |
		Set(self, =)
	}

	inferredSet { :self |
		self.allTrue(isImmediate/1).if {
			Set(self, ==)
		} {
			Set(self, =)
		}
	}

}

+List {

	setIntersection { :self :aFunction/2 |
		self.collect { :x |
			Set(x, aFunction/2)
		}.reduce(intersection/2)
	}

}
