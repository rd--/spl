@Collection {

	# { :self |
		self.size
	}

	+ { :self :anObject |
		self.collect(+.bindRight(anObject))
	}

	- { :self :anObject |
		self.collect(-.bindRight(anObject))
	}

	* { :self :anObject |
		self.collect(*.bindRight(anObject))
	}

	/ { :self :anObject |
		self.collect(/.bindRight(anObject))
	}

	^ { :self :anObject |
		self.collect(^.bindRight(anObject))
	}

	% { :self :anObject |
		self.collect(%.bindRight(anObject))
	}

	++ { :self :aCollection |
		let answer = self.copy;
		answer.addAll(aCollection.assertIsCollection);
		answer
	}

	adaptToIntegerAndApply { :self :anInteger :aBlock:/2 |
		self.collect { :each |
			aBlock(anInteger, each)
		}
	}

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

	allEqualBy { :self :aBlock:/2 |
		self.isEmpty.if {
			true
		} {
			let item = self.anyOne;
			self.allSatisfy { :each |
				aBlock(each, item)
			}
		}
	}

	allEqual { :self |
		self.allEqualBy(=)
	}

	any { :self :numberOfElements |
		self.anyAs(numberOfElements, self.species)
	}

	anyAs { :self :numberOfElements :aBlock:/1 |
		let index = 0;
		let result = numberOfElements.aBlock;
		valueWithReturn { :return:/1 |
			result.fillFromWith(self) { :each |
				index := index + 1;
				(index > numberOfElements).if {
					result.return
				} {
					each
				}
			};
			(index = numberOfElements).ifFalse {
				self.error('@Collection>>any: Not enough elements in collection')
			};
			result
		}
	}

	asList { :self |
		let answer = List(self.size);
		let index = 1;
		self.do { :each |
			answer[index] := each;
			index := index + 1
		};
		answer
	}

	asCollection { :self |
		self
	}

	assertIsCollection { :self |
		self
	}

	atLevelCollect { :self :level :aBlock:/1 |
		let levelPredicate:/1 = level.isCollection.if {
			{ :each | level.includes(each) }
		} {
			{ :each | each = level }
		};
		self.withLevelCollect { :each :thisLevel |
			levelPredicate(thisLevel).if {
				aBlock(each)
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

	cartesianProductDo { :self :aCollection :aBlock:/2 |
		self.do { :x |
			aCollection.do { :y |
				aBlock(x, y)
			}
		}
	}

	cartesianProduct { :self :aCollection |
		let answer = [];
		self.cartesianProductDo(aCollection) { :i :j |
			answer.add([i, j])
		};
		answer
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.add(aBlock(each))
		};
		answer
	}

	collectCatenate { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.addAll(aBlock(each))
		};
		answer
	}

	collectInto { :self :aBlock :aCollection |
		aCollection.fillFromWith(self, aBlock)
	}

	collectThenDo { :self :collectBlock:/1 :doBlock:/1 |
		self.collect(collectBlock:/1).do(doBlock:/1)
	}

	collectThenSelect { :self :collectBlock:/1 :selectBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			let item = collectBlock(each);
			selectBlock(item).ifTrue {
				answer.add(item)
			}
		};
		answer
	}

	complement { :self :aCollection |
		let answer = self.species.new;
		self.do { :each |
			aCollection.includes(each).ifFalse {
				answer.add(each)
			}
		};
		answer
	}

	concisePrintString { :self |
		'% (size: %)'.format([
			self.typeOf.withIndefiniteArticle,
			self.size
		])
	}

	copyList { :self |
		self.asList
	}

	copyWith { :self :newElement |
		let answer = self.copy;
		answer.add(newElement);
		answer
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
		let seen = IdentitySet();
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.basicInclude(each);
				true
			}
		}
	}

	clip { :self :minMax |
		self.collect { :each |
			each.clip(minMax)
		}
	}

	clip { :self |
		self.clip([-1 1])
	}

	countsBy { :self :aBlock:/1 |
		self.groupBy(aBlock:/1).collect(size:/1)
	}

	cubeRoot { :self |
		self.collect(cubeRoot:/1)
	}

	deepCollect { :self :aBlock:/1 |
		let type = self.typeOf;
		self.collect { :each |
			(each.typeOf = type).if {
				each.deepCollect(aBlock:/1)
			} {
				aBlock(each)
			}
		}
	}

	deleteDuplicates { :self :aBlock:/2 |
		self.nubBy(aBlock:/2)
	}

	deleteDuplicates { :self |
		self.nub
	}

	depth { :self |
		self.isEmpty.if {
			2
		} {
			1 + self.collect(depth:/1).max
		}
	}

	difference { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	differenceAll { :self :aCollection :aBlock:/2 |
		self.reject { :each |
			aCollection.anySatisfy { :subCollection |
				subCollection.includesBy(each, aBlock:/2)
			}
		}
	}

	differenceAll { :self :aCollection |
		self.differenceAll(aCollection, =)
	}

	discreteDelta { :self |
		self.allSatisfy(isZero:/1).if {
			1
		} {
			0
		}
	}

	doesNotInclude { :self :anObject |
		self.includes(anObject).not
	}

	elementType { :self |
		self.elementTypeIfAbsent {
			nil
		}
	}

	elementTypeIfAbsent { :self :aBlock:/0 |
		self.isEmpty.if {
			aBlock()
		} {
			let answer = self.anyOne.typeOf;
			self.allSatisfy { :each |
				each.typeOf = answer
			}.if {
				answer
			} {
				aBlock()
			}
		}
	}

	elementTypes { :self |
		let answer = IdentitySet();
		self.do { :each |
			answer.include(each.typeOf)
		};
		answer
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
		self.error('errorNotFound: ' ++ anObject)
	}

	errorNotIndexed { :self |
		self.error('is not indexed/keyed')
	}

	extendedGcd { :self |
		(self.size < 2).if {
			self.error('@Collection>>extendedGcd')
		} {
			let [g, c] = self[1].extendedGcd(self[2]);
			3.toDo(self.size) { :each |
				let [nextG, nextC] = g.extendedGcd(self[each]);
				g := nextG;
				c.add(nextC.last)
			};
			[g, c]
		}
	}

	fillFrom { :self :aCollection |
		self.fillFromWith(aCollection, identity:/1)
	}

	gcd { :self |
		self.isEmpty.if {
			0
		} {
			self.reduce(gcd:/2)
		}
	}

	groupBy { :self :keyBlock:/1 |
		let result = Map();
		self.do { :each |
			let key = keyBlock(each);
			result.atIfAbsentPut(key) {
				[]
			}.add(each)
		};
		result
	}

	indices { :self |
		nil
	}

	intersection { :self :aCollection |
		self.select { :each |
			aCollection.includes(each)
		}
	}

	intersection { :self |
		let answer = self.species.new;
		self.isEmpty.ifFalse {
			self.anyOne.do { :x |
				self.allSatisfy { :c |
					c.includes(x)
				}.ifTrue {
					answer.add(x)
				}
			}
		};
		answer
	}

	ifEmpty { :self :aBlock:/0 |
		self.isEmpty.if {
			aBlock()
		} {
			self
		}
	}

	ifEmpty { :self :emptyBlock:/0 :notEmptyBlock |
		self.isEmpty.if {
			emptyBlock()
		} {
			notEmptyBlock.cull(self)
		}
	}

	ifEmptyIfNotEmptyDo { :self :emptyBlock:/0 :notEmptyBlock:/1 |
		self.isEmpty.if {
			emptyBlock()
		} {
			notEmptyBlock(self)
		}
	}

	ifNotEmpty { :self :notEmptyBlock |
		self.isEmpty.ifFalse {
			notEmptyBlock.cull(self)
		}
	}

	ifNotEmpty { :self :notEmptyBlock :emptyBlock:/0 |
		self.isEmpty.if {
			emptyBlock()
		} {
			notEmptyBlock.cull(self)
		}
	}

	ifNotEmptyDo { :self :aBlock:/1 |
		self.isEmpty.ifFalse {
			aBlock(self)
		}
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
		self.size = 0
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
			self.error('@Collection>>isOfSameSizeCheck')
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

	maxIfEmpty { :self :aBlock:/0 |
		self.ifEmpty {
			aBlock()
		} {
			self.max
		}
	}

	minIfEmpty { :self :aBlock:/0 |
		self.ifEmpty {
			aBlock()
		} {
			self.min
		}
	}

	normalizeRange { :self :minima :maxima |
		self.rescale([self.min, self.max], [minima, maxima])
	}

	normalizeSignal { :self :minima :maxima |
		let x = self.min.abs.max(self.max.abs);
		self.rescale([x.negate, x], [minima, maxima])
	}

	normalizeSignal { :self |
		self.normalizeSignal(-1, 1)
	}

	normalizeSum { :self |
		self / self.sum
	}

	not { :self |
		self.collect(not:/1)
	}

	nub { :self |
		self.nubBy(=)
	}

	nubBy { :self :aBlock:/2 |
		(aBlock:/2 == equalsSignEqualsSign:/2).if {
			self.nubIdentical
		} {
			let seen = [];
			self.select { :each |
				seen.includesBy(each, aBlock:/2).if {
					false
				} {
					seen.add(each);
					true
				}
			}
		}
	}

	nubIdentical { :self |
		let seen = IdentitySet();
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.include(each);
				true
			}
		}
	}

	ofSize { :self :aNumber |
		(self.size = aNumber).ifFalse {
			self.error('@Collection>>ofSize')
		};
		self
	}

	one { :self |
		self.collect { :each |
			each.one
		}
	}

	powerSetDo { :self :aBlock:/1 |
		let size = 2 ^ self.size;
		let powersOfTwo = 2 ^ (0 .. (self.size - 1));
		let list = self.asList;
		0.toDo(size - 1) { :i |
			let subset = self.species.new;
			powersOfTwo.withIndexDo { :each :j |
				(i // each % 2 != 0).ifTrue {
					subset.include(list[j])
				}
			};
			aBlock(subset)
		};
		self
	}

	powerSet { :self |
		let answer = [];
		self.powerSetDo { :each |
			answer.add(each)
		};
		answer
	}

	pseudoSlotNameList { :self |
		['size']
	}

	randomChoice { :self :r :shape |
		{
			let randomIndex = r.nextRandomInteger(1, self.size);
			let index = 1;
			valueWithReturn { :return:/1 |
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

	reject { :self :aBlock:/1 |
		self.select { :element |
			aBlock(element).not
		}
	}

	rescale { :self :a :b |
		self.collect(rescaleBlock(a, b))
	}

	rescale { :self :a |
		self.rescale(a, [0, 1])
	}

	rescale { :self |
		self.rescale([self.deepMin, self.deepMax], [0, 1])
	}

	select { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			aBlock(each).ifTrue {
				answer.include(each)
			}
		};
		answer
	}

	selectThenCollect { :self :selectBlock:/1 :collectBlock:/1 |
		let answer = self.species.new;
		self.selectThenDo(selectBlock:/1) { :each |
			answer.add(collectBlock(each))
		};
		answer
	}

	subsets { :self :aBlock:/1 |
		let answer = [];
		self.powerSetDo { :each |
			aBlock(each).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	sum { :self |
		self.isEmpty.if {
			0
		} {
			self.reduce(+)
		}
	}

	symmetricDifference { :self :aCollection |
		self.difference(aCollection).union(
			aCollection.difference(self)
		)
	}

	take { :self :maxNumberOfElements |
		self.any(maxNumberOfElements.min(self.size))
	}

	tally { :self :aBlock:/2 |
		let answer = [];
		self.do { :each |
			answer.detectIndexIfFoundIfNone { :item |
				aBlock(item.key,each)
			} { :index |
				let association = answer[index];
				association.value := association.value + 1
			} {
				answer.add(each -> 1)
			}
		};
		answer
	}

	tally { :self |
		self.tally(=)
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
		let answer = self.anyOne.species.new;
		self.do { :each |
			answer.includeAll(each)
		};
		answer
	}

	unique { :self |
		self.nub
	}

	withLevelCollect { :self :aBlock:/2 :level |
		let type = self.typeOf;
		self.collect { :each |
			(each.typeOf = type).if {
				aBlock(each.withLevelCollect(aBlock:/2, level + 1), level)
			} {
				aBlock(each, level)
			}
		}
	}

	withLevelCollect { :self :aBlock:/2 |
		aBlock(self.withLevelCollect(aBlock:/2, 1), 0)
	}

	zero { :self |
		self.collect { :each |
			each.zero
		}
	}

}

+@Object {

	asCollection { :self |
		[self]
	}

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
