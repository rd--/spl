@Iterable {

	allSatisfy { :self :aProcedure:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aProcedure.ifFalse {
					false.return
				}
			};
			true
		}
	}

	anyOne { :self |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.return
			};
			self.error('@Iterable>>anyOne: empty iterable')
		}
	}

	anySatisfy { :self :aProcedure:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aProcedure.ifTrue {
					true.return
				}
			};
			false
		}
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

	countAll { :self |
		self.count { :unusedItem |
			true
		}
	}

	detect { :self :aProcedure:/1 |
		self.detectIfNone(aProcedure:/1) {
			self.error('@Iterable>>detect: not found')
		}
	}

	detectIfFound { :self :aProcedure:/1 :foundProcedure:/1 |
		self.detectIfFoundIfNone(aProcedure:/1, foundProcedure:/1) {
			nil
		}
	}

	detectIfFoundIfNone { :self :aProcedure:/1 :foundProcedure:/1 :exceptionProcedure:/0 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				aProcedure(each).ifTrue {
					foundProcedure(each).return
				}
			};
			exceptionProcedure()
		}
	}

	detectIfNone { :self :aProcedure:/1 :whenAbsent:/0 |
		self.detectIfFoundIfNone(aProcedure:/1, identity:/1, whenAbsent:/0)
	}

	detectSum { :self :aBlock:/1 |
		| sum = 0; |
		self.do { :each |
			sum := aBlock(each) + sum
		};
		sum
	}

	detectMax { :self :aProcedure:/1 |
		| maxElement maxValue |
		self.do { :each |
			maxValue.ifNil {
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

	detectMin { :self :aProcedure:/1 |
		| minElement minValue |
		self.do { :each |
			minValue.ifNil {
				minElement := each;
				minValue := aProcedure(each)
			} {
				| nextValue = aProcedure(each); |
				(nextValue < minValue).ifTrue {
					minElement := each;
					minValue := nextValue
				}
			}
		};
		minElement
	}

	do { :self :aBlock:/1 |
		self.typeResponsibility('@Iterable>>do')
	}

	doSeparatedBy { :self :elementBlock:/1 :separatorBlock:/0 |
		| beforeFirst = true; |
		self.do { :each |
			beforeFirst.if {
				beforeFirst := false
			} {
				separatorBlock()
			};
			elementBlock(each)
		}
	}

	doWithout { :self :aBlock:/1 :anItem |
		self.do { :each |
			(anItem = each).ifFalse {
				aBlock(each)
			}
		}
	}

	includes { :self :anObject |
		self.anySatisfy { :each |
			each = anObject
		}
	}

	includesAnyOf { :self :aCollection |
		valueWithReturn { :return:/1 |
			aCollection.do { :elem |
				self.includes(elem).ifTrue {
					true.return
				}
			};
			false
		}
	}

	includesAllOf { :self :aCollection |
		valueWithReturn { :return:/1 |
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

	max { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.max(each)
		}
	}

	maxBy { :self :aBlock:/1 |
		self.injectInto(self.anyOne) { :answer :each |
			answer.maxBy(each, aBlock:/1)
		}
	}

	min { :self |
		self.injectInto(self.anyOne) { :answer :each |
			answer.min(each)
		}
	}

	minBy { :self :aBlock:/1 |
		self.injectInto(self.anyOne) { :answer :each |
			answer.minBy(each, aBlock:/1)
		}
	}

	minMax { :self |
		| min = self.anyOne, max = min; |
		self.do { :each |
			min := min.min(each);
			max := max.max(each)
		};
		[min, max]
	}

	noneSatisfy { :self :aProcedure:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aProcedure.ifTrue {
					false.return
				}
			};
			true
		}
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

	oneSatisfies { :self :aBlock:/1 |
		self.count(aBlock:/1) = 1
	}

	product { :self |
		self.reduce(times:/2)
	}

	range { :self |
		self.max - self.min
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
			self.error('@Iterable>>reduce: empty collection')
		};
		nextValue
	}

	rejectThenDo { :self :rejectBlock:/1 :doBlock:/1 |
		self.do { :each |
			rejectBlock(each).ifFalse {
				doBlock(each)
			}
		}
	}

	selectThenDo { :self :selectBlock:/1 :doBlock:/1 |
		self.do { :each |
			selectBlock(each).ifTrue {
				doBlock(each)
			}
		}
	}

	size { :self |
		| tally = 0; |
		self.do { :each |
			tally := tally + 1
		};
		tally
	}

	sum { :self |
		self.reduce(plus:/2)
	}

}
