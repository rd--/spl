@SequenceableCollection {

	equalsBy { :self :anObject :aBlock:/2 |
		(self == anObject) | {
			(self.typeOf = anObject.typeOf) & {
				self.hasEqualElementsBy(anObject, aBlock:/2)
			}
		}
	}

	= { :self :anObject |
		self.equalsBy(anObject, equals:/2)
	}

	~ { :self :anObject |
		self.equalsBy(anObject, tilde:/2)
	}

	++ { :self :aSequence |
		self.copyReplaceFromToWith(
			self.size + 1,
			self.size,
			aSequence
		)
	}

	allButFirst { :self |
		self.allButFirst(1)
	}

	allButFirst { :self :n |
		self.copyFromTo(n + 1, self.size)
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
		| aCollection = Array(anInteger); |
		self.asDigitsAtInDo(1, aCollection, aBlock:/1)
	}

	atAll { :self :indexArray |
		| answer = self.species.ofSize(indexArray.size); |
		indexArray.indicesDo { :index |
			answer[index] := self[indexArray[index]]
		};
		answer
	}

	atAllPut { :self :anObject |
		| size = self.size; |
		(size > 50).if {
			self.fromToPut(1, size, anObject)
		} {
			self.indicesDo { :index |
				self[index] := anObject
			}
		};
		anObject
	}

	atLastPut { :self :indexFromEnd :anObject |
		self[self.size + 1 - indexFromEnd] := anObject
	}

	atPin { :self :index |
		(index < 1).if {
			self.first
		} {
			(index > self.size).if {
				self.last
			} {
				self[index]
			}
		}
	}

	atWrap { :self :index |
		self[index - 1 % self.size + 1]
	}

	atWrapPut { :self :index :anObject |
		self[index - 1 % self.size + 1] := anObject
	}

	atRandomBy { :self :random |
		self[random.randomInteger(1, self.size)]
	}

	atRandom { :self |
		self.atRandomBy(system)
	}

	beginsWith { :self :sequence |
		| sequenceSize = sequence.size; |
		valueWithReturn { :return:/1 |
			(self.size < sequenceSize).ifTrue {
				false.return
			};
			1.toDo(sequenceSize) { :index |
				(sequence[index] = self[index]).ifFalse {
					false.return
				}
			};
			true
		}
	}

	beginsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	collect { :self :aProcedure:/1 |
		| answer = self.species.ofSize(self.size); |
		self.indicesDo { :index |
			answer[index] := aProcedure(self[index])
		};
		answer
	}

	combinationsAtATimeDo { :self :kk :aBlock:/1 |
		| aCollection = Array(kk); |
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
		|(
			answerSize = self.injectInto(0) { :sum :each |
				sum + each.size
			},
			answer = self.species.ofSize(answerSize),
			index = 1
		)|
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
		|(
			end = start - 1 + aCollection.size,
			newSize = self.size + end - stop,
			answer = self.species.ofSize(newSize)
		)|
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

	copyWithFirst { :self :newElement |
		| answer = self.copy; |
		answer.addFirst(newElement);
		answer
	}

	do { :self :aProcedure:/1 |
		self.indicesDo { :index |
			aProcedure(self[index])
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

	doWhile { :self :activity:/1 :condition:/0 |
		| nextIndex = 1, endIndex = self.size; |
		{ condition() & { nextIndex <= endIndex } }.whileTrue {
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
			self.error('@SequenceableCollection>>findBinary: not found')
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
			self.error('@SequenceableCollection>>findBinaryIndex: not found')
		}
	}

	findBinaryIndexDoIfNone { :self :aBlock:/1 :actionBlock:/1 :exceptionBlock |
		| low = 1, high = self.size; |
		valueWithReturn { :return:/1 |
			{ high < low }.whileFalse {
				| index = high + low // 2, test = aBlock(self[index]); |
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

	first { :self |
		self[1]
	}

	first { :self :n |
		self.copyFromTo(1, n)
	}

	firstIndex { :self |
		1
	}

	fisherYatesShuffleBy { :self :random |
		self.size.downToDo(2) { :item |
			self.swapWith(item, random.randomInteger(1, item))
		};
		self
	}

	fisherYatesShuffle { :self |
		self.fisherYatesShuffleBy(system)
	}

	flattened { :self |
		| answer = []; |
		self.do { :item |
			item.isCollection.if {
				answer.addAll(item.flattened)
			} {
				answer.add(item)
			}
		};
		answer
	}

	forceToPaddingWith { :self :length :anObject |
		| answer = self.species.new(length); |
		answer.atAllPut(anObject);
		answer.replaceFromToWithStartingAt(1, self.size.min(length), self, 1);
		answer
	}

	foldLeft { :self :aProcedure:/2 |
		self.reduce(aProcedure:/2)
	}

	foldRight { :self :aProcedure:/2 |
		self.ifEmpty {
			self.errorEmptyCollection
		} {
			| answer = self.last; |
			(self.size - 1).toByDo(1, -1) { :index |
				answer := aProcedure(self[index], answer)
			};
			answer
		}
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
			| written = 1, toWrite = endIndex - startIndex + 1, thisWrite = nil; |
			self[startIndex] := anObject;
			(written < toWrite).whileTrue {
				thisWrite := written.min(toWrite - written);
				self.replaceFromToWithStartingAt(
					startIndex + written,
					startIndex + written + thisWrite - 1,
					self,
					startIndex
				)
			};
			written := written + thisWrite
		};
		anObject
	}

	groupsDo { :self :aBlock |
		|numArgs = aBlock.numArgs; |
		numArgs.caseOfOtherwise([
			{ 0 } -> { self.error('groupsDo: At least one block argument expected') },
			{ 1 } -> { self.do(aBlock) },
			{ 2 } -> { self.pairsDo(aBlock) }
		]) {
			|(
				argumentArray = Array(numArgs),
				index = 1,
				endIndex = self.size - numArgs + 1
			)|
			{ index <= endIndex }.whileTrue {
				argumentArray.replaceFromToWithStartingAt(1, numArgs, self, index);
				aBlock.valueWithArguments(argumentArray);
				index := index + numArgs
			}
		}
	}

	grownBy { :self :length |
		| answer = self.species.ofSize(self.size + length); |
		answer.replaceFromToWithStartingAt(1, self.size, self, 1)
	}

	hasEqualElementsBy { :self :otherCollection :aBlock:/2 |
		(otherCollection.isSequenceable & {
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
		self.hasEqualElementsBy(otherCollection, equals:/2)
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
		| index = self.indexOfStartingAt(anElement, 1); |
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
		| subCollectionSize = subCollection.size; |
		(subCollectionSize = 0).if {
			0
		} {
			| first = subCollection[1]; |
			valueWithReturn { :return:/1 |
				start.max(1).toDo(self.size - subCollectionSize + 1) { :startIndex |
					(self[startIndex] = first).ifTrue {
						| index = 2; |
						{
							(index <= subCollectionSize) & {
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
		| answer = Array(self.size); |
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
		| answer = [], index = initialIndex - 1; |
		{
			index := self.indexOfSubCollectionStartingAt(subCollection, index + 1);
			index = 0
		}.whileFalse {
			answer.add(index)
		};
		answer
	}

	isOctetSequence { :self |
		self.allSatisfy { :each |
			each.isInteger & {
				each >= 0
			} & {
				each < 256
			}
		}
	}

	isSequenceable { :self |
		true
	}

	isSorted { :self |
		self.isSortedBetweenAnd(1, self.size)
	}

	isSortedBetweenAnd { :self :startIndex :endIndex |
		self.isSortedByBetweenAnd(lessThanEquals:/2, startIndex, endIndex)
	}

	isSortedBy { :self :aProcedure:/2 |
		self.isSortedByBetweenAnd(aProcedure:/2, 1, self.size)
	}

	isSortedByBetweenAnd { :self :aProcedure:/2 :startIndex :endIndex |
		(endIndex <= startIndex).if {
			true
		} {
			| previousElement = self[startIndex]; |
			valueWithReturn { :return:/1 |
				(startIndex + 1).toDo(endIndex) { :index |
					| element = self[index]; |
					aProcedure(previousElement, element).ifFalse {
						false.return
					};
					previousElement := element
				};
				true
			}
		}
	}

	last { :self |
		self[self.size]
	}

	last { :self :n |
		| size = self.size; |
		self.copyFromTo(size - n + 1, size)
	}

	lastIndex { :self |
		self.size
	}

	lastIndexOf { :self :anElement |
		self.lastIndexOfStartingAt(anElement, self.size)
	}

	lastIndexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		| index = self.lastIndexOfStartingAt(anElement, self.size); |
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
		| index = self.lastIndexOfStartingAt(anElement, lastIndex); |
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	middle { :self |
		self[self.size // 2 + 1]
	}

	pairsCollect { :self :aBlock:/2 |
		(1 .. self.size // 2).collect { :index |
			aBlock(self[2 * index - 1], self[2 * index])
		}
	}

	pairsDo { :self :aProcedure:/2 |
		1.toDo(self.size // 2) { :index |
			aProcedure(self[2 * index - 1], self[2 * index])
		}
	}

	permutations { :self |
		| answer = []; |
		self.permutationsDo { :each |
			answer.add(each.copy)
		};
		answer
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

	replace { :self :aBlock:/1 |
		self.indicesDo { :index |
			self[index] := aBlock(self[index])
		}
	}

	replaceFromToWith { :self :start :stop :replacement |
		(replacement.size = (stop - start + 1)).if {
			self.replaceFromToWithStartingAt(start, stop, replacement, 1)
		} {
			self.error('replaceFromToWith: size of replacement doesnt match')
		}
	}

	replaceFromToWithStartingAt { :self :start :stop :replacement :replacementStart |
		| replacementOffset = replacementStart - start, index = start; |
		{ index <= stop }.whileTrue {
			self[index] := replacement[replacementOffset + index];
			index := index + 1
		};
		self
	}

	reversed { :self |
		| answer = self.species.ofSize(self.size), fromIndex = self.size + 1; |
		self.indicesDo { :toIndex |
			answer[toIndex] := self[fromIndex - 1];
			fromIndex := fromIndex - 1
		};
		answer
	}

	reverseDo { :self :aProcedure:/1 |
		self.size.downToDo(1) { :index |
			aProcedure(self[index])
		}
	}

	reverseWithDo { :self :aSequenceableCollection :aBlock:/2 |
		(self.size ~= aSequenceableCollection.size).if {
			self.error('reverseWithDo: unequal size')
		} {
			self.size.downToDo(1) { :index |
				aBlock(self[index], aSequenceableCollection[index])
			}
		}
	}

	rotate { :self :anInteger |
		self.rotateRight(anInteger)
	}

	rotateLeft { :self :anInteger |
		(1 + anInteger).toAsCollect(self.size + anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	rotateRight { :self :anInteger |
		(1 - anInteger).toAsCollect(self.size - anInteger, self.species) { :index |
			self.atWrap(index)
		}
	}

	second { :self |
		self[2]
	}

	secondLast { :self |
		self[self.size - 1]
	}

	select { :self :aProcedure:/1 |
		| answer = []; |
		self.indicesDo { :index |
			aProcedure(self[index]).ifTrue {
				answer.add(self[index])
			}
		};
		self.species.newFrom(answer)
	}

	shuffleBy { :self :random |
		self.fisherYatesShuffleBy(random)
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

	sortedWithIndices { :self |
		self.sortedWithIndices(lessThanEquals:/2)
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
		| answer = []; |
		self.splitByDo(aCollection) { :each |
			answer.add(each)
		};
		answer
	}

	splitByDo { :self :aCollection :aProcedure:/1 |
		| lastIndex = 1, nextIndex = nil; |
		{
			nextIndex := self.indexOfSubCollectionStartingAt(aCollection, lastIndex);
			nextIndex = 0
		}.whileFalse {
			aProcedure(self.copyFromTo(lastIndex, nextIndex - 1));
			lastIndex := nextIndex + aCollection.size
		};
		aProcedure(self.copyFromTo(lastIndex, self.size))
	}

	swapWith { :self :oneIndex :anotherIndex |
		| element = self[oneIndex]; |
		self[oneIndex] := self[anotherIndex];
		self[anotherIndex] := element
	}

	third { :self |
		self[3]
	}

	thirdLast { :self |
		self[self.size - 2]
	}

	transpose { :self |
		1.toAsCollect(self.first.size, self.first.species) { :index |
			self.collect { :row |
				row[index]
			}
		}
	}

	withCollect { :self :otherCollection :aProcedure:/2 |
		self.isOfSameSizeCheck(otherCollection);
		1.toAsCollect(self.size, self.species) { :index |
			aProcedure(self[index], otherCollection[index])
		}
	}

	withDo { :self :otherCollection :twoArgBlock:/2 |
		self.isOfSameSizeCheck(otherCollection);
		self.indicesDo { :index |
			twoArgBlock(self[index], otherCollection[index])
		}
	}

	withReplace { :self :otherCollection :aProcedure:/2 |
		self.isOfSameSizeCheck(otherCollection);
		self.indicesDo { :index |
			self[index] := aProcedure(self[index], otherCollection[index])
		}
	}

	withIndexCollect { :self :elementAndIndexProcedure:/2 |
		| answer = self.species.ofSize(self.size); |
		self.indicesDo { :index |
			answer[index] := elementAndIndexProcedure(self[index], index)
		};
		answer
	}

	withIndexDo { :self :elementAndIndexProcedure:/2 |
		self.indicesDo { :index |
			elementAndIndexProcedure(self[index], index)
		}
	}

}

+@SequenceableCollection {

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
		applyBinaryMathOperatorInPlace(self, anObject, plus:/2)
	}

	-= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, minus:/2)
	}

	*= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, times:/2)
	}

	/= { :self :anObject |
		applyBinaryMathOperatorInPlace(self, anObject, dividedBy:/2)
	}

}

+SmallFloat {

	fibonacciSequenceInto { :self :answer |
		| a = 0, b = 1, i = 0, temp = nil; |
		{ i < self }.whileTrue {
			answer.add(b);
			temp := b;
			b := a + b;
			a := temp;
			i := i + 1
		};
		answer
	}

}
