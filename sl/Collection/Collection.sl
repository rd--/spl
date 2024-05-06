{- Require: Object -}

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

	\ { :self :aCollection |
		self.difference(aCollection)
	}

	++ { :self :aCollection |
		let answer = self.copy;
		answer.addAll(aCollection.assertIsCollection);
		answer
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

	arithmeticMean { :self |
		self.sum / self.size
	}

	asList { :self |
		let array = List(self.size);
		let index = 0;
		self.do { :each |
			index := index + 1;
			array[index] := each
		};
		array
	}

	asCollection { :self |
		self
	}

	assertIsCollection { :self |
		self
	}

	assertIsOfSize { :self :anInteger |
		self.assert {
			self.size = anInteger
		}
	}

	associationsDo { :self :aBlock:/1 |
		self.do(aBlock:/1)
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

	atRandom { :self :randomNumberGenerator |
		let randomIndex = self.size.atRandom(randomNumberGenerator);
		let index = 1;
		valueWithReturn { :return:/1 |
			self.do { :each |
				(index = randomIndex).ifTrue {
					each.return
				};
				index := index + 1
			}
		}
	}

	atRandom { :self |
		self.atRandom(system)
	}

	average { :self |
		self.mean
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

	centralMoment { :self :r |
		let mean = self.mean;
		(1 / self.size) * ((self - mean) ^ r).sum
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.new;
		self.do { :each |
			answer.add(aBlock(each))
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

	contraharmonicMean { :self |
		self.squared.sum / self.sum
	}

	contents { :self |
		self
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
		let seen = Set();
		self.select { :each |
			seen.includes(each).if {
				false
			} {
				seen.basicInclude(each);
				true
			}
		}
	}

	clip { :self :min :max |
		self.collect { :each |
			each.clip(min, max)
		}
	}

	clip { :self |
		self.clip(-1, 1)
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
		1 + self.collect(depth:/1).max
	}

	difference { :self :aCollection |
		self.reject { :each |
			aCollection.includes(each)
		}
	}

	differenceAll { :self :aCollection |
		self.reject { :each |
			aCollection.anySatisfy { :subCollection |
				subCollection.includes(each)
			}
		}
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
		let types = self.elementTypes;
		(types.size = 1).if {
			types.anyOne
		} {
			aBlock()
		}
	}

	elementTypes { :self |
		let answer = Set();
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
		self.reduce(gcd:/2)
	}

	geometricMean { :self |
		self.product ^ (1 / self.size)
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

	harmonicMean { :self |
		self.size / self.reciprocal.sum
	}

	histogramOf { :self |
		self.histogramOf { :each |
			each
		}
	}

	include { :self :anObject |
		self.typeResponsibility('@Collection>>include')
	}

	includeAll { :self :aCollection |
		aCollection.do { :each |
			self.include(each)
		}
	}

	indices { :self |
		nil
	}

	intersection { :self :aCollection |
		self.select { :each |
			aCollection.includes(each)
		}
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

	ifNotEmpty { :self :aBlock |
		self.isEmpty.ifFalse {
			aBlock.cull(self)
		}
	}

	ifNotEmptyDo { :self :aBlock:/1 |
		self.isEmpty.ifFalse {
			aBlock(self)
		}
	}

	interquartileRange { :self :a :b :c :d |
		let [q1, q2, q3] = self.quartiles(a, b, c, d);
		q3 - q1
	}

	interquartileRange { :self |
		let [q1, q2, q3] = self.quartiles;
		q3 - q1
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

	isOfSameSizeCheck { :self :otherCollection |
		(otherCollection.size = self.size).ifFalse {
			self.error('@Collection>>isOfSameSizeCheck')
		}
	}

	isSequence { :self |
		false
	}

	kroneckerDelta { :self |
		self.allEqual.boole
	}

	kurtosis { :self |
		self.isVector.if {
			self.centralMoment(4) / (self.centralMoment(2) ^ 2)
		} {
			self.isMatrix.if {
				self.transposed.collect(kurtosis:/1)
			} {
				'@Collection>>kurtosis: not vector or matrix'.error
			}
		}
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

	levelBy { :self :aBlock:/1 |
		let answer = [];
		self.withLevelDo { :each :level |
			aBlock(level).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	levelEach { :self :aCollection |
		self.levelBy { :level |
			aCollection.includes(level)
		}
	}


	level { :self :anInteger |
		self.levelBy { :level |
			level = anInteger
		}
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

	mean { :self |
		self.sum / self.size
	}

	meanDeviation { :self |
		let mean = self.mean;
		(self - mean).abs.sum / self.size
	}

	moment { :self :r |
		(1 / self.size) * (self ^ r).sum
	}

	not { :self |
		self.collect(not:/1)
	}

	notEmpty { :self |
		self.isEmpty.not
	}

	nubBy { :self :aBlock:/2 |
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

	nub { :self |
		self.nubBy(=)
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
		let powersOfTwo = 2 ^ (0 .. self.size - 1);
		let list = self.asList;
		(0 .. size - 1).do { :i |
			let subset = self.species.new;
			powersOfTwo.withIndexDo { :each :j |
				(i // each % 2 ~= 0).ifTrue {
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

	quantile { :self :p :a :b :c :d |
		self.isVector.if {
			self.asSortedList.quantile(p, a, b, c, d)
		} {
			self.isMatrix.if {
				self.transposed.collect { :each |
					each.asSortedList.quantile(p, a, b, c, d)
				}
			} {
				'Collection>>quantile: not vector or matrix'
			}
		}
	}

	quantile { :self :p |
		self.quantile(p, 0, 0, 1, 0)
	}

	quartiles { :self :a :b :c :d |
		self.quantile([1 2 3] / 4, a, b, c, d)
	}

	quartiles { :self |
		self.quartiles(1 / 2, 0, 0, 1)
	}

	reject { :self :aBlock:/1 |
		self.select { :element |
			aBlock(element).not
		}
	}

	randomSampleSmallPool { :self :count :randomNumberGenerator |
		let pool = self.asList;
		let answer = [];
		(count > self.size).ifTrue {
			count := self.size
		};
		{
			count > 0
		}.whileTrue {
			let next = pool.atRandom(randomNumberGenerator);
			answer.add(next);
			pool.remove(next);
			count := count - 1
		};
		answer
	}

	randomSampleLargePool { :self :count :randomNumberGenerator |
		let answer = [];
		(count > self.size).ifTrue {
			count := self.size
		};
		{
			count > 0
		}.whileTrue {
			let next = self.atRandom(randomNumberGenerator);
			answer.includes(next).ifFalse {
				answer.add(next);
				count := count - 1
			}
		};
		answer
	}

	randomSample { :self :count :randomNumberGenerator |
		self.randomSampleLargePool(count, randomNumberGenerator)
	}

	randomSample { :self :count |
		self.randomSample(count, system)
	}

	rescale { :self :min :max :ymin :ymax |
		self.collect { :each |
			each.rescale(min, max, ymin, ymax)
		}
	}

	rescale { :self :min :max |
		self.rescale(min, max, 0, 1)
	}

	rescale { :self |
		self.rescale(self.min, self.max, 0, 1)
	}

	rootMeanSquare { :self |
		self.squared.sum.sqrt / 2
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

	skewness { :self |
		self.isVector.if {
			self.centralMoment(3) / (self.centralMoment(2) ^ (3 / 2))
		} {
			self.isMatrix.if {
				self.transposed.collect(skewness:/1)
			} {
				'@Collection>>skewness: not vector or matrix'.error
			}
		}
	}

	sorted { :self |
		self.asList.sort
	}

	sorted { :self :sortBlock:/2 |
		self.asList.sortBy(sortBlock:/2)
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

	standardDeviation { :self |
		self.variance.sqrt
	}

	symmetricDifference { :self :aCollection |
		self.difference(aCollection).union(
			aCollection.difference(self)
		)
	}

	take { :self :maxNumberOfElements |
		self.any(maxNumberOfElements.min(self.size))
	}

	union { :self :aCollection |
		let answer = self.asSet;
		answer.includeAll(aCollection);
		answer
	}

	variance { :self |
		((self - self.mean) ^ 2).sum / (self.size - 1)
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

	withLevelDo { :self :aBlock:/2 :level |
		let type = self.typeOf;
		self.do { :each |
			(each.typeOf = type).if {
				each.withLevelDo(aBlock:/2, level + 1);
				aBlock(each, level)
			} {
				aBlock(each, level)
			}
		}
	}

	withLevelDo { :self :aBlock:/2 |
		self.withLevelDo(aBlock:/2, 1);
		aBlock(self, 0)
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

	isCollection { :self |
		false
	}

}
