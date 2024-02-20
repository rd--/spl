{- Require: Object -}

@Collection {

	# { :self |
		self.size
	}

	- { :self |
		self.collect(negated:/1)
	}

	/ { :self |
		self.collect(reciprocal:/1)
	}

	^ { :self |
		e ^ self
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

	atRandom { :self |
		let randomIndex = self.size.atRandom;
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

	atRandom { :self :size |
		{ self.atRandom } ! size
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

	fillFrom { :self :aCollection |
		self.fillFromWith(aCollection, identity:/1)
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

	histogramOf { :self :aBlock:/1 |
		let answer = Bag();
		self.collectInto(aBlock:/1, answer);
		answer
	}

	indices { :self |
		nil
	}

	intersection { :self :aCollection |
		self.select { :each |
			aCollection.includes(each)
		}
	}

	isCollection { :self |
		true
	}

	isCoprime { :self |
		valueWithReturn { :return:/1 |
			1.upToDo(self.size - 1) { :i |
				(i + 1).upToDo(self.size) { :j |
					self[i].isCoprime(self[j]).ifFalse {
						false.return
					}
				}
			};
			true
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

	randomSampleSmallPool { :self :count |
		let pool = self.asList;
		let answer = [];
		(count > self.size).ifTrue {
			count := self.size
		};
		{
			count > 0
		}.whileTrue {
			let next = pool.atRandom;
			answer.add(next);
			pool.remove(next);
			count := count - 1
		};
		answer
	}

	randomSampleLargePool { :self :count |
		let answer = [];
		(count > self.size).ifTrue {
			count := self.size
		};
		{
			count > 0
		}.whileTrue {
			let next = self.atRandom;
			answer.includes(next).ifFalse {
				answer.add(next);
				count := count - 1
			}
		};
		answer
	}

	randomSample { :self :count |
		self.randomSampleLargePool(count)
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
				answer.add(each)
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

	sorted { :self |
		self.asList.sort
	}

	sorted { :self :sortBlock:/2 |
		self.asList.sortBy(sortBlock:/2)
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

+@Collection {

	abs { :self |
		self.collect(abs:/1)
	}

	arcCosh { :self |
		self.collect(arcCosh:/1)
	}

	arcCos { :self |
		self.collect(arcCos:/1)
	}

	arcSin { :self |
		self.collect(arcSin:/1)
	}

	arcTan { :self |
		self.collect(arcTan:/1)
	}

	asFloat { :self |
		self.collect(asFloat:/1)
	}

	bitAnd { :self |
		self.reduce(bitAnd:/2)
	}

	bitOr { :self |
		self.reduce(bitOr:/2)
	}

	boole { :self |
		self.collect(boole:/1)
	}

	ceiling { :self |
		self.collect(ceiling:/1)
	}

	conjugated { :self |
		self.collect(conjugated:/1)
	}

	cos { :self |
		self.collect(cos:/1)
	}

	cosh { :self |
		self.collect(cosh:/1)
	}

	cubed { :self |
		self.collect(cubed:/1)
	}

	degreesToRadians { :self |
		self.collect(degreesToRadians:/1)
	}

	divisors { :self |
		self.collect(divisors:/1)
	}

	doubleFactorial { :self |
		self.collect(doubleFactorial:/1)
	}

	e { :self |
		self.collect(e:/1)
	}

	exp { :self |
		self.collect(exp:/1)
	}

	factorial { :self |
		self.collect(factorial:/1)
	}

	floor { :self |
		self.collect(floor:/1)
	}

	factorInteger { :self |
		self.collect(factorInteger:/1)
	}

	fractionPart { :self |
		self.collect(fractionPart:/1)
	}

	eulerPhi { :self |
		self.collect(eulerPhi:/1)
	}

	gcd { :self |
		self.reduce(gcd:/2)
	}

	harmonicNumber { :self |
		self.collect(harmonicNumber:/1)
	}

	integerDigits { :self :base :count |
		self.collect { :each |
			each.integerDigits(base, count)
		}
	}

	integerDigits { :self |
		self.collect(integerDigits:/1)
	}

	integerPart { :self |
		self.collect(integerPart:/1)
	}

	isGaussianPrime { :self |
		self.collect(isGaussianPrime:/1)
	}

	isPrime { :self |
		self.collect(isPrime:/1)
	}

	lcm { :self |
		self.reduce(lcm:/2)
	}

	log { :self |
		self.collect(log:/1)
	}

	log { :self :base |
		let k = 1 / base.log;
		self.log * k
	}

	log10 { :self |
		self.collect(log10:/1)
	}

	log2 { :self |
		self.collect(log2:/1)
	}

	mixedFractionParts { :self |
		self.collect(mixedFractionParts:/1)
	}

	negative { :self |
		self.collect(negative:/1)
	}

	negated { :self |
		self.collect(negated:/1)
	}

	pi { :self |
		self.collect(pi:/1)
	}

	radiansToDegrees { :self |
		self.collect(radiansToDegrees:/1)
	}

	rounded { :self |
		self.collect(rounded:/1)
	}

	sign { :self |
		self.collect(sign:/1)
	}

	sin { :self |
		self.collect(sin:/1)
	}

	sinh { :self |
		self.collect(sinh:/1)
	}

	sqrt { :self |
		self.collect(sqrt:/1)
	}

	squared { :self |
		self.collect(squared:/1)
	}

	tan { :self |
		self.collect(tan:/1)
	}

	tanh { :self |
		self.collect(tanh:/1)
	}

	truncated { :self |
		self.collect(truncated:/1)
	}

	wrapIndex { :self :size |
		self.collect { :each |
			each.wrapIndex(size)
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
