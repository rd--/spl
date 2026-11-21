@Collection {

	abbreviatedPrintString { :self |
		'% (size: %)'.format(
			[
				self.typeName.withIndefiniteArticle,
				self.size.concisePrintString
			]
		)
	}

	[adaptToIntegerAndApply, adaptToNumberAndApply] { :self :operand :aFunction/2 |
		self.collect { :each |
			aFunction(operand, each)
		}
	}

	[allEqual, =] { :self |
		self.allEqualBy(isEqual/2)
	}

	allEqualBy { :self :aFunction/2 |
		self.isEmpty.if {
			true
		} {
			let item = self.anyOne;
			self.allSatisfy { :each |
				aFunction(each, item)
			}
		}
	}

	allEqualTo { :self :anObject |
		self.allSatisfy { :each |
			each = anObject
		}
	}

	any { :self :numberOfElements |
		self.anyAs(numberOfElements, self.species)
	}

	anyAs { :self :numberOfElements :aFunction/1 |
		let index = 0;
		let result = aFunction(numberOfElements);
		withReturn { :return/1 |
			result.fillFromWith!(self) { :each |
				index := index + 1;
				(index > numberOfElements).if {
					result.return
				} {
					each
				}
			};
			(index = numberOfElements).ifFalse {
				self.error('any: Not enough elements in collection')
			};
			result
		}
	}

	assertIsCollection { :self |
		self
	}

	atLevelCollect { :self :level :aFunction/1 |
		let levelPredicate/1 = level.isCollection.if {
			{ :each | level.includes(each) }
		} {
			{ :each | each = level }
		};
		self.withLevelCollect { :each :thisLevel |
			levelPredicate(thisLevel).if {
				aFunction(each)
			} {
				each
			}
		}
	}

	atRandom { :self |
		self.randomChoice(system, [])
	}

	capacity { :self |
		self.size
	}

	collect { :self :aFunction/1 |
		let answer = self.new;
		self.do { :each |
			answer.add!(aFunction(each))
		};
		answer
	}

	collectCatenate { :self :aFunction/1 |
		let answer = self.new;
		self.do { :each |
			answer.addAll!(aFunction(each))
		};
		answer
	}

	collectInto! { :self :aFunction/1 :aCollection |
		aCollection.fillFromWith!(self, aFunction/1)
	}

	collectThenDo { :self :collectFunction/1 :doFunction/1 |
		let answer = self.collect(collectFunction/1);
		answer.do(doFunction/1);
		answer
	}

	collectThenSelect { :self :collectFunction/1 :selectFunction/1 |
		let answer = self.new;
		self.do { :each |
			let item = collectFunction(each);
			selectFunction(item).ifTrue {
				answer.add!(item)
			}
		};
		answer
	}

	complement { :self :aCollection |
		let answer = self.new;
		self.do { :each |
			aCollection.includes(each).ifFalse {
				answer.add!(each)
			}
		};
		answer
	}

	copyList { :self |
		self.List
	}

	copyWithout { :self :oldElement |
		self.reject { :each |
			each = oldElement
		}
	}

	copyWithoutAll { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	copyWithoutIdenticalElements { :self |
		let seen = Set([], ==);
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.uncheckedInclude!(each);
				true
			}
		}
	}

	countsBy { :self :aFunction/1 |
		self.groupBy(aFunction/1).collect(size/1)
	}

	cubeRoot { :self |
		self.collect(cubeRoot/1)
	}

	deepCollect { :self :aFunction/1 |
		let type = self.typeName;
		self.collect { :each |
			(each.typeName = type).if {
				each.deepCollect(aFunction/1)
			} {
				aFunction(each)
			}
		}
	}

	deleteDuplicates { :self :comparator/2 |
		comparator/2.isStandardComparator.if {
			self.nub(comparator/2)
		} {
			let seen = [];
			self.select { :each |
				seen.includesBy(each, comparator/2).if {
					false
				} {
					seen.add!(each);
					true
				}
			}
		}
	}

	[deleteDuplicates, nub] { :self |
		self.deleteDuplicates(=)
	}

	depth { :self |
		self.isEmpty.if {
			2
		} {
			1 + self.collect(depth/1).max
		}
	}

	difference { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	differenceAll { :self :aCollection :aFunction/2 |
		self.reject { :each |
			aCollection.anySatisfy { :subCollection |
				subCollection.includesBy(each, aFunction/2)
			}
		}
	}

	differenceAll { :self :aCollection |
		self.differenceAll(aCollection, isEqual/2)
	}

	discreteDelta { :self |
		self.allSatisfy(isZero/1).if {
			1
		} {
			0
		}
	}

	doesNotInclude { :self :anObject |
		self.includes(anObject).not
	}

	[elementType, elementTypeIfAbsent] { :self :aFunction/0 |
		self.isEmpty.if {
			aFunction()
		} {
			let answer = self.anyOne.typeName;
			self.allSatisfy { :each |
				each.typeName = answer
			}.if {
				answer
			} {
				aFunction()
			}
		}
	}

	elementType { :self |
		self.elementTypeIfAbsent {
			nil
		}
	}

	elementTypes { :self |
		let answer = IdentitySet();
		self.do { :each |
			answer.include!(each.typeName)
		};
		answer.List
	}

	emptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyCollection
		}
	}

	errorEmptyCollection { :self |
		self.error('errorEmptyCollection')
	}

	errorNotFound { :self :anObject |
		self.error('errorNotFound', [anObject])
	}

	errorNotIndexed { :self |
		self.error('is not indexed/keyed')
	}

	extendedGcd { :self |
		(self.size < 2).if {
			self.error('@extendedGcd: size<2')
		} {
			let [g, c] = self[1].extendedGcd(self[2]);
			3.toDo(self.size) { :each |
				let [nextG, nextC] = g.extendedGcd(self[each]);
				g := nextG;
				c.add!(nextC.last)
			};
			[g, c]
		}
	}

	fillFrom! { :self :aCollection |
		self.fillFromWith!(aCollection, identity/1)
	}

	gcd { :self |
		self.isEmpty.if {
			0
		} {
			self.reduce(gcd/2)
		}
	}

	groupBy { :self :keyFunction/1 |
		let result = Map();
		self.do { :each |
			let key = keyFunction(each);
			result.atIfAbsentPut!(key) {
				[]
			}.add!(each)
		};
		result
	}

	ifEmpty { :self :aFunction/0 |
		self.isEmpty.if {
			aFunction()
		} {
			self
		}
	}

	ifEmpty { :self :emptyFunction/0 :notEmptyFunction/0 |
		self.isEmpty.if {
			emptyFunction()
		} {
			notEmptyFunction()
		}
	}

	ifEmptyIfNotEmptyDo { :self :emptyFunction/0 :f/1 |
		self.isEmpty.if {
			emptyFunction()
		} {
			self.do(f/1)
		}
	}

	ifNotEmpty { :self :notEmptyFunction/0 |
		self.isEmpty.ifFalse {
			notEmptyFunction()
		}
	}

	ifNotEmpty { :self :notEmptyFunction/0 :emptyFunction/0 |
		self.isEmpty.if {
			emptyFunction()
		} {
			notEmptyFunction()
		}
	}

	ifNotEmptyDo { :self :f/1 |
		self.isEmpty.ifFalse {
			self.do(f/1)
		}
	}

	intersection { :self :aCollection |
		self.select { :each |
			aCollection.includes(each)
		}
	}

	intersection { :self |
		let answer = self.new;
		self.isEmpty.ifFalse {
			self.anyOne.do { :x |
				self.allSatisfy { :c |
					c.includes(x)
				}.ifTrue {
					answer.add!(x)
				}
			}
		};
		answer
	}

	isAtom { :self |
		false
	}

	isCollection { :self |
		true
	}

	isDisjoint { :self :aCollection |
		self.noneSatisfy { :each |
			aCollection.includes(each)
		}
	}

	isEmpty { :self |
		self.size.isZero
	}

	isIntersecting { :self :aCollection |
		self.anySatisfy { :each |
			aCollection.includes(each)
		}
	}

	isNotEmpty { :self |
		self.size > 0
	}

	isOfSameSizeCheck { :self :otherCollection |
		(otherCollection.size = self.size).ifFalse {
			self.error('isOfSameSizeCheck: not same size', [otherCollection])
		}
	}

	isSingleton { :self |
		self.size = 1
	}

	kroneckerDelta { :self |
		self.allEqual.boole
	}

	leafCount { :self |
		self.collect { :each |
			each.isCollection.if {
				each.leafCount
			} {
				1
			}
		}.sum
	}

	logSumExp { :self |
		/* self.exp.sum.log */
		let m = self.max;
		m + (self - m).exp.sum.log
	}

	maxIfEmpty { :self :aFunction/0 |
		self.ifEmpty {
			aFunction()
		} {
			self.max
		}
	}

	minIfEmpty { :self :aFunction/0 |
		self.ifEmpty {
			aFunction()
		} {
			self.min
		}
	}

	normalizeRange { :self :minMax |
		let [i, j] = self.minMax;
		(i = j).if {
			let n = self.size;
			let [p, q] = minMax;
			(i < p).if {
				List(n, p)
			} {
				(j > q).if {
					List(n, q)
				} {
					self
				}
			}
		} {
			self.rescale([i, j], minMax)
		}
	}

	normalizeSignal { :self :minMax |
		let x = self.min.abs.max(self.max.abs);
		self.rescale([x.negate, x], minMax)
	}

	normalizeSignal { :self |
		self.normalizeSignal([-1.0 1.0])
	}

	normalizeSum { :self |
		self / self.sum
	}

	not { :self |
		self.collect(not/1)
	}

	[nub, unique] { :self :comparator/2 |
		let seen = comparator/2.comparatorToSetOrList;
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.include!(each);
				true
			}
		}
	}

	one { :self |
		self.collect { :each |
			each.one
		}
	}

	powerSet { :self |
		let answer = [];
		self.powerSetDo { :each |
			answer.add!(each)
		};
		answer
	}

	powerSetDo { :self :aFunction/1 |
		let size = 2 ^ self.size;
		let powersOfTwo = 2 ^ 0.to(self.size - 1);
		let list = self.List;
		0.toDo(size - 1) { :i |
			let subset = self.new;
			powersOfTwo.withIndexDo { :each :j |
				(i // each % 2 != 0).ifTrue {
					subset.include!(list[j])
				}
			};
			aFunction(subset)
		}
	}

	pseudoSlotNameList { :self |
		['size']
	}

	randomChoice { :self :r :shape |
		{
			let randomIndex = r.nextRandomSmallInteger(1, self.size);
			let index = 1;
			withReturn { :return/1 |
				self.do { :each |
					(index = randomIndex).ifTrue {
						each.return
					};
					index := index + 1
				}
			}
		} ! shape
	}

	rankedMax { :self :n |
		(n < 0).if {
			self.rankedMin(n.negate)
		} {
			let m = self.size;
			self.quantile((m - n + 1) / m)
		}
	}

	rankedMin { :self :n |
		(n < 0).if {
			self.rankedMax(n.negate)
		} {
			self.quantile(n / self.size)
		}
	}

	reject { :self :aFunction/1 |
		self.select { :element |
			aFunction(element).not
		}
	}

	rescale { :self |
		self.rescale(
			[self.deepMin, self.deepMax],
			[0L, 1L]
		)
	}

	selectDuplicates { :c :comparator/2 |
		let d = c.duplicatesSet(comparator/2);
		c.select { :x |
			d.includes(x)
		}
	}

	subsets { :self :aFunction/1 |
		let answer = [];
		self.powerSetDo { :each |
			aFunction(each).ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	sum { :self |
		self.isEmpty.if {
			0L
		} {
			self.reduce(plus/2)
		}
	}

	symmetricDifference { :self :aCollection |
		self.difference(aCollection).union(
			aCollection.difference(self)
		)
	}

	take { :self :maxNumberOfElements |
		self.any(
			maxNumberOfElements.min(self.size)
		)
	}

	tally { :self :aFunction/2 |
		let answer = [];
		self.do { :each |
			answer.detectIndexIfFoundIfNone { :entry |
				aFunction(entry[1], each)
			} { :index |
				let entry = answer[index];
				entry[2] := entry[2] + 1L
			} {
				answer.add!([each, 1L])
			}
		};
		answer
	}

	tally { :self |
		self.tally(isEqual/2)
	}

	threshold { :self :epsilon |
		self.deepCollect { :each |
			(each.abs < epsilon).if {
				each.zero
			} {
				each
			}
		}
	}

	threshold { :self |
		self.threshold(10E-10)
	}

	union { :self |
		let answer = self.anyOne.new;
		self.do { :each |
			answer.includeAll!(each)
		};
		answer
	}

	withLevelCollect { :self :aFunction/2 :level |
		let type = self.typeName;
		self.collect { :each |
			(each.typeName = type).if {
				aFunction(each.withLevelCollect(aFunction/2, level + 1), level)
			} {
				aFunction(each, level)
			}
		}
	}

	withLevelCollect { :self :aFunction/2 |
		aFunction(self.withLevelCollect(aFunction/2, 1), 0)
	}

	zero { :self |
		self.collect { :each |
			each.zero
		}
	}

}

+@Object {

	depth { :self |
		1
	}

	isAtom { :self |
		true
	}

	isCollection { :self |
		false
	}

}
