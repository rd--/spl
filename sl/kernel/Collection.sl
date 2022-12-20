@Collection {

	addAll { :self :aCollection |
		aCollection.do { :each | self.add(each) }
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse { self.add(anObject) };
		anObject
	}

	allSatisfy { :self :aProcedure:/1 |
		withReturn {
			self.do { :each | each.aProcedure.ifFalse { false.return } };
			true
		}
	}

	anyOne { :self |
		withReturn {
			self.do { :each | each.return };
			self.errorEmptyCollection
		}
	}

	anySatisfy { :self :aProcedure:/1 |
		withReturn {
			self.do { :each | each.aProcedure.ifTrue { true.return } };
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
				ifTrue(index = randomIndex) { each.return };
				index := index + 1
			}
		}
	}

	collect { :self :aBlock:/1 |
		| answer = self.species.new; |
		self.do { :each |
			answer.add(aBlock(each))
		};
		answer
	}

	collectInto { :self :aBlock :aCollection |
		aCollection.fillFromWith(self, aBlock)
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :foundProcedure:/1 :exceptionProcedure:/0 |
		withReturn {
			self.do { :each |
				aProcedure(each).ifTrue {
					return (foundProcedure(each))
				}
			}
		};
		exceptionProcedure()
	}

	detectIfNone { :self :aProcedure :whenAbsent |
		detectIfFoundIfNone(self, aProcedure, identity:/1, whenAbsent)
	}

	detect { :self :aProcedure |
		detectIfNone(self, aProcedure) { error('Array>>detect: not found') }
	}

	detectMax { :self :aProcedure:/1 |
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

	fillFromWith { :self :aCollection :aBlock:/1 |
		aCollection.do { :each |
			self.add(aBlock(each))
		}
	}

	includesAllOf { :self :aCollection |
		withReturn {
			aCollection.do { :elem | self.includes(elem).ifFalse { false.return } }
		};
		true
	}

	injectInto { :self :initialValue :aProcedure:/2 |
		| nextValue = initialValue; |
		self.do { :each | nextValue := aProcedure(nextValue, each) };
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

	reduce { :self :aBinaryProcedure:/2 |
		| first = true, nextValue = nil; |
		self.do { :each |
			if(first) {
				nextValue := each;
				first := false
			} {
				nextValue := aBinaryProcedure(nextValue, each)
			}
		};
		first.ifTrue {
			error('Array>>reduce: empty collection')
		};
		nextValue
	}

	remove { :self :oldObject |
		self.removeIfAbsent(oldObject, { self.errorNotFound(oldObject) } )
	}

	select { :self :aBlock:/1 |
		| answer = self.species.new; |
		self.do { :each |
			aBlock(each).ifTrue {
				answer.add(each)
			}
		};
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

	ofSize { :self:/1 :aNumber |
		self(aNumber).ofSize(aNumber)
	}

}
