@Set {

	add { :self :anObject |
		self.includes(anObject).ifTrue {
			self.error('@Set>>add: includes item')
		};
		self.include(anObject)
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.include(aBlock(each))
		};
		answer
	}

	equalBy { :self :anObject :aBlock:/2 |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includesBy(each, aBlock:/2)
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

	remove { :self :anObject |
		self.removeIfAbsent(anObject) {
			self.error('@Set>>remove: item does not exist')
		}
	}

	without { :self :anObject |
		self.removeIfAbsent(anObject) { };
		self
	}

	uncheckedInclude { :self :anObject |
		self.include(anObject)
	}

}

+@Dictionary {

	asSet { :self |
		self.values.asSet
	}

}

+@Collection {

	asSet { :self |
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
		self.collect(asSet:/1).reduce(intersection:/2)
	}

}
