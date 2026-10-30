@Do {

	absMax { :self |
		self.injectInto(self.anyOne.abs) { :answer :each |
			answer.max(each.abs)
		}
	}

	[allFalse, noneSatisfy] { :self :aBlock/1 |
		withReturn { :return/1 |
			self.do { :each |
				each.aBlock.ifTrue {
					false.return
				}
			};
			true
		}
	}

	allFalse { :self |
		self.allFalse(identity/1)
	}

	[allTrue, allSatisfy] { :self :aBlock/1 |
		withReturn { :return/1 |
			self.do { :each |
				each.aBlock.ifFalse {
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

	[anyTrue, anySatisfy] { :self :aBlock/1 |
		withReturn { :return/1 |
			self.do { :each |
				each.aBlock.ifTrue {
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

	cartesianProductDo { :self :operand :aBlock/2 |
		self.do { :x |
			operand.do { :y |
				aBlock(x, y)
			}
		}
	}

	containsOnly { :x :y |
		x.allSatisfy { :i |
			y.includes(i)
		}
	}

	count { :self :aBlock/1 |
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

	countDistinct { :self :aBlock/2 |
		let set = UnsortedSet();
		set.comparator := aBlock/2;
		self.do { :each |
			set.include!(each)
		};
		set.size
	}

	countIntegers { :self :operand |
		let [p, q] = operand;
		let answer = List(q - p + 1, 0);
		self.do { :each |
			(
				each >= p & {
					each <= q
				}
			).ifTrue {
				let index = each - p + 1;
				answer[index] := answer[index] + 1
			}
		};
		answer
	}

	countOccurences { :self :anObject |
		self.count { :each |
			each = anObject
		}
	}

	deepAllSatisfy { :self :aBlock/1 |
		withReturn { :return/1 |
			self.deepDo { :each |
				each.aBlock.ifFalse {
					false.return
				}
			};
			true
		}
	}

	deepDo { :self :aBlock/1 |
		let type = self.typeName;
		self.do { :each |
			(each.typeName = type).if {
				each.deepDo(aBlock/1)
			} {
				aBlock(each)
			}
		}
	}

	deepInjectInto { :self :initialValue :aBlock/2 |
		self.injectIntoBy(initialValue, aBlock/2, deepDo/2)
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

	deepReduce { :self :aBlock/2 |
		self.reduceBy(aBlock/2, deepDo/2)
	}

	deepSum { :self |
		self.deepReduce(+)
	}

	detect { :self :aBlock/1 |
		self.detectIfNone(aBlock/1) {
			self.error('@Do>>detect: not found')
		}
	}

	detect { :self :count :aBlock/1 |
		let answer = [];
		withReturn { :return/1 |
			self.do { :each |
				aBlock(each).ifTrue {
					answer.add!(each);
					count := count - 1;
					(count < 1).ifTrue {
						answer.return
					}
				}
			};
			self.error('detect')
		}
	}

	detectIfFound { :self :aBlock/1 :foundBlock/1 |
		self.detectIfFoundIfNone(aBlock/1, foundBlock/1) {
			nil
		}
	}

	detectIfFoundIfNone { :self :aBlock/1 :foundBlock/1 :exceptionBlock/0 |
		self.detectIfFoundIfNoneUsing(aBlock/1, foundBlock/1, exceptionBlock/0, do/2)
	}

	detectIfFoundIfNoneUsing { :self :aBlock/1 :foundBlock/1 :exceptionBlock/0 :doBlock/2 |
		withReturn { :return/1 |
			doBlock(self) { :each |
				aBlock(each).ifTrue {
					foundBlock(each).return
				}
			};
			exceptionBlock()
		}
	}

	detectIfNone { :self :aBlock/1 :whenAbsent/0 |
		self.detectIfFoundIfNone(aBlock/1, identity/1, whenAbsent/0)
	}

	detectMax { :self :aBlock/1 |
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

	detectMin { :self :aBlock/1 |
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

	detectSum { :self :aBlock/1 |
		let sum = 0;
		self.do { :each |
			sum := sum + aBlock(each)
		};
		sum
	}

	do { :self :aBlock/1 |
		self.typeResponsibility('@Do>>do')
	}

	doSeparatedBy { :self :elementBlock/1 :separatorBlock/0 |
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

	doWithBreak { :self :aBlock/2 |
		withReturn { :return/1 |
			let break = {
				nil.return
			};
			self.do { :each |
				aBlock(each, break/0)
			}
		}
	}

	doWithout { :self :aBlock/1 :anItem |
		self.do { :each |
			(anItem = each).ifFalse {
				aBlock(each)
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

	includesBy { :self :anObject :aBlock/2 |
		self.anySatisfy { :each |
			aBlock(each, anObject)
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

	injectInto { :self :initialValue :aBlock/2 |
		self.injectIntoBy(initialValue, aBlock/2, do/2)
	}

	injectIntoBy { :self :initialValue :aBlock/2 :doBlock/2 |
		let nextValue = initialValue;
		doBlock(self) { :each |
			nextValue := aBlock(nextValue, each)
		};
		nextValue
	}

	isDuplicateFree { :self :comparator/2 :aBlock/1 |
		withReturn { :return/1 |
			let items = comparator/2.comparatorToEmptySet;
			self.do { :x |
				let y = aBlock(x);
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

	items { :self :aBlock/2 |
		let answer = [];
		aBlock(self) { :each |
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

	levelBy { :self :aBlock/1 |
		let answer = [];
		self.withLevelDo { :each :level |
			aBlock(level).ifTrue {
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

	maximalBy { :self :aBlock/1 |
		let z = self.collect(aBlock/1);
		let i = z.indicesOf(z.max);
		self.selectIndices(i)
	}

	[maximum, max] { :self |
		self.reduce(max/2)
	}

	minBy { :self :aBlock/2 |
		self.reduce { :p :q |
			aBlock(p, q).if {
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

	minimalBy { :self :aBlock/1 |
		let z = self.collect(aBlock/1);
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
		let tally = 0;
		self.do { :each |
			(anObject = each).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	oneSatisfies { :self :aBlock/1 |
		self.count(aBlock/1) = 1
	}

	[or, |] { :self |
		self.anySatisfy(nullaryApply/1)
	}

	product { :self :aBlock/1 |
		self.isEmpty.if {
			1
		} {
			let a = aBlock(self.first);
			let b = self.allButFirst;
			b.injectInto(a) { :i :j |
				i * aBlock(j)
			}
		}
	}

	product { :self |
		self.ifEmpty {
			1
		} {
			self.reduce(times/2)
		}
	}

	range { :self |
		self.max - self.min
	}

	reduce { :self :aBlock/2 |
		self.reduceBy(aBlock/2, do/2)
	}

	reduceBy { :self :aBlock/2 :iterationBlock/2 |
		let isFirst = true;
		let nextValue = nil;
		self.iterationBlock { :each |
			isFirst.if {
				nextValue := each;
				isFirst := false
			} {
				nextValue := aBlock(nextValue, each)
			}
		};
		isFirst.ifTrue {
			self.error('@Do>>reduceBy: empty collection')
		};
		nextValue
	}

	rejectThenDo { :self :rejectBlock/1 :doBlock/1 |
		self.do { :each |
			rejectBlock(each).ifFalse {
				doBlock(each)
			}
		}
	}

	selectThenDo { :self :selectBlock/1 :doBlock/1 |
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

	sum { :self :aBlock/1 |
		self.isEmpty.if {
			0
		} {
			let a = aBlock(self.first);
			let b = self.allButFirst;
			b.injectInto(a) { :i :j |
				i + aBlock(j)
			}
		}
	}

	sum { :self |
		self.reduce(plus/2)
	}

	sumOfSquares { :self |
		self.sum(square/1)
	}

	withLevelDo { :self :aBlock/2 :level |
		let type = self.typeName;
		self.do { :each |
			(each.typeName = type).if {
				each.withLevelDo(aBlock/2, level + 1);
				aBlock(each, level)
			} {
				aBlock(each, level)
			}
		}
	}

	withLevelDo { :self :aBlock/2 |
		self.withLevelDo(aBlock/2, 1);
		aBlock(self, 0);
		nil
	}

}
