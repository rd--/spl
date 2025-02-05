@Iterable {

	& { :self |
		self.allSatisfy(value:/1)
	}


	| { :self |
		self.anySatisfy(value:/1)
	}

	absMax { :self |
		self.injectInto(self.anyOne.abs) { :answer :each |
			answer.max(each.abs)
		}
	}

	allSatisfy { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aBlock.ifFalse {
					false.return
				}
			};
			true
		}
	}

	allTrue { :self |
		self.allSatisfy(identity:/1)
	}

	anyOne { :self |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.return
			};
			self.error('@Iterable>>anyOne: empty iterable')
		}
	}

	anySatisfy { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aBlock.ifTrue {
					true.return
				}
			};
			false
		}
	}

	anyTrue { :self |
		self.anySatisfy(identity:/1)
	}

	contents { :self |
		let answer = [];
		self.do { :each |
			answer.add(each)
		};
		answer
	}

	count { :self :aBlock:/1 |
		let answer = 0;
		self.do { :each |
			aBlock(each).ifTrue {
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

	deepDo { :self :aBlock:/1 |
		let type = self.typeOf;
		self.do { :each |
			(each.typeOf = type).if {
				each.deepDo(aBlock:/1)
			} {
				aBlock(each)
			}
		}
	}

	detect { :self :aBlock:/1 |
		self.detectIfNone(aBlock:/1) {
			self.error('@Iterable>>detect: not found')
		}
	}

	detectIfFound { :self :aBlock:/1 :foundBlock:/1 |
		self.detectIfFoundIfNone(aBlock:/1, foundBlock:/1) {
			nil
		}
	}

	detectIfFoundIfNone { :self :aBlock:/1 :foundBlock:/1 :exceptionBlock:/0 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				aBlock(each).ifTrue {
					foundBlock(each).return
				}
			};
			exceptionBlock()
		}
	}

	detectIfNone { :self :aBlock:/1 :whenAbsent:/0 |
		self.detectIfFoundIfNone(aBlock:/1, identity:/1, whenAbsent:/0)
	}

	detectSum { :self :aBlock:/1 |
		let sum = 0;
		self.do { :each |
			sum := sum + aBlock(each)
		};
		sum
	}

	detectMax { :self :aBlock:/1 |
		let maxElement = nil;
		let maxValue = nil;
		self.do { :each |
			maxValue.ifNil {
				maxElement := each;
				maxValue := aBlock(each)
			} {
				let nextValue = aBlock(each);
				(nextValue > maxValue).ifTrue {
					maxElement := each;
					maxValue := nextValue
				}
			}
		};
		maxElement
	}

	detectMin { :self :aBlock:/1 |
		let minElement = nil;
		let minValue = nil;
		self.do { :each |
			minValue.ifNil {
				minElement := each;
				minValue := aBlock(each)
			} {
				let nextValue = aBlock(each);
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
		let beforeFirst = true;
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

	includesBy { :self :anObject :aBlock:/2 |
		self.anySatisfy { :each |
			aBlock(each, anObject)
		}
	}

	includes { :self :anObject |
		self.includesBy(anObject, =)
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

	injectInto { :self :initialValue :aBlock:/2 |
		let nextValue = initialValue;
		self.do { :each |
			nextValue := aBlock(nextValue, each)
		};
		nextValue
	}

	isDuplicateFree { :self :aBlock:/2 |
		valueWithReturn { :return:/1 |
			let items = [];
			self.do { :each |
				items.includesBy(each, aBlock:/2).ifTrue {
					false.return
				};
				items.add(each)
			};
			true
		}
	}

	isProperSubsetOf { :self :aCollection |
		aCollection.includesAllOf(self) & {
			self ~= aCollection
		}
	}

	isSubsetOf { :self :aCollection |
		aCollection.includesAllOf(self)
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
		let min = self.anyOne;
		let max = min;
		self.do { :each |
			min := min.min(each);
			max := max.max(each)
		};
		[min, max]
	}

	neumaierSum { :self |
		let sum = 0.0;
		let c = 0.0;
		self.do { :each |
			let t = sum + each;
			(sum.abs >= each.abs).if {
				c := c + ((sum - t) + each)
			} {
				c := c + ((each - t) + sum)
			};
			sum := t
		};
		sum + c
	}

	noneSatisfy { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.aBlock.ifTrue {
					false.return
				}
			};
			true
		}
	}

	occurrencesOf { :self :anObject |
		let tally = 0;
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
		self.ifEmpty {
			1
		} {
			self.reduce(*)
		}
	}

	range { :self |
		self.max - self.min
	}

	reduce { :self :aBlock:/2 |
		let isFirst = true;
		let nextValue = nil;
		self.do { :each |
			isFirst.if {
				nextValue := each;
				isFirst := false
			} {
				nextValue := aBlock(nextValue, each)
			}
		};
		isFirst.ifTrue {
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
		let tally = 0;
		self.do { :each |
			tally := tally + 1
		};
		tally
	}

	sum { :self |
		self.injectInto(0, +)
	}

	sumOfSquares { :self |
		self.injectInto(0) { :i :j |
			i + j.squared
		}
	}

}
