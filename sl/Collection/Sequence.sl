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

	@* { :self :indexList |
		self.atAll(indexList)
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

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(n + 1, self.size)
	}

	allButFirstAndLast { :self |
		self.allButFirstAndLast(1)
	}

	allButFirstAndLast { :self :n |
		self.copyFromTo(n + 1, self.size - n)
	}

	allButFirstDo { :self :aBlock:/1 |
		2.toDo(self.size) { :index |
			aBlock(self[index])
		}
	}

	allButLast { :self |
		self.allButLast(1)
	}

	allButLast { :self :n |
		self.copyFromTo(1, self.size - n)
	}

	allButLastDo { :self :aBlock:/1 |
		1.toDo(self.size - 1) { :index |
			aBlock(self[index])
		}
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
			self.fromToPut(1, size, anObject)
		} {
			self.indicesDo { :index |
				self[index] := anObject
			}
		};
		anObject
	}

	atFold { :self :index |
		self[index.foldIndex(self.size)]
	}

	atFoldAll { :self :indexList |
		self.atAllUsing(indexList, atFold:/2)
	}

	atLastPut { :self :indexFromEnd :anObject |
		self[self.size + 1 - indexFromEnd] := anObject
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
		self[index - 1 % self.size + 1]
	}

	atWrapAll { :self :indexList |
		self.atAllUsing(indexList, atWrap:/2)
	}

	atWrapPut { :self :index :anObject |
		self[index - 1 % self.size + 1] := anObject
	}

	atRandomUsing { :self :random |
		self[random.nextRandomInteger(self.size)]
	}

	atRandom { :self |
		self[system.nextRandomInteger(self.size)]
	}

	beginsWith { :self :aSequence |
		aSequence.isSequence.if {
			let k = aSequence.size;
			valueWithReturn { :return:/1 |
				(self.size < k).ifTrue {
					false.return
				};
				1.toDo(k) { :index |
					(aSequence[index] = self[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			'Sequencable>>beginsWith: not a sequence'.error
		}
	}

	beginsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	brayCurtisDistance { :self :aSequence |
		(self - aSequence).abs.sum / (self + aSequence).abs.sum
	}

	canberraDistance { :self :aSequence |
		((self - aSequence).abs / (self.abs + aSequence.abs)).sum
	}

	chessboardDistance { :self :aSequence |
		(self - aSequence).abs.max
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

	concatenation { :self |
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

	copyFromTo { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self[index + start - 1]
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

	crossedMultiply { :self :aSequence |
		self.withCollectCrossed(aSequence, *)
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
				'@Sequence>>dotProduct: argument not vector or matrix'.error
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
						'@Sequence>>dotProduct: argument not vector or matrix'.error
					}
				}
			} {
				'@Sequence>>dotProduct: self not vector or matrix'.error
			}
		}
	}

	doWhileTrue { :self :activity:/1 :conditionBlock:/0 |
		let nextIndex = 1;
		let endIndex = self.size;
		{
			conditionBlock() & {
				nextIndex <= endIndex
			}
		}.whileTrue {
			activity(self[nextIndex]);
			nextindex := index + 1
		}
	}

	doWithout { :self :aBlock:/1 :anItem |
		self.indicesDo { :index |
			(anItem = self[index]).ifFalse {
				aBlock(self[index])
			}
		}
	}

	duplicateEach { :self :counts |
		counts.isInteger.ifTrue {
			counts := counts.replicate(self.size)
		};
		self.replicateEachApplying(counts, value:/1)
	}

	editDistance { :self :other |
		self.levenshteinDistance(other)
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

	fillFromWith { :self :aCollection :aBlock:/1 |
		let index = 1;
		aCollection.do { :each |
			self[index] := aBlock(each);
			index := index + 1
		};
		self
	}

	fillWith { :self :aBlock |
		self.indicesDo { :index |
			self[index] := aBlock.cull(index)
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
		self[1]
	}

	first { :self :n |
		self.copyFromTo(1, n)
	}

	firstIndex { :self |
		1
	}

	fisherYatesShuffleUsing { :self :random |
		self.size.downToDo(2) { :each |
			self.swapWith(each, random.nextRandomInteger(1, each))
		};
		self
	}

	fisherYatesShuffle { :self |
		self.fisherYatesShuffleUsing(system)
	}

	flattenedTo { :self :depth |
		(depth <= 0).if {
			self
		} {
			let answer = [];
			self.do { :each |
				each.isCollection.if {
					answer.addAll(each.flattenedTo(depth - 1))
				} {
					answer.add(each)
				}
			};
			answer
		}
	}

	flattened { :self |
		self.flattenedTo(inf)
	}

	foldLeftPrefix { :self :count :aBlock:/2 |
		self.ifEmpty {
			self.errorEmptyCollection
		} {
			let answer = self[1];
			2.upToDo(self.size) { :index |
				answer := aBlock(answer, self[index])
			};
			answer
		}
	}

	foldLeft { :self :aBlock:/2 |
		self.foldLeftPrefix(self.size, aBlock:/2)
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
		self[4]
	}

	fourth { :self :n |
		self.copyFromTo(n * 3 + 1, n * 4)
	}

	fromToDo { :self :start :stop :aBlock:/1 |
		start.toDo(stop) { :index |
			aBlock(self[index])
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

	indexOfSubCollection { :self :aSubCollection |
		self.indexOfSubCollectionStartingAt(aSubCollection, 1)
	}

	indexOfSubCollectionStartingAt { :self :subCollection :start |
		let subCollectionSize = subCollection.size;
		(subCollectionSize = 0).if {
			0
		} {
			let first = subCollection[1];
			valueWithReturn { :return:/1 |
				start.max(1).toDo(self.size - subCollectionSize + 1) { :startIndex |
					(self[startIndex] = first).ifTrue {
						let index = 2;
						{
							index <= subCollectionSize & {
								self[startIndex + index - 1] = subCollection[index]
							}
						}.whileTrue {
							index := index + 1
						};
						(index <= subCollectionSize).ifFalse {
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
		(1 .. self.size)
	}

	indicesSorted { :self |
		(1 .. self.size)
	}

	indicesDo { :self :aBlock:/1 |
		1.toDo(self.size, aBlock:/1)
	}

	indicesOfSubCollection { :self :subCollection |
		self.indicesOfSubCollectionStartingAt(subCollection, 1)
	}

	indicesOfSubCollectionStartingAt { :self :subCollection :initialIndex |
		let answer = [];
		let index = initialIndex - 1;
		{
			index := self.indexOfSubCollectionStartingAt(subCollection, index + 1);
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

	iota { :self |
		(1 .. self.product).reshape(self)
	}

	isArray { :self |
		{
			self.shape;
			true
		}.ifError {
			false
		}
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

	isOctetSequence { :self |
		self.allSatisfy { :each |
			each.isInteger & {
				each.betweenAnd(0, 255)
			}
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

	isVector { :self |
		let type = self.typeOf;
		self.noneSatisfy { :each |
			each.typeOf = type
		}
	}

	last { :self |
		self[self.size]
	}

	last { :self :n |
		let size = self.size;
		self.copyFromTo(size - n + 1, size)
	}

	lastIndex { :self |
		self.size
	}

	lastIndexOf { :self :anElement |
		self.lastIndexOfStartingAt(anElement, self.size)
	}

	lastIndexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		let index = self.lastIndexOfStartingAt(anElement, self.size);
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	lastIndexOfStartingAt { :self :anElement :lastIndex |
		valueWithReturn { :return:/1 |
			lastIndex.downToDo(1) { :index |
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

	manhattanDistance { :self :aSequence |
		(self - aSequence).abs.sum
	}

	median { :self |
		self.asSortedList.median
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
			'Sequence>>mixedRadixDecode: sequence too long'.error
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

	norm { :self |
		(self.scalarProduct(self.conjugated)).sqrt
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

	outerProduct { :self :aSequence |
		self *.outer aSequence
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

	permutations { :self |
		let answer = [];
		self.permutationsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	permutations { :self :size |
		self.powerSet { :each |
			each.size = size
		}.collect(permutations:/1).concatenation
	}

	permutationsDo { :self :aBlock:/1 |
		self.copy.permutationsStartingAtDo(1, aBlock:/1)
	}

	permutationsStartingAtDo { :self :anInteger :aBlock:/1 |
		(anInteger > self.size).if {
			self
		} {
			(anInteger = self.size).if {
				aBlock(self)
			} {
				anInteger.upToDo(self.size) { :index |
					self.swapWith(anInteger, index);
					self.permutationsStartingAtDo(anInteger + 1, aBlock:/1);
					self.swapWith(anInteger, index)
				}
			}
		}
	}

	pinnedIndex { :self :index |
		(index < 1).if {
			1
		} {
			(index > self.size).if {
				self.size
			} {
				index
			}
		}
	}

	powerSetDo { :self :aBlock:/1 |
		let size = 2 ^ self.size;
		let powersOfTwo = 2 ^ (0 .. self.size - 1);
		(0 .. size - 1).do { :i |
			let next = [];
			powersOfTwo.withIndexDo { :each :j |
				(i // each % 2 ~= 0).ifTrue {
					next.add(self[j])
				}
			};
			aBlock(next)
		};
		self
	}

	powerSet { :self :aBlock:/1 |
		let answer = [];
		self.powerSetDo { :each |
			aBlock(each).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	powerSet { :self |
		self.powerSet { :each |
			true
		}
	}

	prefixesDo { :self :aBlock:/1 |
		1.upToDo(self.size) { :each |
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

	rank { :self |
		self.shape.size
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
			self.error('replaceFromToWith: size of replacement doesnt match')
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
			'Sequence>>replicateEachApplying: counts not of correct size'.error
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
			counts := counts.replicate(self.size)
		};
		self.replicateEachApplying(counts, identity:/1)
	}

	reshape { :self :shape |
		shape.ifEmpty {
			'Sequence>>reshape: empty shape?'.error
		} {
			let size = shape.product;
			let answer = self.flattened.wrapExtend(size);
			shape.allButFirst.reverseDo { :n |
				answer := answer.clump(n)
			};
			answer
		}
	}

	reshapeLike { :self :another |
		let index = 1;
		let items = self.flattened;
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

	shape { :self |
		(self.size = 0).if {
			[0]
		} {
			let type = self.typeOf;
			let elementTypes = self.collect(typeOf:/1);
			elementTypes.allSatisfy { :each |
				each = type
			}.if {
				let elementShapes = self.collect(shape:/1);
				(elementShapes.nub.size = 1).if {
					[self.size] ++ elementShapes.first
				} {
					'@Sequence>>shape: irregular arrays do not have shape'.error
				}
			} {
				elementTypes.includes(type).if {
					'@Sequence>>shape: irregular arrays do not have shape'.error
				} {
					[self.size]
				}
			}
		}
	}

	suffixesDo { :self :aBlock:/1 |
		let size = self.size;
		1.upToDo(size) { :each |
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

	reverseDo { :self :aBlock:/1 |
		self.size.downToDo(1) { :index |
			aBlock(self[index])
		}
	}

	reverseWithDo { :self :aSequence :aBlock:/2 |
		(self.size ~= aSequence.size).if {
			self.error('reverseWithDo: unequal size')
		} {
			self.size.downToDo(1) { :index |
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

	second { :self |
		self[2]
	}

	second { :self :n |
		self.copyFromTo(n + 1, n * 2)
	}

	secondLast { :self |
		self[self.size - 1]
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
			nextIndex := self.indexOfSubCollectionStartingAt(aCollection, lastIndex);
			nextIndex = 0
		}.whileFalse {
			aBlock(self.copyFromTo(lastIndex, nextIndex - 1));
			lastIndex := nextIndex + aCollection.size
		};
		aBlock(self.copyFromTo(lastIndex, self.size))
	}

	swapWith { :self :oneIndex :anotherIndex |
		let element = self[oneIndex];
		self[oneIndex] := self[anotherIndex];
		self[anotherIndex] := element
	}

	third { :self |
		self[3]
	}

	third { :self :n |
		self.copyFromTo(n * 2 + 1, n * 3)
	}

	thirdLast { :self |
		self[self.size - 2]
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

	vectorAngle { :u :v |
		(u.isVector & { v.isVector }).if {
			(u.dot(v) / (u.norm * v.norm)).arcCos
		} {
			'Sequence>>vectorAngle: not vectors'.error
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

	withCollectWrapping { :self :aCollection :aBlock:/2 |
		let maximumSize = self.size.max(aCollection.size);
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atWrap(index), aCollection.atWrap(index))
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

}

{- Numerical -}
+@Sequence {

	+ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, +)
	}

	- { :self :anObject |
		anObject.adaptToCollectionAndApply(self, -)
	}

	* { :self :anObject |
		anObject.adaptToCollectionAndApply(self, *)
	}

	/ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, /)
	}

	// { :self :anObject |
		anObject.adaptToCollectionAndApply(self, //)
	}

	< { :self :anObject |
		anObject.adaptToCollectionAndApply(self, <)
	}

	> { :self :anObject |
		anObject.adaptToCollectionAndApply(self, >)
	}

	^ { :self :anObject |
		anObject.adaptToCollectionAndApply(self, ^)
	}

	% { :self :anObject |
		anObject.adaptToCollectionAndApply(self, %)
	}

	absArg { :self |
		self.collect(absArg:/1)
	}

	binomialCoefficient { :self :anObject |
		anObject.adaptToCollectionAndApply(self, binomialCoefficient:/2)
	}

	bitAnd { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitAnd:/2)
	}

	bitOr { :self :anObject |
		anObject.adaptToCollectionAndApply(self, bitOr:/2)
	}

	gcd { :self :anObject |
		anObject.adaptToCollectionAndApply(self, gcd:/2)
	}

	integerDigits { :self :anObject |
		anObject.adaptToCollectionAndApply(self, integerDigits:/2)
	}

	lcm { :self :anObject |
		anObject.adaptToCollectionAndApply(self, lcm:/2)
	}

	min { :self :anObject |
		anObject.adaptToCollectionAndApply(self, min:/2)
	}

	max { :self :anObject |
		anObject.adaptToCollectionAndApply(self, max:/2)
	}

	roundTo { :self :anObject |
		anObject.adaptToCollectionAndApply(self, roundTo:/2)
	}

	truncateTo { :self :anObject |
		anObject.adaptToCollectionAndApply(self, truncateTo:/2)
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
