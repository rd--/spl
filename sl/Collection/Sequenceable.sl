{- Require: SmallFloat -}

@Sequenceable {

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

	@* { :self :indexArray |
		self.atAll(indexArray)
	}

	adaptToCollectionAndApply { :self :rcvr :aBlock:/2 |
		rcvr.isSequenceable.if {
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
		let aCollection = Array(anInteger);
		self.asDigitsAtInDo(1, aCollection, aBlock:/1)
	}


	atAllUsing { :self :indexArray :aBlock:/2 |
		let answer = self.species.ofSize(indexArray.size);
		indexArray.indicesDo { :index |
			answer[index] := aBlock(self, indexArray[index])
		};
		answer
	}

	atAll { :self :indexArray |
		self.atAllUsing(indexArray, at:/2)
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

	atFoldAll { :self :indexArray |
		self.atAllUsing(indexArray, atFold:/2)
	}

	atLastPut { :self :indexFromEnd :anObject |
		self[self.size + 1 - indexFromEnd] := anObject
	}

	atPin { :self :index |
		self[self.pinnedIndex(index)]
	}

	atPinAll { :self :indexArray |
		self.atAllUsing(indexArray, atPin:/2)
	}

	atPinPut { :self :index :value |
		self.atPut(self.pinnedIndex(index), value)
	}

	atWrap { :self :index |
		self[index - 1 % self.size + 1]
	}

	atWrapAll { :self :indexArray |
		self.atAllUsing(indexArray, atWrap:/2)
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

	beginsWith { :self :sequence |
		let sequenceSize = sequence.size;
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

	collect { :self :aBlock:/1 |
		let answer = self.species.ofSize(self.size);
		self.indicesDo { :index |
			answer[index] := aBlock(self[index])
		};
		answer
	}

	combinationsAtATimeDo { :self :kk :aBlock:/1 |
		let aCollection = Array(kk);
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

	duplicateEach { :self :anInteger |
		self.replicateEachApplying(anInteger, value:/1)
	}

	equalBy { :self :anObject :aBlock:/2 |
		self == anObject | {
			self.typeOf = anObject.typeOf & {
				self.hasEqualElementsBy(anObject, aBlock:/2)
			}
		}
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
			self.error('@Sequenceable>>findBinary: not found')
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
			self.error('@Sequenceable>>findBinaryIndex: not found')
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

	flattened { :self |
		let answer = [];
		self.do { :each |
			each.isCollection.if {
				answer.addAll(each.flattened)
			} {
				answer.add(each)
			}
		};
		answer
	}

	foldLeft { :self :aBlock:/2 |
		self.reduce(aBlock:/2)
	}

	foldRight { :self :aBlock:/2 |
		self.ifEmpty {
			self.errorEmptyCollection
		} {
			let answer = self.last;
			(self.size - 1).toByDo(1, -1) { :index |
				answer := aBlock(self[index], answer)
			};
			answer
		}
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
			let argumentArray = Array(numArgs);
			let index = 1;
			let endIndex = self.size - numArgs + 1;
			{
				index <= endIndex
			}.whileTrue {
				argumentArray.replaceFromToWithStartingAt(1, numArgs, self, index);
				aBlock.valueWithArguments(argumentArray);
				index := index + numArgs
			}
		}
	}

	grownBy { :self :length |
		let answer = self.species.ofSize(self.size + length);
		answer.replaceFromToWithStartingAt(1, self.size, self, 1)
	}

	hasEqualElementsBy { :self :otherCollection :aBlock:/2 |
		otherCollection.isSequenceable.and {
			self.size = otherCollection.size
		}.if {
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
		let answer = Array(self.size);
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

	isOctetSequence { :self |
		self.allSatisfy { :each |
			each.isInteger & {
				each.betweenAnd(0, 255)
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

	middle { :self |
		self[self.size // 2 + 1]
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

	prefixProduct { :self |
		self.scan(*)
	}

	prefixSum { :self |
		self.scan(+)
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

	replicateEachApplying { :self :anInteger :aBlock:/1 |
		let answerSize = self.size * anInteger;
		let answer = self.species.ofSize(answerSize);
		let answerIndex = 1;
		(1 .. self.size).do { :selfIndex |
			let entry = aBlock(self[selfIndex]);
			(1 .. anInteger).do { :unusedCounter |
				answer[answerIndex] := entry;
				answerIndex := answerIndex + 1
			}
		};
		answer
	}

	replicateEach { :self :anInteger |
		self.replicateEachApplying(anInteger, identity:/1)
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

	scan { :self :aBlock:/2 |
		self.ifEmpty {
			self.copy
		} {
			let answer = self.species.new(self.size);
			let sum = self[1];
			answer[1] := sum;
			2.toDo(self.size) { :index |
				sum := aBlock(sum, self[index]);
				answer[index] := sum
			};
			answer
		}
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

	rotatedLeft { :self :anInteger |
		(1 + anInteger).toAsCollect(self.size + anInteger, self.species) { :index |
			self.atWrap(index)
		}
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

	tuplesDo { :self :n :aBlock:/1 |
		self.size.tuplesIndicesDo(n) { :each |
			aBlock(self.atAll(each))
		}
	}

	tuples { :self :n |
		let answer = [];
		self.tuplesDo(n) { :each |
			answer.add(each)
		};
		answer
	}

	withCollect { :self :otherCollection :aBlock:/2 |
		self.isOfSameSizeCheck(otherCollection);
		1.toAsCollect(self.size, self.species) { :index |
			aBlock(self[index], otherCollection[index])
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
+@Sequenceable {

	+ { :self :arg |
		arg.adaptToCollectionAndApply(self, +)
	}

	- { :self :arg |
		arg.adaptToCollectionAndApply(self, -)
	}

	* { :self :arg |
		arg.adaptToCollectionAndApply(self, *)
	}

	/ { :self :arg |
		arg.adaptToCollectionAndApply(self, /)
	}

	< { :self :arg |
		arg.adaptToCollectionAndApply(self, <)
	}

	> { :self :arg |
		arg.adaptToCollectionAndApply(self, >)
	}

	^ { :self :arg |
		arg.adaptToCollectionAndApply(self, ^)
	}

	% { :self :arg |
		arg.adaptToCollectionAndApply(self, %)
	}

}

+@Sequenceable {

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
