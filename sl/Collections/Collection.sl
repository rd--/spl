@Collection {

	addAll { :self :aCollection |
		aCollection.do { :each |
			self.add(each)
		}
	}

	addIfNotPresent { :self :anObject |
		self.includes(anObject).ifFalse {
			self.add(anObject)
		};
		anObject
	}

	allSatisfy { :self :aProcedure:/1 |
		withReturn {
			self.do { :each |
				each.aProcedure.ifFalse {
					false.return
				}
			};
			true
		}
	}

	anyOne { :self |
		withReturn {
			self.do { :each |
				each.return
			};
			self.errorEmptyCollection
		}
	}

	anySatisfy { :self :aProcedure:/1 |
		withReturn {
			self.do { :each |
				each.aProcedure.ifTrue {
					true.return
				}
			};
			false
		}
	}

	asArray { :self |
		self.Array
	}

	asCollection { :self |
		self
	}

	associationsDo { :self :aBlock:/1 |
		self.do(aBlock:/1)
	}

	atRandom { :self |
		| randomIndex = self.size.atRandom, index = 1; |
		withReturn {
			self.do { :each |
				(index = randomIndex).ifTrue {
					each.return
				};
				index := index + 1
			}
		}
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.do { :each |
			answer.add(aProcedure(each))
		};
		answer
	}

	collectInto { :self :aProcedure :aCollection |
		aCollection.fillFromWith(self, aProcedure)
	}

	count { :self :aProcedure:/1 |
		| answer = 0; |
		self.do { :each |
			aProcedure(each).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :foundProcedure:/1 :exceptionProcedure:/0 |
		withReturn {
			self.do { :each |
				aProcedure(each).ifTrue {
					return (foundProcedure(each))
				}
			};
			exceptionProcedure()
		}
	}

	detectIfNone { :self :aProcedure:/1 :whenAbsent:/0 |
		detectIfFoundIfNone(self, aProcedure:/1, identity:/1, whenAbsent:/0)
	}

	detect { :self :aProcedure |
		detectIfNone(self, aProcedure) {
			error('Collection>>detect: not found')
		}
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

	do { :self :aProcedure |
		<primitive: return _self.forEach(_aProcedure);>
	}

	emptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyCollection
		}
	}

	fillFromWith { :self :aCollection :aProcedure:/1 |
		aCollection.do { :each |
			self.add(aProcedure(each))
		}
	}

	includesAllOf { :self :aCollection |
		withReturn {
			aCollection.do { :elem |
				self.includes(elem).ifFalse {
					false.return
				}
			};
			true
		}
	}

	injectInto { :self :initialValue :aProcedure:/2 |
		| nextValue = initialValue; |
		self.do { :each |
			nextValue := aProcedure(nextValue, each)
		};
		nextValue
	}

	isCollection { :self |
		true
	}

	isEmpty { :self |
		self.size = 0
	}

	max { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.max(each)
		}
	}

	mean { :self |
		self.sum / self.size
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	occurrencesOf { :self :anObject |
		| tally = 0; |
		self.do { :each |
			(anObject = each).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	product { :self |
		self.reduce(times:/2)
	}

	reduce { :self :aProcedure:/2 |
		| first = true, nextValue = nil; |
		self.do { :each |
			first.if {
				nextValue := each;
				first := false
			} {
				nextValue := aProcedure(nextValue, each)
			}
		};
		first.ifTrue {
			error('Collection>>reduce: empty collection')
		};
		nextValue
	}

	reject { :self :aProcedure:/1 |
		self.select { :element |
			aProcedure(element) = false
		}
	}

	remove { :self :oldObject |
		self.removeIfAbsent(oldObject) {
			self.errorNotFound(oldObject)
		}
	}

	select { :self :aProcedure:/1 |
		| answer = self.species.new; |
		self.do { :each |
			aProcedure(each).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	size { :self |
		| tally = 0; |
		self.do { :each |
			tally := tally + 1
		};
		tally
	}

	sorted { :self :compare |
		self.asArray.sort(compare)
	}

	sum { :self |
		self.reduce(plus:/2)
	}

	ofSize { :self :aNumber |
		(self.size = aNumber).ifFalse {
			'ofSize'.error
		};
		self
	}

}

+ @Object {

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
