@Set {

	= { :self :anObject |
		anObject.isSet & {
			self.size = anObject.size & {
				self.allSatisfy { :each |
					anObject.includes(each)
				}
			}
		}
	}

	add { :self :anObject |
		self.includes(anObject).ifTrue {
			self.error('@Set>>add: includes item')
		};
		self.include(anObject)
	}

	basicInclude { :self :anObject |
		self.include(anObject)
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.include(aBlock(each))
		};
		answer
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
