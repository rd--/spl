{- Require: SmallFloat -}

@Sequence {

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	++ { :self :aSequence |
		self.copyReplaceFromToWith(
			self.size + 1,
			self.size,
			aSequence
		)
	}

	++ { :self |
		let answerSize = self.injectInto(0) { :sum :each |
			sum + each.size
		};
		let answer = self.species.ofSize(answerSize);
		let index = 1;
		self.do { :each |
			each.do { :item |
				answer[index] := item;
				index := index + 1
			}
		};
		answer
	}

	+++ { :self :aSequence |
		self ++.each aSequence
	}

	@* { :self :indexList |
		self.atAll(indexList)
	}

	# { :self :anObject |
		self.replicateEach(anObject)
	}

	! { :self :anObject |
		self.duplicateShape(anObject)
	}

	&& { :self :other |
		self.withCollect(other, &&)
	}

	|| { :self :other |
		self.withCollect(other, ||)
	}

	accumulate { :self |
		self.scan(+)
	}

	adaptToCollectionAndApply { :self :rcvr :aBlock:/2 |
		rcvr.isSequence.if {
			rcvr.withCollect(self) { :rcvrItem :selfItem |
				aBlock(rcvrItem, selfItem)
			}
		} {
			self.error('@Sequence: only sequenceable collections may be combined arithmetically')
		}
	}

	adjacentPairsDo { :self :aBlock:/2 |
		2.toDo(self.size) { :i |
			aBlock(self[i - 1], self[i])
		}
	}

	adjacentPairsCollect { :self :aBlock:/2 |
		let answer = [];
		self.adjacentPairsDo { :p :q |
			answer.add(aBlock(p, q))
		};
		answer
	}

	after { :self :target |
		self.afterIfAbsent(target) {
			self.errorNotFound(target)
		}
	}

	afterIfAbsent { :self :target :exceptionBlock:/0 |
		let index = self.indexOf(target);
		(
			index = 0 | {
				index = self.lastIndex
			}
		).if {
			exceptionBlock()
		} {
			self[index + 1]
		}
	}

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(self.firstIndex + n, self.lastIndex)
	}

	allButFirstAndLast { :self |
		self.allButFirstAndLast(1)
	}

	allButFirstAndLast { :self :n |
		self.copyFromTo(self.firstIndex + n, self.lastIndex - n)
	}

	allButFirstDo { :self :aBlock:/1 |
		(self.firstIndex + 1).toDo(self.lastIndex) { :index |
			aBlock(self[index])
		}
	}

	allButLast { :self |
		self.allButLast(1)
	}

	allButLast { :self :n |
		self.copyFromTo(self.firstIndex, self.lastIndex - n)
	}

	allButLastDo { :self :aBlock:/1 |
		self.firstIndex.toDo(self.lastIndex - 1) { :index |
			aBlock(self[index])
		}
	}

	antidiagonal { :self :k |
		self.isMatrix.if {
			let l = self.shape.min - k.abs;
			(1 .. l).collect { :i |
				let r = l - i + 1 - k.min(0);
				let c = i - k.min(0);
				self[r][c]
			}
		} {
			self.error('@Sequence>>antidiagonal: non matrix argument')
		}
	}

	antidiagonal { :self |
		self.antidiagonal(0)
	}

	asDigitsAtInDo { :self :anInteger :aCollection :aBlock:/1 |
		self.do { :each |
			aCollection[anInteger] := each;
			(anInteger = aCollection.size).if {
				aBlock(aCollection)
			} {
				self.asDigitsAtInDo(anInteger + 1, aCollection, aBlock:/1)
			}
		}
	}

	asDigitsToPowerDo { :self :anInteger :aBlock:/1 |
		let aCollection = List(anInteger);
		self.asDigitsAtInDo(1, aCollection, aBlock:/1)
	}

	asRange { :self |
		self.isEmpty.if {
			Range(1, 0, 1)
		} {
			(self.size = 1).if {
				Range(self.first, self.first, 1)
			} {
				self.isArithmeticSeries.if {
					Range(self.first, self.last, self.second - self.first)
				} {
					self.error('@Sequence>>asRange: not an arithmetic series')
				}
			}
		}
	}

	asRangeList { :self |
		self.isEmpty.if {
			[]
		} {
			(self.size = 1).if {
				[Range(self.first, self.first, 1)]
			} {
				let answer = [];
				let start = self.first;
				let step = self.second - self.first;
				(self.firstIndex + 1).toDo(self.lastIndex) { :i |
					(self[i] - self[i - 1] = step).ifFalse {
						answer.add(Range(start, self[i - 1], step));
						start := self[i];
						(i = self.lastIndex).if {
							answer.add(Range(self.last, self.last, 1));
							start := nil
						} {
							step := self[i + 1] - self[i]
						}
					}
				};
				start.ifNotNil {
					answer.add(Range(start, self.last, step))
				};
				answer
			}
		}
	}

	assertIsSquareMatrix { :self :context |
		self.assert(context) {
			self.isSquareMatrix
		}
	}

	assertShape { :self :shape |
		self.assert {
			self.shape = shape
		}
	}

	atAllUsing { :self :indexList :aBlock:/2 |
		let answer = self.species.ofSize(indexList.size);
		indexList.indicesDo { :index |
			answer[index] := aBlock(self, indexList[index])
		};
		answer
	}

	atAll { :self :indexList |
		self.atAllUsing(indexList, at:/2)
	}

	atAllPut { :self :anObject |
		let size = self.size;
		(size > 50).if {
			self.fromToPut(self.firstIndex, self.lastIndex, anObject)
		} {
			self.indicesDo { :index |
				self[index] := anObject
			}
		};
		anObject
	}

	atFold { :self :index |
		self[self.foldedIndex(index)]
	}

	atFoldAll { :self :indexList |
		self.atAllUsing(indexList, atFold:/2)
	}

	atLastPut { :self :indexFromEnd :anObject |
		self[self.lastIndex + 1 - indexFromEnd] := anObject
	}

	atPin { :self :index |
		self[self.pinnedIndex(index)]
	}

	atPinAll { :self :indexList |
		self.atAllUsing(indexList, atPin:/2)
	}

	atPinPut { :self :index :value |
		self.atPut(self.pinnedIndex(index), value)
	}

	atWrap { :self :index |
		let k = index.wrapBetweenAnd(self.firstIndex, self.lastIndex + 1);
		self[k]
	}

	atWrapAll { :self :indexList |
		self.atAllUsing(indexList, atWrap:/2)
	}

	atWrapPut { :self :index :anObject |
		let k = index.wrapBetweenAnd(self.firstIndex, self.lastIndex + 1);
		self[k] := anObject
	}

	atRandom { :self :randomNumberGenerator |
		let index = randomNumberGenerator.nextRandomInteger(
			self.firstIndex,
			self.lastIndex
		);
		self[index]
	}

	atRandom { :self |
		self.atRandom(system)
	}

	before { :self :target |
		self.beforeIfAbsent(target) {
			self.errorNotFound(target)
		}
	}

	beforeIfAbsent { :self :target :exceptionBlock:/0 |
		let index = self.indexOf(target);
		(index < 2).if {
			exceptionBlock()
		} {
			self[index - 1]
		}
	}

	beginsWith { :self :aSequence |
		aSequence.isSequence.if {
			valueWithReturn { :return:/1 |
				(self.size < aSequence.size).ifTrue {
					false.return
				};
				aSequence.indicesDo { :index |
					(aSequence[index] = self[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			self.error('@Sequencable>>beginsWith: not a sequence')
		}
	}

	beginsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	binaryDistance { :u :v |
		(u = v).boole
	}

	binarySearch { :self :item |
		valueWithReturn { :return:/1 |
			let low = 1;
			let high = self.size;
			{
				low <= high
			}.whileTrue {
				let mid = (low + high) // 2;
				(self[mid] > item).if {
					high := mid - 1
				} {
					(self[mid] < item).if {
						low := mid + 1
					} {
						mid.return
					}
				}
			};
			0
		}
	}

	brayCurtisDistance { :self :aSequence |
		(self - aSequence).abs.sum / (self + aSequence).abs.sum
	}

	canberraDistance { :self :aSequence |
		((self - aSequence).abs / (self.abs + aSequence.abs)).sum
	}

	cartesianIndex { :shape :anInteger |
		(anInteger - 1).mixedRadixEncode(shape).reverse + 1
	}

	chessboardDistance { :self :aSequence |
		(self - aSequence).abs.max
	}

	chineseRemainder { :r :m |
		let p = m.product;
		let q = m.withCollect(r) { :i :j |
			j * (p / i).modularInverse(i) * (p / i)
		}.sum;
		q % p
	}

	collect { :self :aBlock:/1 |
		let answer = self.species.ofSize(self.size);
		self.indicesDo { :index |
			answer[index] := aBlock(self[index])
		};
		answer
	}

	combinationsAtATimeDo { :self :kk :aBlock:/1 |
		let aCollection = List(kk);
		self.combinationsAtInAfterDo(1, aCollection, 0, aBlock:/1)
	}

	combinationsAtInAfterDo { :self :j :aCollection :n :aBlock:/1 |
		(n + 1).toDo(self.size) { :index |
			aCollection[j] := self[index];
			(j = aCollection.size).if {
				aBlock(aCollection)
			} {
				self.combinationsAtInAfterDo(j + 1, aCollection, index, aBlock:/1)
			}
		}
	}

	compare { :self :aSequence |
		let n = self.size;
		let m = aSequence.size;
		valueWithReturn { :return:/1 |
			1.toDo(n.min(m)) { :i |
				let c = self[i] <=> aSequence[i];
				(c ~= 0).ifTrue {
					c.return
				}
			};
			n <=> m
		}
	}

	concatenation { :self |
		self.++
	}

	constantArray { :self :anObject |
		[anObject].reshape(self)
	}

	convergents { :self |
		self.prefixes.collect(fromContinuedFraction:/1)
	}

	coordinateBoundingBox { :self |
		let minimum = self.anyOne.copy;
		let maximum = minimum.copy;
		self.do { :each |
			each.withIndexDo { :n :i |
				(n < minimum[i]).ifTrue {
					minimum[i] := n
				};
				(n > maximum[i]).ifTrue {
					maximum[i] := n
				}
			}
		};
		[minimum, maximum]
	}

	coordinateBounds { :self |
		self.coordinateBoundingBox.transposed
	}

	copyFromTo { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self[index + start - 1]
		}
	}

	copyFromToInto { :self :start :stop :aSequence |
		1.toDo(stop - start + 1) { :index |
			aSequence[index] := self[index + start - 1]
		}
	}

	copyReplaceAllWith { :self :old :new |
		let indexList = self.indicesOfSubstring(old);
		indexList.isEmpty.if {
			self.copy
		} {
			let n = new.size;
			(old.size = n).if {
				let answer = self.copy;
				indexList.do { :i |
					answer.replaceFromToWith(i, i + n - 1, new)
				};
				answer
			} {
				let answer = [];
				let i = 1;
				let k = old.size;
				indexList.do { :j |
					answer.add(self.copyFromTo(i, j - 1));
					answer.add(new);
					i := j + k
				};
				answer.add(self.copyFromTo(i, self.size));
				answer.concatenation
			}
		}
	}

	copyReplaceFromToWith { :self :start :stop :aCollection |
		let end = start - 1 + aCollection.size;
		let newSize = self.size + end - stop;
		let answer = self.species.ofSize(newSize);
		(start > 1).ifTrue {
			answer.replaceFromToWithStartingAt(1, start - 1, self, 1)
		};
		(start <= end).ifTrue {
			answer.replaceFromToWithStartingAt(start, end, aCollection, 1)
		};
		(end < newSize).ifTrue {
			answer.replaceFromToWithStartingAt(end + 1, newSize, self, stop + 1)
		};
		answer
	}

	copyUpThrough { :self :anElement |
		let index = self.indexOf(anElement);
		(index = 0).if {
			self.copy
		} {
			self.first(index)
		}
	}

	copyUpTo { :self :anElement |
		let index = self.indexOf(anElement);
		(index = 0).if {
			self.copy
		} {
			self.first(index - 1)
		}
	}

	copyUpToLast { :self :anElement |
		let index = self.lastIndexOf(anElement);
		(index = 0).if {
			self.copy
		} {
			self.first(index - 1)
		}
	}

	copyWithFirst { :self :newElement |
		let answer = self.copy;
		answer.addFirst(newElement);
		answer
	}

	correlationDistance { :u :v |
		let uu = (u - u.mean);
		let vv = (v - v.mean);
		1 - ((u - u.mean).dot(v - v.mean) / (uu.norm * vv.norm))
	}

	cosineDistance { :u :v |
		1 - (u.dot(v) / (u.norm * v.norm))
	}

	cross { :u :v |
		let [ux, uy, uz] = u;
		let [vx, vy, vz] = v;
		[
			(uy * vz) - (uz * vy),
			(uz * vx) - (ux * vz),
			(ux * vy) - (uy * vx)
		]
	}

	crossedMultiply { :self :aSequence |
		self.withCollectCrossed(aSequence, *)
	}

	deleteAdjacentDuplicates { :self :aBlock:/2 |
		self.isEmpty.if {
			[]
		} {
			let answer = [self.first];
			self.adjacentPairsDo { :i :j |
				aBlock(i, j).ifFalse {
					answer.add(j)
				}
			};
			answer
		}
	}

	deleteAdjacentDuplicates { :self |
		self.deleteAdjacentDuplicates(=)
	}

	detectIndex { :self :predicate:/1 |
		self.detectIndexIfFoundIfNone(predicate:/1) { :each |
			each
		} {
			nil
		}
	}

	detectIndexIfFoundIfNone { :self :predicate:/1 :ifFound:/1 :ifNone:/0 |
		valueWithReturn { :return:/1 |
			1.toDo(self.size) { :index |
				predicate(self[index]).ifTrue {
					ifFound(index).return
				}
			};
			ifNone()
		}
	}

	detectStartingAt { :self :predicate:/1 :startIndex |
		self.detectStartingAtIfFoundIfNone(predicate:/1, startIndex) { :item |
			item
		} {
			self.error('@Sequence>>detectStartingAt: no such item')
		}
	}

	detectStartingAtIfFoundIfNone { :self :predicate:/1 :startIndex :ifFound:/1 :ifNone:/0 |
		valueWithReturn { :return:/1 |
			startIndex.toDo(self.size) { :index |
				let item = self[index];
				predicate(item).ifTrue {
					ifFound(item).return
				}
			};
			ifNone()
		}
	}

	diagonal { :self :k |
		self.isMatrix.if {
			let l = self.shape.min - k.abs;
			1:l.collect { :i |
				self[i - k.min(0)][i + k.max(0)]
			}
		} {
			self.error('@Sequence>>diagonal: non matrix argument')
		}
	}

	diagonal { :self |
		self.diagonal(0)
	}

	differences { :self |
		self.partition(2, 1).collect { :each |
			each[2] - each[1]
		}
	}

	distanceMatrix { :u :v :aBlock:/2 |
		aBlock:/2.table(u, v)
	}

	distanceMatrix { :u :v |
		distanceMatrix(u, v, euclideanDistance:/2)
	}

	distanceMatrix { :u |
		distanceMatrix(u, u)
	}

	do { :self :aBlock:/1 |
		self.indicesDo { :index |
			aBlock(self[index])
		};
		self
	}

	doSeparatedBy { :self :elementBlock:/1 :separatorBlock:/0 |
		self.indicesDo { :index |
			(index = 1).ifFalse {
				separatorBlock()
			};
			elementBlock(self[index])
		}
	}

	dot { :self :aSequence |
		basicTimes:/2.inner(self, aSequence, basicPlus:/2)
	}

	dotProduct { :self :aSequence |
		self.isVector.if {
			(aSequence.isVector | { aSequence.isMatrix }).if {
				(self *.e aSequence).sum
			} {
				self.error('@Sequence>>dotProduct: argument not vector or matrix')
			}
		} {
			self.isMatrix.if {
				aSequence.isVector.if {
					self.collect { :each |
						(each *.e aSequence).sum
					}
				} {
					aSequence.isMatrix.if {
						self.collect { :each |
							each.dot(aSequence)
						}
					} {
						self.error('@Sequence>>dotProduct: argument not vector or matrix')
					}
				}
			} {
				self.error('@Sequence>>dotProduct: self not vector or matrix')
			}
		}
	}

	doWhile { :self :activity:/1 :conditionBlock:/1 |
		let nextIndex = self.firstIndex;
		let endIndex = self.lastIndex;
		{
			nextIndex <= endIndex & {
				conditionBlock(self[nextIndex])
			}
		}.whileTrue {
			activity(self[nextIndex]);
			nextIndex := nextIndex + 1
		}
	}

	doWithout { :self :aBlock:/1 :anItem |
		self.indicesDo { :index |
			(anItem = self[index]).ifFalse {
				aBlock(self[index])
			}
		}
	}

	downsample { :self :anInteger |
		(1, 1 + anInteger .. self.size).collect { :each |
			self[each]
		}
	}

	downsampleSteinarsson { :self :threshold |
		<primitive: return sc.downsampleSteinarsson(_self, _threshold);>
	}

	drop { :self :count |
		(count.abs >= self.size).if {
			self.species.new
		} {
			(count < 0).if {
				self.dropLast(count.negated)
			} {
				self.dropFirst(count)
			}
		}
	}

	dropFirst { :self :count |
		self.copyFromTo(count + 1, self.size)
	}

	dropLast { :self :count |
		self.copyFromTo(1, self.size - count)
	}

	dropWhile { :self :aBlock:/1 |
		self.detectIndexIfFoundIfNone { :each |
			each.aBlock.not
		} { :i |
			self.copyFromTo(i, self.size)
		} {
			self.species.new
		}
	}

	duplicateEach { :self :counts |
		counts.isInteger.ifTrue {
			counts := counts # self.size
		};
		self.replicateEachApplying(counts, value:/1)
	}

	editDistance { :self :other |
		self.levenshteinDistance(other)
	}

	endsWith { :self :aSequence |
		aSequence.isSequence.if {
			let sequenceSize = aSequence.size;
			let offset = self.size - sequenceSize;
			valueWithReturn { :return:/1 |
				(offset < 0).ifTrue {
					false.return
				};
				1.toDo(sequenceSize) { :index |
					(aSequence[index] = self[index + offset]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			self.error('@Sequencable>>endsWith: not a sequence')
		}
	}

	equalBy { :self :anObject :aBlock:/2 |
		self == anObject | {
			self.typeOf = anObject.typeOf & {
				self.hasEqualElementsBy(anObject, aBlock:/2)
			}
		}
	}

	euclideanDistance { :self :aSequence |
		(self - aSequence).norm
	}

	exponentialMovingAverage { :self :alpha |
		let answer = List(self.size);
		answer[1] := self[1];
		2.toDo(self.size) { :i |
			let y = answer[i - 1];
			answer[i] := y + (alpha * (self[i] - y))
		};
		answer
	}

	fillFromWith { :self :aCollection :aBlock:/1 |
		let index = 1;
		aCollection.do { :each |
			self[index] := aBlock(each);
			index := index + 1
		};
		self
	}

	findBinary { :self :aBlock:/1 |
		self.findBinaryDoIfNone(aBlock:/1) { :found |
			found
		} {
			self.error('@Sequence>>findBinary: not found')
		}
	}

	findBinaryDoIfNone { :self :aBlock:/1 :actionBlock:/1 :exceptionBlock |
		self.findBinaryIndexDoIfNone(aBlock:/1) { :foundIndex |
			actionBlock(self[foundIndex])
		} { :previousIndex :nextIndex |
			exceptionBlock.cull(
				(previousIndex > 0).ifTrue { self[previousIndex] },
				(nextIndex <= self.size).ifTrue { self[nextIndex] }
			)
		}
	}

	findBinaryIfNone { :self :aBlock:/1 :exceptionBlock |
		self.findBinaryDoIfNone(aBlock:/1, { :found | found }, exceptionBlock)
	}

	findBinaryIndex { :self :aBlock:/1 |
		self.findBinaryIndexDoIfNone(aBlock:/1) { :found |
			found
		} {
			self.error('@Sequence>>findBinaryIndex: not found')
		}
	}

	findBinaryIndexDoIfNone { :self :aBlock:/1 :actionBlock:/1 :exceptionBlock |
		let low = 1;
		let high = self.size;
		valueWithReturn { :return:/1 |
			{
				high < low
			}.whileFalse {
				let index = high + low // 2;
				let test = aBlock(self[index]);
				(test < 0).if {
					high := index - 1
				} {
					(0 < test).if {
						low := index + 1
					} {
						actionBlock(index).return
					}
				}
			};
			exceptionBlock.cull(high, low)
		}
	}

	findBinaryIndexIfNone { :self :aBlock:/1 :exceptionBlock |
		self.findBinaryIndexDoIfNone(aBlock:/1, { :found | found }, exceptionBlock)
	}

	findLast { :self :aBlock:/1 |
		let index = self.size + 1;
		valueWithReturn { :return:/1 |
			{
				(index := index - 1) >= 1
			}.whileTrue {
				aBlock(self[index]).ifTrue {
					index.return
				}
			};
			0
		}
	}

	first { :self |
		self[self.firstIndex]
	}

	first { :self :n |
		let i = self.firstIndex;
		self.copyFromTo(i, i + n - 1)
	}

	firstIndex { :self |
		1
	}

	fisherYatesShuffleUsing { :self :random |
		self.size.toByDo(2, -1) { :each |
			self.swapWith(each, random.nextRandomInteger(1, each))
		};
		self
	}

	fisherYatesShuffle { :self |
		self.fisherYatesShuffleUsing(system)
	}

	flattenTo { :self :depth |
		(depth <= 0).if {
			self
		} {
			let answer = [];
			self.do { :each |
				each.isCollection.if {
					answer.addAll(each.flattenTo(depth - 1))
				} {
					answer.add(each)
				}
			};
			answer
		}
	}

	flatten { :self |
		self.flattenTo(inf)
	}

	foldedIndex { :self :index |
		index.foldBetweenAnd(self.firstIndex, self.lastIndex)
	}

	foldLeftPrefix { :self :count :aBlock:/2 |
		self.ifEmpty {
			self.errorEmptyCollection
		} {
			let answer = self[1];
			2.toDo(self.size) { :index |
				answer := aBlock(answer, self[index])
			};
			answer
		}
	}

	foldLeft { :self :aBlock:/2 |
		self.foldLeftPrefix(self.size, aBlock:/2)
	}

	foldList { :self :anObject :aBlock:/2 |
		let answer = [anObject];
		let accumulator = anObject;
		self.do { :each |
			accumulator := aBlock(accumulator, each);
			answer.add(accumulator)
		};
		answer
	}

	foldRightPrefix { :self :count :aBlock:/2 |
		self.ifEmpty {
			self.errorEmptyCollection
		} {
			let answer = self[count];
			(count - 1).toByDo(1, -1) { :index |
				answer := aBlock(self[index], answer)
			};
			answer
		}
	}

	foldRight { :self :aBlock:/2 |
		self.foldRightPrefix(self.size, aBlock:/2)
	}

	forceToPaddingWith { :self :length :anObject |
		let answer = self.species.new(length);
		answer.atAllPut(anObject);
		answer.replaceFromToWithStartingAt(1, self.size.min(length), self, 1);
		answer
	}

	fourth { :self |
		self[self.firstIndex + 3]
	}

	fourth { :self :n |
		self.copyFromTo(n * 3 + 1, n * 4)
	}

	fromCharacterCode { :self |
		self.isVector.if {
			self.collect(fromCharacterCode:/1).join
		} {
			self.collect(fromCharacterCode:/1)
		}
	}

	fromContinuedFraction { :self |
		(self ~ [0]).if {
			0
		} {
			let answer = 0/1;
			self.reverseDo { :each |
				let next = (each + answer);
				(next > 0).ifTrue {
					answer := 1 / next
				}
			};
			1 / answer
		}
	}

	fromDigits { :self :radix |
		let answer = 0;
		let m = 1;
		self.reverseDo { :each |
			answer := answer + (each * m);
			m := m * radix
		};
		answer
	}

	fromDms { :self |
		self.numberCompose([1, 1 / 60, 1 / 3600])
	}

	fromToDo { :self :start :stop :aBlock:/1 |
		start.toDo(stop) { :index |
			aBlock(self[index])
		}
	}

	fromToKeysAndValuesDo { :self :start :stop :aBlock:/2 |
		start.toDo(stop) { :index |
			aBlock(self[index], index)
		}
	}

	fromToPut { :self :startIndex :endIndex :anObject |
		(startIndex > endIndex).if {
			self
		} {
			let written = 1;
			let toWrite = endIndex - startIndex + 1;
			let thisWrite = nil;
			self[startIndex] := anObject;
			{
				written < toWrite
			}.whileTrue {
				thisWrite := written.min(toWrite - written);
				self.replaceFromToWithStartingAt(
					startIndex + written,
					startIndex + written + thisWrite - 1,
					self,
					startIndex
				);
				written := written + thisWrite
			}
		};
		anObject
	}

	groupsDo { :self :aBlock |
		let numArgs = aBlock.numArgs;
		numArgs.caseOfOtherwise([
			{ 0 } -> { self.error('groupsDo: At least one block argument expected') },
			{ 1 } -> { self.do(aBlock) },
			{ 2 } -> { self.pairsDo(aBlock) }
		]) {
			let argumentList = List(numArgs);
			let index = 1;
			let endIndex = self.size - numArgs + 1;
			{
				index <= endIndex
			}.whileTrue {
				argumentList.replaceFromToWithStartingAt(1, numArgs, self, index);
				aBlock.valueWithArguments(argumentList);
				index := index + numArgs
			}
		}
	}

	grownBy { :self :length |
		let answer = self.species.ofSize(self.size + length);
		answer.replaceFromToWithStartingAt(1, self.size, self, 1)
	}

	hammingDistance { :self :other |
		let size = self.size.min(other.size);
		let count = (self.size - other.size).abs;
		1.toDo(size) { :index |
			(self[index] ~= other[index]).ifTrue {
				count := count + 1
			}
		};
		count
	}

	hasEqualElementsBy { :self :otherCollection :aBlock:/2 |
		(otherCollection.isSequence & {
			self.size = otherCollection.size
		}).if {
			valueWithReturn { :return:/1 |
				self.indicesDo { :index |
					aBlock(self[index], otherCollection[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			false
		}
	}

	hasEqualElements { :self :otherCollection |
		self.hasEqualElementsBy(otherCollection, =)
	}

	includes { :self :anObject |
		self.indexOf(anObject) ~= 0
	}

	includesIndex { :self :index |
		index.isInteger & {
			index > 0 & {
				index <= self.size
			}
		}
	}

	includesScatteredSubsequence { :self :aSequence |
		valueWithReturn { :return:/1 |
			1.to(self.size).powerSetDo { :each |
				each.isArithmeticSeriesBy(1).ifFalse {
					(self @* each = aSequence).ifTrue {
						true.return
					}
				}
			};
			false
		}
	}

	includesSubsequence { :self :aSequence |
		valueWithReturn { :return:/1 |
			let i = 1;
			aSequence.do { :each |
				i := self.indexOfStartingAt(each, i);
				(i = 0).ifTrue {
					false.return
				}
			};
			true
		}
	}

	includesSubstring { :self :aSequence |
		let k = aSequence.size;
		let c = aSequence.first;
		self.indicesOf(c).anySatisfy { :i |
			(1 .. k).allSatisfy { :j |
				self[i + j - 1] = aSequence[j]
			}
		}
	}

	increasingSubsequenceList { :self :aBlock:/2 |
		(self.size < 2).if {
			[self]
		} {
			let increasing = { :done :remaining |
				remaining.isEmpty.if {
					[done]
				} {
					aBlock(done.last, remaining.first).if {
						increasing(
							done ++ [remaining.first],
							remaining.allButFirst
						)
					} {
						[]
					} ++ increasing(done, remaining.allButFirst)
				}
			};
			(1 .. self.size).collect { :i |
				increasing(self.first(i).last(1), self.drop(i))
			}.concatenation
		}
	}

	increasingSubsequenceList { :self |
		self.increasingSubsequenceList(<)
	}

	indexOf { :self :anElement |
		self.indexOfStartingAt(anElement, 1)
	}

	indexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		let index = self.indexOfStartingAt(anElement, 1);
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	indexOfStartingAt { :self :anElement :start |
		valueWithReturn { :return:/1 |
			start.toDo(self.size) { :index |
				(self[index] = anElement).ifTrue {
					index.return
				}
			};
			0
		}
	}

	indexOfSubstring { :self :aSequence |
		self.indexOfSubstringStartingAt(aSequence, 1)
	}

	indexOfSubstringStartingAt { :self :aSequence :start |
		let k = aSequence.size;
		(k = 0).if {
			0
		} {
			let first = aSequence[1];
			valueWithReturn { :return:/1 |
				start.max(1).toDo(self.size - k + 1) { :startIndex |
					(self[startIndex] = first).ifTrue {
						let index = 2;
						{
							index <= k & {
								self[startIndex + index - 1] = aSequence[index]
							}
						}.whileTrue {
							index := index + 1
						};
						(index <= k).ifFalse {
							startIndex.return
						}
					}
				};
				0
			}
		}
	}

	indexValueAssociations { :self |
		let answer = List(self.size);
		self.withIndexDo { :each :index |
			answer[index] := (index -> each)
		};
		answer
	}

	indices { :self |
		(self.firstIndex .. self.lastIndex)
	}

	indicesSorted { :self |
		self.indices
	}

	indicesDo { :self :aBlock:/1 |
		self.firstIndex.toDo(self.lastIndex, aBlock:/1)
	}

	indicesOfSubsequence { :self :aSequence |
		let answer = [];
		1.to(self.size).powerSetDo { :each |
			(self @* each = aSequence).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	indicesOfSubstring { :self :aSequence |
		self.indicesOfSubstringStartingAt(aSequence, self.firstIndex)
	}

	indicesOfSubstringStartingAt { :self :aSequence :initialIndex |
		let answer = [];
		let index = initialIndex - 1;
		{
			index := self.indexOfSubstringStartingAt(aSequence, index + 1);
			index = 0
		}.whileFalse {
			answer.add(index)
		};
		answer
	}

	injectInto { :self :anObject :aBlock:/2 |
		let answer = anObject;
		self.indicesDo { :index |
			answer := aBlock(answer, self[index])
		};
		answer
	}

	intercalate { :self :aCollection |
		let answer = [];
		self.doSeparatedBy { :each |
			answer.add(each)
		} {
			answer.addAll(aCollection)
		};
		answer
	}

	interleave { :self :aSequence |
		let answer = [];
		1.toDo(self.size.max(aSequence.size)) { :i |
			answer.add(self.atWrap(i));
			answer.add(aSequence.atWrap(i))
		};
		answer
	}

	intersperse { :self :anObject |
		let answer = [];
		self.doSeparatedBy { :each |
			answer.add(each)
		} {
			answer.add(anObject)
		};
		answer
	}

	iota { :self |
		(1 .. self.product).reshape(self)
	}

	isArithmeticSeries { :self |
		(self.size <= 1).if {
			true
		} {
			self.isArithmeticSeriesBy(self.second - self.first)
		}
	}

	isArithmeticSeriesBy { :self :aNumber |
		(self.size <= 1).if {
			true
		} {
			valueWithReturn { :return:/1 |
				self.adjacentPairsDo { :a :b |
					(b - a ~= aNumber).ifTrue {
						false.return
					}
				};
				true
			}
		}
	}

	isArray { :self |
		{
			self.shape;
			true
		}.ifError {
			false
		}
	}

	isColumnVector { :self |
		self.isMatrix & {
			self.anyOne.size = 1
		}
	}

	isGeometricSeries { :self |
		(self.size <= 1).if {
			true
		} {
			self.isGeometricSeriesBy(self.second / self.first)
		}
	}

	isGeometricSeriesBy { :self :aNumber |
		(self.size <= 1).if {
			true
		} {
			valueWithReturn { :return:/1 |
				self.adjacentPairsDo { :a :b |
					(b / a ~= aNumber).ifTrue {
						false.return
					}
				};
				true
			}
		}
	}

	isLowerTriangularMatrix { :self :k |
		self.isMatrix & {
			let [r, c] = self.shape;
			1.to(r - k).allSatisfy { :i |
				(i + 1 + k).to(c).allSatisfy { :j |
					self[i][j] = 0
				}
			}
		}
	}

	isLowerTriangularMatrix { :self |
		self.isLowerTriangularMatrix(0)
	}

	isMatrix { :self |
		let type = self.typeOf;
		self.allSatisfy { :each |
			each.typeOf = type & {
				each.isVector
			}
		} & {
			self.collect(size:/1).asSet.size = 1
		}
	}

	isMatrixOf { :self :elementType |
		self.isMatrix & {
			self.allSatisfy { :each |
				each.elementType = elementType
			}
		}
	}

	isOctetSequence { :self |
		self.allSatisfy { :each |
			each.isInteger & {
				each.betweenAnd(0, 255)
			}
		}
	}

	isRowVector { :self |
		self.isMatrix & {
			self.size = 1
		}
	}

	isSequence { :self |
		true
	}

	isSorted { :self |
		self.isSortedBetweenAnd(1, self.size)
	}

	isSortedBetweenAnd { :self :startIndex :endIndex |
		self.isSortedByBetweenAnd(<=, startIndex, endIndex)
	}

	isSortedBy { :self :aBlock:/2 |
		self.isSortedByBetweenAnd(aBlock:/2, 1, self.size)
	}

	isSortedByBetweenAnd { :self :aBlock:/2 :startIndex :endIndex |
		(endIndex <= startIndex).if {
			true
		} {
			let previousElement = self[startIndex];
			valueWithReturn { :return:/1 |
				(startIndex + 1).toDo(endIndex) { :index |
					let element = self[index];
					aBlock(previousElement, element).ifFalse {
						false.return
					};
					previousElement := element
				};
				true
			}
		}
	}

	isSquareMatrix { :self |
		self.isMatrix & {
			self.size = self.anyOne.size
		}
	}

	isSymmetricMatrix { :self |
		self.isSquareMatrix & {
			self = self.transposed
		}
	}

	isUpperTriangularMatrix { :self :k |
		self.isMatrix & {
			let [r, c] = self.shape;
			(2 - k).to(r).allSatisfy { :i |
				1.to(i - 1 + k).allSatisfy { :j |
					self[i][j] = 0
				}
			}
		}
	}

	isUpperTriangularMatrix { :self |
		self.isUpperTriangularMatrix(0)
	}

	isVector { :self |
		let type = self.typeOf;
		self.noneSatisfy { :each |
			each.typeOf = type
		}
	}

	isVectorOf { :self :elementType |
		self.isVector & {
			self.elementType = elementType
		}
	}

	kroneckerProduct { :a :b |
		let m = a.size;
		let n = a[1].size;
		let p = b.size;
		let q = b[1].size;
		let r = m * p;
		let c = n * q;
		let answer = { List(c, 0) } ! r;
		1.toDo(m) { :i |
			1.toDo(n) { :j |
				1.toDo(p) { :k |
					1.toDo(q) { :l |
						answer[p * (i - 1) + k][q * (j - 1) + l] := a[i][j] * b[k][l]
					}
				}
			}
		};
		answer
	}

	last { :self |
		self[self.lastIndex]
	}

	last { :self :n |
		let i = self.lastIndex;
		self.copyFromTo(i - n + 1, i)
	}

	lastIndex { :self |
		self.size
	}

	lastIndexOf { :self :anElement |
		self.lastIndexOfStartingAt(anElement, self.lastIndex)
	}

	lastIndexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		let index = self.lastIndexOfStartingAt(anElement, self.lastIndex);
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	lastIndexOfStartingAt { :self :anElement :lastIndex |
		valueWithReturn { :return:/1 |
			lastIndex.toByDo(self.firstIndex, -1) { :index |
				(self[index] = anElement).ifTrue {
					index.return
				}
			};
			0
		}
	}

	lastIndexOfStartingAtIfAbsent { :self :anElement :lastIndex :exceptionBlock:/0 |
		let index = self.lastIndexOfStartingAt(anElement, lastIndex);
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	levenshteinDistance { :self :other |
		self.levenshteinDistance(other, =)
	}

	levenshteinDistance { :self :other :equalityBlock:/2 |
		(self.isEmpty | {
			other.isEmpty
		}).if {
			self.size
		} {
			let matrix = [0 .. other.size];
			1.toDo(self.size) { :xIndex |
				let corner = xIndex - 1;
				matrix[1] := xIndex - 1;
				1.toDo(other.size) { :yIndex |
					let upper = matrix[yIndex + 1];
					matrix[yIndex + 1] := equalityBlock(self[xIndex], other[yIndex]).if {
						corner
					} {
						[upper, corner, matrix[yIndex]].min + 1
					};
					corner := upper
				}
			};
			matrix[other.size + 1]
		}
	}

	linearIndex { :shape :aSequence |
		(aSequence - 1).reverse.mixedRadixDecode(shape) + 1
	}

	longestCommonSubsequence { :a :b |
		let m = a.size + 1;
		let n = b.size + 1;
		let lengths = (m).zeroMatrix(n);
		let answer = [];
		a.withIndexCollect { :x :i |
			b.withIndexCollect { :y :j |
				(x = y).if {
					lengths[i + 1, j + 1] := lengths[i, j] + 1
				} {
					lengths[i + 1, j + 1] := lengths[i + 1, j].max(lengths[i, j + 1])
				}
			}
		};
		{
			(m > 1) && (n > 1)
		}.whileTrue {
			(lengths[m, n] = lengths[m - 1, n]).if {
				m := m - 1
			} {
				(lengths[m, n] = lengths[m, n -  1]).if {
					n := n - 1
				} {
					(a[m - 1] = b[n - 1]).ifFalse {
						'@Sequence>>longestCommonSubsequence: error?'.error
					};
					answer.addFirst(a[m - 1]);
					m := m - 1;
					n := n - 1
				}
			}
		};
		answer
	}

	longestCommonSubstringList { :self :aSequence |
		let find = { :k |
			self.partition(k, 1).intersection(aSequence.partition(k, 1))
		};
		let n = self.size.min(aSequence.size);
		valueWithReturn { :return:/1 |
			n.toByDo(1, -1) { :k |
				let common = find(k);
				common.isEmpty.ifFalse {
					common.return
				}
			};
			[]
		}
	}

	longestCommonSubstring { :self :aSequence |
		let common = self.longestCommonSubstringList(aSequence);
		common.isEmpty.if {
			[]
		} {
			common.first
		}
	}

	longestIncreasingSubsequence { :self |
		let x = self;
		let n = x.size;
		(n < 2).if {
			x
		} {
			let p = List(n, 0);
			let m = List(n + 1, 0);
			let l = 0;
			let answer = [];
			let k = nil;
			0.toDo(n - 1) { :i |
				let lo = 1;
				let hi = l;
				let z = nil;
				{
					lo <= hi
				}.whileTrue {
					let mid = ((lo + hi) / 2).ceiling;
					(x[m[mid + 1] + 1] < x[i + 1]).if {
						lo := mid + 1
					} {
						hi := mid - 1
					}
				};
				z := lo;
				p[i + 1] := m[z];
				m[z + 1] := i;
				(z > l).ifTrue {
					l := z
				}
			};
			k := m[l + 1];
			l.timesRepeat {
				answer.addFirst(x[k + 1]);
				k := p[k + 1]
			};
			answer
		}
	}

	longestIncreasingSubsequenceList { :self |
		let a = self.increasingSubsequenceList.sort { :p :q |
			q.size < p.size
		};
		let k = a.first.size;
		a.takeWhile { :each |
			each.size = k
		}.reverse
	}

	luDecompositionPivotMatrix { :m |
		let n = m.size;
		let p = n.identityMatrix;
		1.toDo(n) { :i |
			let max = m[i][i];
			let row = i;
			i.toDo(n) { :j |
				let e = m[j][i];
				(e > max).ifTrue {
					max := e;
					row := j
				}
			};
			(i ~= row).ifTrue {
				p.swapWith(i, row)
			}
		};
		p
	}

	luDecomposition { :self |
		let m = self.assertIsSquareMatrix('@Sequence>>luDecomposition');
		let n = self.size;
		let p = m.luDecompositionPivotMatrix;
		let m2 = p.dot(m);
		let l = n.identityMatrix;
		let u = n.identityMatrix;
		1.toDo(n) { :j |
			1.toDo(j) { :i |
				let sum = 0;
				1.toDo(i - 1) { :k |
					sum := sum + (u[k][j] * l[i][k])
				};
				u[i][j] := m2[i][j] - sum
			};
			j.toDo(n) { :i |
				let sum = 0;
				1.toDo(j - 1) { :k |
					sum := sum + (u[k][j] * l[i][k])
				};
				l[i][j] := (m2[i][j] - sum) / u[j][j]
			}
		};
		[l, u, p]
	}

	lyndonWordsDo { :alphabet :n :aBlock:/1 |
		let nextWord = { :w |
			let k = (n // w.size) + 1;
			let x = ({ w } ! k).concatenation.first(n);
			{
				x.size > 0 & {
					x.last = alphabet.last
				}
			}.whileTrue {
				x.removeLast
			};
			x.isEmpty.ifFalse {
				let i = alphabet.indexOf(x.last) + 1;
				x[x.size] := alphabet[i]
			};
			x
		};
		let w = [alphabet.first];
		{
			w.size > 0 & {
				w.size <= n
			}
		}.whileTrue {
			aBlock(w);
			w := nextWord(w)
		}
	}

	lyndonWords { :self :anInteger |
		let answer = [];
		self.lyndonWordsDo(anInteger) { :each |
			answer.add(each)
		};
		answer
	}

	manhattanDistance { :self :aSequence |
		(self - aSequence).abs.sum
	}

	matrixPower { :m :p |
		let [a, b] = m.shape;
		(a = b).if {
			let r = b.zeroMatrix(a);
			p.caseOfOtherwise([
				0 -> {
					1:b.do { :i |
						1:a.do { :j |
							(i = j).if {
								r[i][j] := 1
							} {
								r[i][j] := 0
							}
						}
					}
				},
				1 -> {
					1:b.do { :i |
						1:a.do { :j |
							r[i][j] := m[i][j]
						}
					}
				}
			]) {
				r := m;
				2:p.do { :i |
					r := r.dot(m)
				}
			};
			r
		} {
			m.error('@Sequence>>matrixPower: invalid matrix')
		}
	}

	median { :self |
		self.asSortedList.median
	}

	mergeInPlace { :self :select:/1 :insert:/2 |
		let answer = [];
		{
			self.isEmpty
		}.whileFalse {
			let x = self.collect(first:/1);
			let i = x.indexOf(x.select);
			answer.insert(self[i].removeFirst);
			self[i].isEmpty.ifTrue {
				self.removeAt(i)
			}
		};
		answer
	}

	mergeFirstMiddleLastIntoBy { :self :first :middle :last :destination :aBlock:/2 |
		let i1 = first;
		let i2 = middle + 1;
		let val1 = self[i1];
		let val2 = self[i2];
		let out = first - 1;
		{
			i1 <= middle & {
				i2 <= last
			}
		}.whileTrue {
			aBlock(val1, val2).if {
				out := out + 1;
				i1 := i1 + 1;
				destination[out] := val1;
				val1 := self[i1]
			} {
				out := out + 1;
				i2 := i2 + 1;
				destination[out] := val2;
				val2 := self.atWrap(i2)
			}
		};
		(i1 <= middle).if {
			destination.replaceFromToWithStartingAt(out + 1, last, self, i1)
		} {
			destination.replaceFromToWithStartingAt(out + 1, last, self, i2)
		}
	}

	mergeSortFromToBy { :self :startIndex :stopIndex :aBlock:/2 |
		let size = self.size;
		(
			size <= 1 | {
				startIndex = stopIndex
			}
		).if {
			self
		} {
			(1 <= startIndex).ifFalse {
				self.errorSubscriptBounds(startIndex)
			};
			(stopIndex <= size).ifFalse {
				self.errorSubscriptBounds(stopIndex)
			};
			(startIndex < stopIndex).ifFalse {
				self.errorSubscriptBounds(startIndex)
			};
			self.shallowCopy.mergeSortFromToIntoBy(startIndex, stopIndex, self, aBlock:/2);
			self
		}
	}

	mergeSortFromToIntoBy { :self :firstIndex :lastIndex :destination :aBlock:/2 |
		let n = lastIndex - firstIndex;
		(n <= 1).if {
			(n = 0).if {
				self
			} {
				let firstObject = self[firstIndex];
				let lastObject = self[lastIndex];
				aBlock(firstObject, lastObject).if {
					destination[lastIndex] := lastObject;
					destination[firstIndex] := firstObject
				} {
					destination[lastIndex] := firstObject;
					destination[firstIndex] := lastObject
				};
				self
			}
		} {
			n := firstIndex + lastIndex // 2;
			destination.mergeSortFromToIntoBy(firstIndex, n, self, aBlock:/2);
			destination.mergeSortFromToIntoBy(n + 1, lastIndex, self, aBlock:/2);
			self.mergeFirstMiddleLastIntoBy(firstIndex, n, lastIndex, destination, aBlock:/2)
		}
	}

	mergeSort { :self :aSortBlock:/2 |
		self.mergeSortFromToBy(1, self.size, aSortBlock:/2)
	}

	mergeSort { :self |
		self.mergeSortFromToBy(1, self.size, <=)
	}

	middle { :self |
		self[self.size // 2 + 1]
	}

	mixedRadixDecode { :self :factors |
		let answer = 0;
		let base = 1;
		let k = factors.size.min(self.size);
		let prefix = self.size - factors.size;
		(prefix > 1).ifTrue {
			self.error('@Sequence>>mixedRadixDecode: sequence too long')
		};
		(k .. 1).do { :index |
			answer := answer + (self[index + prefix] * base);
			base := base * factors[index]
		};
		(prefix = 1).ifTrue {
			answer := answer + (self[1] * base)
		};
		answer
	}

	movingAverage { :self :windowSize |
		let answer = [];
		1.toDo(self.size - windowSize + 1) { :i |
			let n = 0;
			i.toDo(i + windowSize - 1) { :j |
				n := n + self[j]
			};
			answer.add(n / windowSize)
		};
		answer
	}

	movingMedian { :self :windowSize |
		median:/1.movingMap(self, windowSize)
	}

	norm { :self |
		(self.scalarProduct(self.conjugated)).sqrt
	}

	normalize { :self |
		self / self.norm
	}

	normalizedSquaredEuclideanDistance { :u :v |
		let uu = (u - u.mean);
		let vv = (v - v.mean);
		0.5 * (uu - vv).norm.squared / (uu.norm.squared + vv.norm.squared)
	}

	nubSieve { :self |
		let seen = [];
		self.collect { :each |
			seen.includes(each).if {
				false
			} {
				seen.add(each);
				true
			}
		}
	}

	numberCompose { :c :u |
		(c * u.last(c.size)).sum
	}

	occurrencesOf { :self :anObject |
		let tally = 0;
		self.indicesDo { :index |
			(self[index] = anObject).ifTrue {
				tally := tally + 1
			}
		};
		tally
	}

	ordering { :self |
		self.sortedWithIndices.collect(value:/1)
	}

	ordering { :self :aBlock:/2|
		self.sortedWithIndices(aBlock:/2).collect(value:/1)
	}


	orderedSubstrings { :self :aBlock:/2 |
		self.isEmpty.if {
			[]
		} {
			let answer = [];
			let run = [self.first];
			2.toDo(self.size) { :i |
				let item = self[i];
				aBlock(self[i - 1], item).if {
					run.add(item)
				} {
					answer.add(run.copy);
					run.removeAll;
					run.add(item)
				}
			};
			answer.add(run);
			answer
		}
	}

	orderedSubstrings { :self |
		self.orderedSubstrings(<)
	}

	outerProduct { :self :aSequence |
		self *.outer aSequence
	}

	padLeft { :self :anInteger :anObject |
		(self.size >= anInteger).if {
			self
		} {
			let prefix = anObject # (anInteger - self.size);
			prefix ++ self
		}
	}

	padRight { :self :anInteger :anObject |
		(self.size >= anInteger).if {
			self
		} {
			let suffix = anObject # (anInteger - self.size);
			self ++ suffix
		}
	}

	pairsCollect { :self :aBlock:/2 |
		(1 .. self.size // 2).collect { :index |
			aBlock(self[2 * index - 1], self[2 * index])
		}
	}

	pairsDo { :self :aBlock:/2 |
		1.toDo(self.size // 2) { :index |
			aBlock(self[2 * index - 1], self[2 * index])
		}
	}

	partitionDo { :self :windowSize :stepSize :aBlock:/1 |
		(windowSize <= self.size).ifTrue {
			(windowSize = 0).if {
				aBlock([])
			} {
				let answer = List(windowSize);
				1.toByDo(self.size - windowSize + 1, stepSize) { :index |
					self.copyFromToInto(index, index + windowSize - 1, answer);
					aBlock(answer)
				}
			}
		}
	}

	partition { :self :windowSize :stepSize |
		let answer = [];
		self.partitionDo(windowSize, stepSize) { :each |
			answer.add(each.copy)
		};
		answer
	}

	partition { :self :windowSize |
		self.partition(windowSize, windowSize)
	}

	patienceSortPiles { :self |
		let piles = [];
		let answer = [];
		self.do { :card |
			let index = piles.detectIndex { :each |
				each.last >= card
			};
			index.ifNil {
				piles.addLast([card])
			} {
				piles[index].addLast(card)
			}
		};
		piles
	}

	patienceSort { :self |
		self.patienceSortPiles.mergeInPlace(max:/1, addFirst:/2)
	}

	pinnedIndex { :self :index |
		(index < self.firstIndex).if {
			self.firstIndex
		} {
			(index > self.lastIndex).if {
				self.lastIndex
			} {
				index
			}
		}
	}

	cliPlot { :self :format |
		let plotData = self.isVector.if {
			[[1 .. self.size], self.asList].transposed
		} {
			self.collect(asList:/1).asList
		};
		let fileName = '/tmp/listPlot.json';
		fileName.writeTextFile(plotData.asJson).then { :unused |
			system.systemCommand(
				'hsc3-plot',
				[
					'json',
					'xy',
					'--format=' ++ format,
					fileName,
					'0',
					'1'
				]
			)
		}
	}

	discretePlot { :self |
		self.cliPlot('discrete')
	}

	scatterPlot { :self |
		self.cliPlot('scatter')
	}

	plot { :self |
		self.cliPlot('line')
	}

	precedes { :self :aSequence |
		self.compare(aSequence) = -1
	}

	prefixesDo { :self :aBlock:/1 |
		1.toDo(self.size) { :each |
			aBlock(self.copyFromTo(1, each))
		}
	}

	prefixes { :self |
		let answer = [];
		self.prefixesDo { :each |
			answer.add(each)
		};
		answer
	}

	prefixProduct { :self |
		self.scan(*)
	}

	prefixSum { :self |
		self.scan(+)
	}

	quickSortFromToBy { :self :from :to :sortBlock:/2 |
		valueWithReturn { :return:/1 |
			var i, j, k, l, ij, di, dj, dij, n, tmp;
			i := from;
			j := to;
			{
				di := self[i];
				dj := self[j];
				sortBlock(di, dj).ifFalse {
					self[i] := dj;
					self[j] := di;
					tmp := dj;
					dj := di;
					di := tmp
				};
				n := j + 1 - i;
				(n <= 2).ifTrue {
					self.return
				};
				ij := i + j // 2;
				dij := self[ij];
				sortBlock(di, dij).if {
					sortBlock(dij, dj).ifFalse {
						self[j] := dij;
						self[ij] := dj;
						dij := dj;
						dj := nil
					}
				} {
					self[i] := dij;
					self[ij] := di;
					dij := di;
					di := nil
				};
				(n = 3).ifTrue {
					self.return
				};
				k := i;
				l := j;
				{
					{
						l := l - 1;
						k <= l & {
							sortBlock(dij, self[l])
						}
					}.whileTrue;
					{
						k := k + 1;
						k <= l & {
							sortBlock(self[k], dij)
						}
					}.whileTrue;
					k <= l
				}.whileTrue {
					tmp := self[k];
					self[k] := self[l];
					self[l] := tmp
				};
				(i < l).if {
					(k < j).if {
						(l - i < (j - k)).if {
							self.quickSortFromToBy(i, l, sortBlock:/2);
							i := k
						} {
							self.quickSortFromToBy(k, j, sortBlock:/2);
							j := l
						}
					} {
						j := l
					}
				} {
					(k < j).if {
						i := k
					} {
						self.return
					}
				}
			}.repeat
		}
	}

	quickSort { :self :sortBlock:/2 |
		self.quickSortFromToBy(1, self.size, sortBlock:/2)
	}

	quickSort { :self |
		self.quickSort(<=)
	}

	randomWeightedIndex { :self |
		let r = system.nextRandomFloat;
		let sum = 0;
		let answer = 1;
		valueWithReturn { :return:/1 |
			self.do { :each |
				sum := sum + each;
				(sum > r).ifTrue {
					answer.return
				};
				answer := answer + 1
			};
			answer
		}
	}

	rank { :self |
		self.shape.size
	}

	ratios { :self |
		self.partition(2, 1).collect { :each |
			each[2] / each[1]
		}
	}

	replace { :self :aBlock:/1 |
		self.indicesDo { :index |
			self[index] := aBlock(self[index])
		}
	}

	replaceAllWith { :self :oldObject :newObject |
		let index = 0;
		{
			index := self.indexOfStartingAt(oldObject, index + 1);
			index = 0
		}.whileFalse {
			self[index] := newObject
		};
		self
	}

	replaceFromToWith { :self :start :stop :replacement |
		(replacement.size = (stop - start + 1)).if {
			self.replaceFromToWithStartingAt(start, stop, replacement, 1)
		} {
			self.error('@Sequence>> replaceFromToWith: size of replacement does not match')
		}
	}

	replaceFromToWithStartingAt { :self :start :stop :replacement :replacementStart |
		let replacementOffset = replacementStart - start;
		let index = start;
		{
			index <= stop
		}.whileTrue {
			self[index] := replacement[replacementOffset + index];
			index := index + 1
		};
		self
	}

	replicateEachApplying { :self :counts :aBlock:/1 |
		(self.size ~= counts.size).if {
			self.error('@Sequence>>replicateEachApplying: counts not of correct size')
		} {
			let answerSize = counts.sum;
			let answer = self.species.ofSize(answerSize);
			let answerIndex = 1;
			(1 .. self.size).do { :selfIndex |
				let entry = aBlock(self[selfIndex]);
				counts[selfIndex].timesRepeat {
					answer[answerIndex] := entry;
					answerIndex := answerIndex + 1
				}
			};
			answer
		}
	}

	replicateEach { :self :counts |
		counts.isInteger.ifTrue {
			counts := counts # self.size
		};
		self.replicateEachApplying(counts, identity:/1)
	}

	reshape { :self :shape |
		shape.ifEmpty {
			self.error('@Sequence>>reshape: empty shape?')
		} {
			let size = shape.product;
			let answer = self.flatten.wrapExtend(size);
			shape.allButFirst.reverseDo { :n |
				answer := answer.clump(n)
			};
			answer
		}
	}

	reshapeLike { :self :another |
		let index = 1;
		let items = self.flatten;
		another.deepCollect { :unusedItem |
			let item = items.atWrap(index);
			index := index + 1;
			item
		}
	}

	reversed { :self |
		let answer = self.species.ofSize(self.size);
		let fromIndex = self.size + 1;
		self.indicesDo { :toIndex |
			answer[toIndex] := self[fromIndex - 1];
			fromIndex := fromIndex - 1
		};
		answer
	}

	reverseDo { :self :aBlock:/1 |
		self.size.toByDo(1, -1) { :index |
			aBlock(self[index])
		}
	}

	reverseWithDo { :self :aSequence :aBlock:/2 |
		(self.size ~= aSequence.size).if {
			self.error('@Sequence>> reverseWithDo: unequal size')
		} {
			self.size.toByDo(1, -1) { :index |
				aBlock(self[index], aSequence[index])
			}
		}
	}

	rotated { :self :anInteger |
		self.rotatedRight(anInteger)
	}

	rotatedLeft { :self |
		self.rotatedLeft(1)
	}

	rotatedLeft { :self :anInteger |
		(1 + anInteger).toAsCollect(self.size + anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	rotatedRight { :self |
		self.rotatedRight(1)
	}

	rotatedRight { :self :anInteger |
		(1 - anInteger).toAsCollect(self.size - anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	rotateLeft { :self |
		let n = self.size;
		let left = self.first;
		2.toDo(n) { :i |
			self[i - 1] := self[i]
		};
		self[n] := z
	}

	scalarProduct { :self :aSequence |
		(self *.e aSequence).sum
	}

	scan { :self :aBlock:/2 |
		self.scanLeft(aBlock:/2)
	}

	scanLeft { :self :aBlock:/2 |
		self.ifEmpty {
			self.copy
		} {
			let answer = self.species.new(self.size);
			let next = self[1];
			answer[1] := next;
			2.toDo(self.size) { :index |
				next := aBlock(next, self[index]);
				answer[index] := next
			};
			answer
		}
	}

	scanLeftAssociatingRight { :self :aBlock:/2 |
		self.ifEmpty {
			self.copy
		} {
			(1 .. self.size).collect { :each |
				self.foldRightPrefix(each, aBlock:/2)
			}
		}
	}

	scanRight { :self :aBlock:/2 |
		self.ifEmpty {
			self.copy
		} {
			let answer = self.species.new(self.size);
			let next = self[self.size];
			answer[self.size] := next;
			(self.size - 1).toByDo(1, -1) { :index |
				next := aBlock(self[index], next);
				answer[index] := next
			};
			answer
		}
	}

	semiconvergents { :self :epsilon |
		let answer = [];
		let final = self.fromContinuedFraction;
		let lastError = final;
		valueWithReturn { :return:/1 |
			self.prefixesDo { :each |
				let z = each.last;
				let h = (z / 2).roundUpTo(1);
				let p = each.allButLast;
				h.toDo(z) { :k |
					let c = p ++ [k];
					let r = c.fromContinuedFraction;
					let nextError = (final - r).abs;
					(nextError < lastError).ifTrue {
						answer.add(r);
						lastError := nextError
					};
					((final - r).abs < epsilon).ifTrue {
						answer.return
					}
				}
			};
			answer
		}
	}

	shape { :self |
		(self.size = 0).if {
			[0]
		} {
			let type = self.typeOf;
			let elementTypes = self.elementTypes;
			elementTypes.allSatisfy { :each |
				each = type
			}.if {
				let elementShapes = self.collect(shape:/1);
				(elementShapes.nub.size = 1).if {
					[self.size] ++ elementShapes.first
				} {
					self.error('@Sequence>>shape: irregular arrays do not have shape')
				}
			} {
				elementTypes.includes(type).if {
					self.error('@Sequence>>shape: irregular arrays do not have shape')
				} {
					[self.size]
				}
			}
		}
	}

	squaredEuclideanDistance { :self :aSequence |
		(self - aSequence).norm.squared
	}

	standardize { :self :meanBlock:/1 :deviationBlock:/1 |
		let deviation = deviationBlock(self);
		(deviation = 0).if {
			self.error('@Sequence>>standardize: deviation = 0?')
		} {
			(self - meanBlock(self)) / deviation
		}
	}

	standardize { :self :meanBlock:/1 |
		self.standardize(meanBlock:/1, standardDeviation:/1)
	}

	standardize { :self |
		self.standardize(mean:/1, standardDeviation:/1)
	}

	suffixesDo { :self :aBlock:/1 |
		let size = self.size;
		1.toDo(size) { :each |
			aBlock(self.copyFromTo(each, size))
		}
	}

	suffixes { :self |
		let answer = [];
		self.suffixesDo { :each |
			answer.add(each)
		};
		answer
	}

	second { :self |
		self[self.firstIndex + 1]
	}

	second { :self :n |
		self.copyFromTo(n + 1, n * 2)
	}

	secondLast { :self |
		self[self.lastIndex - 1]
	}

	select { :self :aBlock:/1 |
		let answer = [];
		self.indicesDo { :index |
			aBlock(self[index]).ifTrue {
				answer.add(self[index])
			}
		};
		self.species.newFrom(answer)
	}

	shuffleUsing { :self :random |
		self.fisherYatesShuffleUsing(random)
	}

	shuffle { :self |
		self.fisherYatesShuffle
	}

	shuffledBy { :self :random |
		self.copy.fisherYatesShuffleBy(random)
	}

	shuffled { :self |
		self.copy.fisherYatesShuffle
	}

	sort { :self |
		self.sortBy(<=)
	}

	sort { :self :aBlock:/2 |
		aBlock:/2.ifNil {
			self.sort
		} {
			self.sortBy(aBlock:/2)
		}
	}

	sortOn { :self :keyBlock:/1 |
		self.sortOnBy(keyBlock:/1, <=)
	}

	sorted { :self :aSortBlock:/2 |
		self.copy.sortBy(aSortBlock:/2)
	}

	sorted { :self |
		self.copy.sort
	}

	sortedWithIndices { :self |
		self.sortedWithIndices(<=)
	}

	sortedWithIndices { :self :sortBlock:/2 |
		self.ifEmpty {
			[]
		} {
			self.withIndexCollect { :each :index |
				each -> index
			}.sorted { :p :q |
				sortBlock(p.key, q.key)
			}
		}
	}

	split { :self :aBlock:/2 |
		self.ifEmpty {
			[]
		} {
			let answer = [];
			let startIndex = 1;
			let previous = self.first;
			2.toDo(self.size) { :index |
				let next = self[index];
				aBlock(previous, next).ifFalse {
					answer.add(self.copyFromTo(startIndex, index - 1));
					startIndex := index
				};
				previous := next
			};
			answer.add(self.copyFromTo(startIndex, self.size));
			answer
		}
	}

	splitBy { :self :aCollection |
		let answer = [];
		self.splitByDo(aCollection) { :each |
			answer.add(each)
		};
		answer
	}

	splitByDo { :self :aCollection :aBlock:/1 |
		let lastIndex = 1;
		let nextIndex = nil;
		{
			nextIndex := self.indexOfSubstringStartingAt(aCollection, lastIndex);
			nextIndex = 0
		}.whileFalse {
			aBlock(self.copyFromTo(lastIndex, nextIndex - 1));
			lastIndex := nextIndex + aCollection.size
		};
		aBlock(self.copyFromTo(lastIndex, self.size))
	}

	subsequencesDo { :self :aBlock:/1 |
		self.isEmpty.if {
			[]
		} {
			let k = self.size;
			[1 .. k].powerSetDo { :each |
				aBlock(self @* each)
			}
		}
	}

	subsequences { :self :aPredicate:/1 |
		let answer = [];
		self.subsequencesDo { :each |
			aPredicate(each).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	subsequences { :self |
		self.subsequences(true.constant)
	}

	substringsDo { :self :aBlock:/1 |
		0.toDo(self.size) { :each |
			self.partitionDo(each, 1, aBlock:/1)
		}
	}

	substrings { :self :aPredicate:/1 |
		let answer = [];
		self.substringsDo { :each |
			aPredicate(each).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	substrings { :self |
		self.substrings(true.constant)
	}

	substringsInCommon { :self :aSequence :k |
		self.partition(k, 1).intersection(aSequence.partition(k, 1))
	}

	swapWith { :self :oneIndex :anotherIndex |
		let element = self[oneIndex];
		self[oneIndex] := self[anotherIndex];
		self[anotherIndex] := element
	}

	take { :self :count :fill |
		(count < 0).if {
			self.takeLast(count.negated, fill)
		} {
			self.takeFirst(count, fill)
		}
	}

	takeFirst { :self :count :fill |
		(count > self.size).if {
			self ++ (fill # (count - self.size))
		} {
			self.copyFromTo(1, count)
		}
	}

	takeLast { :self :count :fill |
		(count > self.size).if {
			(fill # (count - self.size)) ++ self
		} {
			self.copyFromTo(self.size - count + 1, self.size)
		}
	}

	takeList { :self :aSequence |
		let answer = [];
		let startIndex = 1;
		aSequence.do { :each |
			let endIndex = startIndex + each - 1;
			answer.add(self.copyFromTo(startIndex, endIndex));
			startIndex := endIndex + 1
		};
		answer
	}

	takeWhile { :self :aBlock:/1 |
		self.detectIndexIfFoundIfNone { :each |
			each.aBlock.not
		} { :i |
			self.copyFromTo(1, i - 1)
		} {
			self
		}
	}

	third { :self |
		self[self.firstIndex + 2]
	}

	third { :self :n |
		self.copyFromTo(n * 2 + 1, n * 3)
	}

	thirdLast { :self |
		self[self.lastIndex - 2]
	}

	trace { :self :aBlock:/1 |
		self.isVector.if {
			aBlock(self)
		} {
			self.isArray.if {
				let rank = self.rank;
				let limit = self.shape.min;
				aBlock(
					1:limit.collect { :each |
						self.atPath(each # rank)
					}
				)
			} {
				self.error('@Sequence>>trace: not an Array')
			}
		}
	}

	trace { :self |
		self.trace(sum:/1)
	}

	transposed { :self |
		1.toAsCollect(self.first.size, self.first.species) { :index |
			self.collect { :row |
				row[index]
			}
		}
	}

	tuplesDo { :self :aBlock:/1 |
		let tupleCount = self.collect(size:/1).product;
		let tuple = self.species.new(self.size);
		1.toDo(tupleCount) { :i |
			let k = i - 1;
			self.size.toByDo(1, -1) { :j |
				let fromSequence = self[j];
				tuple[j] := fromSequence[k % fromSequence.size + 1];
				k := k // fromSequence.size
			};
			aBlock(tuple)
		}
	}

	tuples { :self |
		let answer = [];
		self.tuplesDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	tuples { :self :count |
		(self ! count).tuples
	}

	upsample { :self :anInteger |
		let answer = List(self.size * anInteger, 0);
		0.to(self.size - 1).do { :each |
			answer[(each * anInteger) + 1] := self[each + 1]
		};
		answer
	}

	vectorAngle { :u :v |
		(u.isVector & { v.isVector }).if {
			(u.dot(v) / (u.norm * v.norm)).arcCos
		} {
			self.error('@Sequence>>vectorAngle: not vectors')
		}
	}

	withCollect { :self :aSequence :aBlock:/2 |
		self.withCollectWrapping(aSequence, aBlock:/2)
	}

	withCollectCrossed { :self :aSequence :aBlock:/2 |
		let answer = self.species.new(self.size * aSequence.size);
		let nextIndex = 1;
		self.do { :leftItem |
			aSequence.do { :rightItem |
				answer[nextIndex] := aBlock(leftItem, rightItem);
				nextIndex := nextIndex + 1
			}
		};
		answer
	}

	withCollectEqual { :self :aSequence :aBlock:/2 |
		self.isOfSameSizeCheck(aSequence);
		1.toAsCollect(self.size, self.species) { :index |
			aBlock(self[index], aSequence[index])
		}
	}

	withCollectFolding { :self :aCollection :aBlock:/2 |
		let maximumSize = self.size.max(aCollection.size);
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atFold(index), aCollection.atFold(index))
		}
	}

	withCollectOrAdaptTo { :self :anObject :aBlock:/2 |
		(anObject.isCollection & {
			anObject.isSequence
		}).if {
			self.withCollect(anObject, aBlock:/2)
		} {
			anObject.adaptToCollectionAndApply(self, aBlock:/2)
		}
	}

	withCollectOuter { :self :aSequence :aBlock:/2 |
		aBlock:/2.outer(self, aSequence)
	}

	withCollectTable { :self :aSequence :aBlock:/2 |
		self.collect { :each |
			aBlock(each, aSequence)
		}
	}

	withCollectTruncating { :self :aSequence :aBlock:/2 |
		(self.size < aSequence.size).if {
			self.withCollect(aSequence.take(self.size), aBlock:/2)
		} {
			self.take(aSequence.size).withCollect(aSequence, aBlock:/2)
		}
	}

	withCollectWrapping { :self :aSequence :aBlock:/2 |
		let maximumSize = self.size.max(aSequence.size);
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atWrap(index), aSequence.atWrap(index))
		}
	}

	withWithCollect { :self :aSequence :anotherSequence :aBlock:/3 |
		let maximumSize = [self, aSequence, anotherSequence].collect(size:/1).max;
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atWrap(index), aSequence.atWrap(index), anotherSequence.atWrap(index))
		}
	}

	withDo { :self :otherCollection :twoArgBlock:/2 |
		self.isOfSameSizeCheck(otherCollection);
		self.indicesDo { :index |
			twoArgBlock(self[index], otherCollection[index])
		}
	}

	withReplace { :self :otherCollection :aBlock:/2 |
		self.isOfSameSizeCheck(otherCollection);
		self.indicesDo { :index |
			self[index] := aBlock(self[index], otherCollection[index])
		}
	}

	withIndexCollect { :self :elementAndIndexBlock:/2 |
		let answer = self.species.ofSize(self.size);
		self.indicesDo { :index |
			answer[index] := elementAndIndexBlock(self[index], index)
		};
		answer
	}

	withIndexDo { :self :elementAndIndexBlock:/2 |
		self.indicesDo { :index |
			elementAndIndexBlock(self[index], index)
		}
	}

	withIndexReplace { :self :aBlock:/2 |
		self.indicesDo { :index |
			self[index] := aBlock(self[index], index)
		}
	}

}

+@Sequence {

	applyBinaryMathOperatorInPlace { :self :anObject :aBlock:/2 |
		anObject.isNumber.if {
			self.replace { :each |
				aBlock(each, anObject)
			}
		} {
			self.withReplace(anObject, aBlock:/2)
		}
	}

	+= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, +)
	}

	-= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, -)
	}

	*= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, *)
	}

	/= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, /)
	}

}

+@Integer {

	calkinWilfSequence { :self |
		let answer = List(self);
		answer[1] := 1/1;
		2.toDo(self) { :i |
			let p = answer[i - 1];
			let t = p.floor * 2 - p + 1;
			answer[i] := 1 / t
		};
		answer
	}

	fibonacciSequenceInto { :self :answer |
		let a = 0;
		let b = 1;
		let i = 0;
		{ i < self }.whileTrue {
			let tmp = b;
			answer.add(b);
			b := b + a;
			a := tmp;
			i := i + 1
		};
		answer
	}

	toAsCollect { :self :stop :species :aBlock:/1 |
		let answerSize = stop - self + 1;
		let answer = species.ofSize(answerSize);
		1.toDo(answerSize) { :index |
			answer[index] := aBlock(index + self - 1)
		};
		answer
	}

}

+@Object {

	isSequence { :self |
		false
	}

	rank { :self |
		0
	}

	shape { :self |
		[]
	}

}
