@Collection {

	isCollection { :self | true }
	asCollection { :self | self }

	addAll { :self :aCollection |
		aCollection.do { :each | self.add(each) }
	}

	allSatisfy { :self :aProcedure |
		withReturn {
			self.do { :each | each.aProcedure.ifFalse { return(false) } };
			true
		}
	}

	anyOne { :self |
		withReturn {
			self.do { :each | return(each) };
			self.errorEmptyCollection
		}
	}

	anySatisfy { :self :aProcedure |
		withReturn {
			self.do { :each | each.aProcedure.ifTrue { return(true) } };
			false
		}
	}

	atRandom { :self |
		| randomIndex = self.size.atRandom, index = 1; |
		withReturn {
			self.do { :each |
				ifTrue(index = randomIndex) { return(each) };
				index := index + 1
			}
		}
	}

	collect { :self :aBlock |
		| newCollection = self.species.new; |
		self.do { :each | newCollection.add(aBlock(each)) };
		newCollection
	}

	collectInto { :self :aBlock :aCollection |
		aCollection.fillFromWith(self, aBlock)
	}

	detectIfFoundIfNone { :self :aProcedure :foundProcedure :exceptionProcedure |
		withReturn {
			self.do { :each | aProcedure(each).ifTrue { return (foundProcedure(each)) } }
		};
		exceptionProcedure()
	}

	detectIfNone { :self :aProcedure :whenAbsent |
		detectIfFoundIfNone(self, aProcedure, identity, whenAbsent)
	}

	detect { :self :aProcedure |
		detectIfNone(self, aProcedure) { error('Array>>detect: not found') }
	}

	detectMax { :self :aProcedure |
		| maxElement maxValue |
		self.do { :each |
			maxValue.isNil.if {
				maxElement := each;
				maxValue := aProcedure(each)
			} {
				| nextValue = aProcedure(each); |
				(nextValue > maxValue).ifTrue {
					maxElement := each;
					maxValue := nextValue
				}
			}
		};
		maxElement
	}

	emptyCheck { :self |
		self.isEmpty.ifTrue { self.errorEmptyCollection }
	}

	fillFromWith { :self :aCollection :aBlock |
		aCollection.do { :each |
			self.add(aBlock(each))
		}
	}

	includesAllOf { :self :aCollection |
		withReturn {
			aCollection.do { :elem | self.includes(elem).ifFalse { return(false) } }
		};
		true
	}

	injectInto { :self :initialValue :binaryProcedure |
		| nextValue = initialValue; |
		self.do { :each | nextValue := binaryProcedure(nextValue, each) };
		nextValue
	}

	isEmpty { :self | self.size = 0 }

	max { :self |
		self.injectInto(self.anyOne) { :answer :each | answer.max(each) }
	}

	mean { :self | self.sum / self.size }

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.do { :each | (anObject = each).ifTrue { tally := tally + 1 } }
		^tally
	}

	product { :self | self.reduce(times) }

	reduce { :self :aBinaryProcedure |
		| first = true, nextValue = nil; |
		self.do { :each |
			if(first) {
				nextValue := each;
				first := false
			} {
				nextValue := aBinaryProcedure(nextValue, each)
			}
		};
		first.ifTrue { error('Array>>reduce: empty collection') };
		nextValue
	}

	remove { :self :oldObject |
		self.removeIfAbsent(oldObject, { self.errorNotFound(oldObject) } )
	}

	select { :self :aBlock |
		| answer = self.species.new; |
		self.do { :each | aBlock(each).ifTrue { answer.add(each) } };
		answer
	}

	size { :self |
		| tally = 0; |
		self.do { :each | tally := tally + 1 };
		tally
	}

	sum { :self | self.reduce(plus) }

	ofSize { :self :aNumber |
		ifFalse(self.size = aNumber) { error('ofSize') };
		self
	}

}

+ Object {

	isCollection { :self | false }

}

+ Procedure {

	map { :self :aCollection | aCollection.collect(self) }
	ofSize { :self :aNumber | self(aNumber).ofSize(aNumber) }

}
