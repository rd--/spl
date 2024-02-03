{- Require: Object -}

@Collection {

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

	asArray { :self |
		let array = Array(self.size);
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
		self.cartesianProductDo(aCollection) { :x :y |
			answer.add([x, y])
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

	copyWithoutDuplicates { :self |
		let seen = Set();
		self.select { :each |
			seen.ifAbsentAdd(each)
		}
	}

	clip { :self :min :max |
		self.collect { :each |
			each.clip(min, max)
		}
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
		self.isEmpty.if {
			'Any'
		} {
			valueWithReturn { :return:/1 |
				let answer = self.anyOne.typeOf;
				self.do { :each |
					(answer = each.typeOf).ifFalse {
						'Any'.return
					}
				};
				answer
			}
		}
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

	isEmpty { :self |
		self.size = 0
	}

	isOfSameSizeCheck { :self :otherCollection |
		(otherCollection.size = self.size).ifFalse {
			self.error('@Collection>>isOfSameSizeCheck')
		}
	}

	isSequenceable { :self |
		false
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

	ofSize { :self :aNumber |
		(self.size = aNumber).ifFalse {
			self.error('@Collection>>ofSize')
		};
		self
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	reject { :self :aBlock:/1 |
		self.select { :element |
			aBlock(element).not
		}
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
		self.asArray.sort
	}

	sorted { :self :sortBlock:/2 |
		self.asArray.sortBy(sortBlock:/2)
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

}

+@Collection {

	abs { :self |
		self.collect(abs:/1)
	}

	arCosh { :self |
		self.collect(arCosh:/1)
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

	exp { :self |
		self.collect(exp:/1)
	}

	floor { :self |
		self.collect(floor:/1)
	}

	fractionPart { :self |
		self.collect(fractionPart:/1)
	}

	gcd { :self |
		self.reduce(gcd:/2)
	}

	harmonicNumber { :self |
		self.collect(harmonicNumber:/1)
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

	negated { :self |
		self.collect(negated:/1)
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

	isCollection { :self |
		false
	}

}
