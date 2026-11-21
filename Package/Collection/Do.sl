@Do {

	absMax { :self |
		self.injectInto(self.anyOne.abs) { :answer :each |
			answer.max(each.abs)
		}
	}

	[allFalse, noneSatisfy] { :self :aFunction/1 |
		withReturn { :return/1 |
			self.do { :each |
				each.aFunction.ifTrue {
					false.return
				}
			};
			true
		}
	}

	allFalse { :self |
		self.allFalse(identity/1)
	}

	[allTrue, allSatisfy] { :self :aFunction/1 |
		withReturn { :return/1 |
			self.do { :each |
				each.aFunction.ifFalse {
					false.return
				}
			};
			true
		}
	}

	allTrue { :self |
		self.allTrue(identity/1)
	}

	[and, &] { :self |
		self.allSatisfy(nullaryApply/1)
	}

	anyOne { :self |
		withReturn { :return/1 |
			self.do { :each |
				each.return
			};
			self.error('@Do>>anyOne: empty iterable')
		}
	}

	[anyTrue, anySatisfy] { :self :aFunction/1 |
		withReturn { :return/1 |
			self.do { :each |
				each.aFunction.ifTrue {
					true.return
				}
			};
			false
		}
	}

	anyTrue { :self |
		self.anyTrue(identity/1)
	}

	cartesianProduct { :self :operand |
		let answer = [];
		self.cartesianProductDo(operand) { :i :j |
			answer.add!([i, j])
		};
		answer
	}

	cartesianProductDo { :self :operand :aFunction/2 |
		self.do { :x |
			operand.do { :y |
				aFunction(x, y)
			}
		}
	}

	containsOnly { :x :y |
		x.allSatisfy { :i |
			y.includes(i)
		}
	}

	count { :self :aFunction/1 |
		let answer = 0L;
		self.do { :each |
			aFunction(each).ifTrue {
				answer := answer + 1L
			}
		};
		answer
	}

	countAll { :self |
		self.count { :unusedItem |
			true
		}
	}

	countDistinct { :self :aFunction/2 |
		let set = UnsortedSet();
		set.comparator := aFunction/2;
		self.do { :each |
			set.include!(each)
		};
		set.size
	}

	countIntegers { :self :operand |
		let [p, q] = operand;
		let answer = List(q - p + 1L, 0L);
		self.do { :each |
			(
				each >= p & {
					each <= q
				}
			).ifTrue {
				let index = each - p + 1L;
				answer[index] := answer[index] + 1L
			}
		};
		answer
	}

	countOccurences { :self :anObject |
		self.count { :each |
			each = anObject
		}
	}

	[deepAllTrue, deepAllSatisfy] { :self :aFunction/1 |
		withReturn { :return/1 |
			self.deepDo { :each |
				each.aFunction.ifFalse {
					false.return
				}
			};
			true
		}
	}

	deepDo { :self :aFunction/1 |
		let type = self.typeName;
		self.do { :each |
			(each.typeName = type).if {
				each.deepDo(aFunction/1)
			} {
				aFunction(each)
			}
		}
	}

	deepInjectInto { :self :initialValue :aFunction/2 |
		self.injectIntoBy(initialValue, aFunction/2, deepDo/2)
	}

	deepMax { :self |
		self.deepReduce(max/2)
	}

	deepMin { :self |
		self.deepReduce(min/2)
	}

	deepMinMax { :self |
		self.deepInjectInto([Infinity, -Infinity]) { :m :x |
			m[1] := m[1].min(x);
			m[2] := m[2].max(x);
			m
		}
	}

	deepReduce { :self :aFunction/2 |
		self.reduceBy(aFunction/2, deepDo/2)
	}

	deepSum { :self |
		self.deepReduce(+)
	}

	detect { :self :aFunction/1 |
		self.detectIfNone(aFunction/1) {
			self.error('@Do>>detect: not found')
		}
	}

	detect { :self :count :aFunction/1 |
		let answer = [];
		withReturn { :return/1 |
			self.do { :each |
				aFunction(each).ifTrue {
					answer.add!(each);
					count := count - 1L;
					(count < 1L).ifTrue {
						answer.return
					}
				}
			};
			self.error('detect')
		}
	}

	detectIfFound { :self :aFunction/1 :foundFunction/1 |
		self.detectIfFoundIfNone(aFunction/1, foundFunction/1) {
			nil
		}
	}

	detectIfFoundIfNone { :self :aFunction/1 :foundFunction/1 :exceptionFunction/0 |
		self.detectIfFoundIfNoneUsing(aFunction/1, foundFunction/1, exceptionFunction/0, do/2)
	}

	detectIfFoundIfNoneUsing { :self :aFunction/1 :foundFunction/1 :exceptionFunction/0 :doFunction/2 |
		withReturn { :return/1 |
			doFunction(self) { :each |
				aFunction(each).ifTrue {
					foundFunction(each).return
				}
			};
			exceptionFunction()
		}
	}

	detectIfNone { :self :aFunction/1 :whenAbsent/0 |
		self.detectIfFoundIfNone(aFunction/1, identity/1, whenAbsent/0)
	}

	detectMax { :self :aFunction/1 |
		let maxElement = nil;
		let maxValue = nil;
		self.do { :each |
			maxValue.ifNil {
				maxElement := each;
				maxValue := aFunction(each)
			} {
				let nextValue = aFunction(each);
				(nextValue > maxValue).ifTrue {
					maxElement := each;
					maxValue := nextValue
				}
			}
		};
		maxElement
	}

	detectMin { :self :aFunction/1 |
		let minElement = nil;
		let minValue = nil;
		self.do { :each |
			minValue.ifNil {
				minElement := each;
				minValue := aFunction(each)
			} {
				let nextValue = aFunction(each);
				(nextValue < minValue).ifTrue {
					minElement := each;
					minValue := nextValue
				}
			}
		};
		minElement
	}

	detectSum { :self :aFunction/1 |
		let sum = 0L;
		self.do { :each |
			sum := sum + aFunction(each)
		};
		sum
	}

	do { :self :aFunction/1 |
		self.typeResponsibility('@Do>>do')
	}

	doSeparatedBy { :self :elementFunction/1 :separatorFunction/0 |
		let beforeFirst = true;
		self.do { :each |
			beforeFirst.if {
				beforeFirst := false
			} {
				separatorFunction()
			};
			elementFunction(each)
		}
	}

	doWithBreak { :self :aFunction/2 |
		withReturn { :return/1 |
			let break = {
				nil.return
			};
			self.do { :each |
				aFunction(each, break/0)
			}
		}
	}

	doWithout { :self :aFunction/1 :anItem |
		self.do { :each |
			(anItem = each).ifFalse {
				aFunction(each)
			}
		}
	}

	duplicatesSet { :c :comparator/2 |
		let a = Set([], comparator/2);
		let b = Set([], comparator/2);
		c.do { :x |
			a.includes(x).if {
				b.include!(x)
			} {
				a.add!(x)
			}
		};
		b
	}

	[evaluatingAnd, &&] { :self |
		self.allSatisfy(identity/1)
	}

	[evaluatingOr, ||] { :self |
		self.anySatisfy(identity/1)
	}

	includes { :self :anObject |
		self.includesBy(anObject, isEqual/2)
	}

	includesAll { :self :aCollection |
		withReturn { :return/1 |
			aCollection.do { :elem |
				self.includes(elem).ifFalse {
					false.return
				}
			};
			true
		}
	}

	includesAny { :self :aCollection |
		withReturn { :return/1 |
			aCollection.do { :elem |
				self.includes(elem).ifTrue {
					true.return
				}
			};
			false
		}
	}

	includesBy { :self :anObject :aFunction/2 |
		self.anySatisfy { :each |
			aFunction(each, anObject)
		}
	}

	includesExactly { :self :aCollection |
		self.includesAll(aCollection) & {
			self.includesOnly(aCollection)
		}
	}

	includesNone { :self :aCollection |
		self.includesAny(aCollection).not
	}

	includesOnly { :self :aCollection |
		aCollection.includesAll(self)
	}

	injectInto { :self :initialValue :aFunction/2 |
		self.injectIntoBy(initialValue, aFunction/2, do/2)
	}

	injectIntoBy { :self :initialValue :aFunction/2 :doFunction/2 |
		let nextValue = initialValue;
		doFunction(self) { :each |
			nextValue := aFunction(nextValue, each)
		};
		nextValue
	}

	isDuplicateFree { :self :comparator/2 :aFunction/1 |
		withReturn { :return/1 |
			let items = comparator/2.comparatorToSetOrList;
			self.do { :x |
				let y = aFunction(x);
				items.includes(y).ifTrue {
					false.return
				};
				items.add!(y)
			};
			true
		}
	}

	isDuplicateFree { :self :comparator/2 |
		self.isDuplicateFree(comparator/2, identity/1)
	}

	isDuplicateFree { :self |
		self.isDuplicateFree(=)
	}

	isProperSubset { :self :aCollection |
		aCollection.includesAll(self) & {
			self != aCollection
		}
	}

	isSubset { :self :aCollection |
		aCollection.includesAll(self)
	}

	items { :self :aFunction/2 |
		let answer = [];
		aFunction(self) { :each |
			answer.add!(each)
		};
		answer
	}

	items { :self |
		self.items(do/2)
	}

	level { :self :aList |
		self.levelBy { :level |
			aList.includes(level)
		}
	}

	levelBy { :self :aFunction/1 |
		let answer = [];
		self.withLevelDo { :each :level |
			aFunction(level).ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	maxOn { :self :f/1 |
		self.minBy { :a :b |
			isGreaterOn(a, b, f/1)
		}
	}

	maximalBy { :self :aFunction/1 |
		let z = self.collect(aFunction/1);
		let i = z.indicesOf(z.max);
		self.selectIndices(i)
	}

	[maximum, max] { :self |
		self.reduce(max/2)
	}

	minBy { :self :aFunction/2 |
		self.reduce { :p :q |
			aFunction(p, q).if {
				p
			} {
				q
			}
		}
	}

	minOn { :self :f/1 |
		self.minBy { :a :b |
			isLessOn(a, b, f/1)
		}
	}

	minimalBy { :self :aFunction/1 |
		let z = self.collect(aFunction/1);
		let i = z.indicesOf(z.min);
		self.selectIndices(i)
	}

	[minimum, min] { :self |
		self.reduce(min/2)
	}

	minimumExcludedPositiveInteger { :x |
		x.minimumExcludedValue(1.to(Infinity))
	}

	minimumExcludedValue { :x :u |
		u.detect { :n |
			x.includes(n).not
		}
	}

	minimumExcludedValue { :x |
		x.minimumExcludedValue(0.to(Infinity))
	}

	[minimumMaximum, minMax] { :self |
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

	noneTrue { :self |
		self.noneSatisfy(identity/1)
	}

	occurrencesOf { :self :anObject |
		let tally = 0L;
		self.do { :each |
			(anObject = each).ifTrue {
				tally := tally + 1L
			}
		};
		tally
	}

	oneSatisfies { :self :aFunction/1 |
		self.count(aFunction/1) = 1L
	}

	[or, |] { :self |
		self.anySatisfy(nullaryApply/1)
	}

	product { :self :aFunction/1 |
		self.isEmpty.if {
			1L
		} {
			let a = aFunction(self.first);
			let b = self.allButFirst;
			b.injectInto(a) { :i :j |
				i * aFunction(j)
			}
		}
	}

	product { :self |
		self.ifEmpty {
			1L
		} {
			self.reduce(times/2)
		}
	}

	range { :self |
		self.max - self.min
	}

	reduce { :self :aFunction/2 |
		self.reduceBy(aFunction/2, do/2)
	}

	reduceBy { :self :aFunction/2 :iterationFunction/2 |
		let isFirst = true;
		let nextValue = nil;
		self.iterationFunction { :each |
			isFirst.if {
				nextValue := each;
				isFirst := false
			} {
				nextValue := aFunction(nextValue, each)
			}
		};
		isFirst.ifTrue {
			self.error('reduceBy: empty collection')
		};
		nextValue
	}

	rejectThenDo { :self :rejectFunction/1 :doFunction/1 |
		self.do { :each |
			rejectFunction(each).ifFalse {
				doFunction(each)
			}
		}
	}

	selectThenDo { :self :selectFunction/1 :doFunction/1 |
		self.do { :each |
			selectFunction(each).ifTrue {
				doFunction(each)
			}
		}
	}

	size { :self |
		let tally = 0L;
		self.do { :each |
			tally := tally + 1L
		};
		tally
	}

	sum { :self :aFunction/1 |
		self.isEmpty.if {
			0L
		} {
			let a = aFunction(self.first);
			let b = self.allButFirst;
			b.injectInto(a) { :i :j |
				i + aFunction(j)
			}
		}
	}

	sum { :self |
		self.reduce(plus/2)
	}

	sumOfSquares { :self |
		self.sum(square/1)
	}

	withLevelDo { :self :aFunction/2 :level |
		let type = self.typeName;
		self.do { :each |
			(each.typeName = type).if {
				each.withLevelDo(aFunction/2, level + 1L);
				aFunction(each, level)
			} {
				aFunction(each, level)
			}
		}
	}

	withLevelDo { :self :aFunction/2 |
		self.withLevelDo(aFunction/2, 1L);
		aFunction(self, 0L);
		nil
	}

}
