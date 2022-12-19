@Collection {

	addAll { :self :aCollection |
		aCollection.do { :each | self.add(each) }
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse { self.add(anObject) };
		anObject
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

	asCollection { :self |
		self
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
		self.do { :each | newCollection.add(aBlock.value(each)) };
		newCollection
	}

	collectInto { :self :aBlock :aCollection |
		aCollection.fillFromWith(self, aBlock)
	}

	detectIfFoundIfNone { :self :aProcedure :foundProcedure :exceptionProcedure |
		withReturn {
			self.do { :each |
				aProcedure.value(each).ifTrue {
					return (foundProcedure.value(each))
				}
			}
		};
		exceptionProcedure.value
	}

	detectIfNone { :self :aProcedure :whenAbsent |
		detectIfFoundIfNone(self, aProcedure, identity:/1, whenAbsent)
	}

	detect { :self :aProcedure |
		detectIfNone(self, aProcedure) { error('Array>>detect: not found') }
	}

	detectMax { :self :aProcedure |
		| maxElement maxValue |
		self.do { :each |
			maxValue.isNil.if {
				maxElement := each;
				maxValue := aProcedure.value(each)
			} {
				| nextValue = aProcedure.value(each); |
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
			self.add(aBlock.value(each))
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

	isCollection { :self |
		true
	}

	isEmpty { :self |
		self.size = 0
	}

	max { :self |
		self.injectInto(self.anyOne) { :answer :each | answer.max(each) }
	}

	mean { :self |
		self.sum / self.size
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.do { :each | (anObject = each).ifTrue { tally := tally + 1 } };
		tally
	}

	product { :self |
		self.reduce(times:/2)
	}

	reduce { :self :aBinaryProcedure |
		| first = true, nextValue = nil; |
		self.do { :each |
			if(first) {
				nextValue := each;
				first := false
			} {
				nextValue := aBinaryProcedure.value(nextValue, each)
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
		self.do { :each | aBlock.value(each).ifTrue { answer.add(each) } };
		answer
	}

	size { :self |
		| tally = 0; |
		self.do { :each | tally := tally + 1 };
		tally
	}

	sorted { :self :aSortBlockOrNil |
		self.asArray.sort(aSortBlockOrNil)
	}

	sum { :self |
		self.reduce(plus:/2)
	}

	ofSize { :self :aNumber |
		ifFalse(self.size = aNumber) { error('ofSize') };
		self
	}

}

+ Object {

	isCollection { :self |
		false
	}

}

+ Procedure {

	map { :self :aCollection |
		aCollection.collect(self)
	}

	ofSize { :self :aNumber |
		self.value(aNumber).ofSize(aNumber)
	}

}
