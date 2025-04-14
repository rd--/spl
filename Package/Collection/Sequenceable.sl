/* Require: SmallFloat */

@Sequenceable {

	= { :self :anObject |
		self.equalBy(anObject, =)
	}

	~ { :self :anObject |
		self.equalBy(anObject, ~)
	}

	++ { :self :aList |
		self.copyReplaceFromToWith(
			self.size + 1,
			self.size,
			aList
		)
	}

	++ { :self |
		self.catenate
	}

	+++ { :self :aList |
		self ++.each aList
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

	adaptToCollectionAndApply { :self :anObject :aBlock:/2 |
		anObject.isSequenceable.if {
			anObject.withCollect(self, aBlock:/2)
		} {
			self.error('@Sequenceable: only sequenceable collections may be processed elementwise')
		}
	}

	adjacentPairs { :self |
		self.adjacentPairsCollect { :i :j |
			self.species.newFrom([i, j])
		}
	}

	adjacentPairsDo { :self :aBlock:/2 |
		1.toDo(self.size - 1) { :i |
			aBlock(self[i], self[i + 1])
		}
	}

	adjacentPairsCollect { :self :aBlock:/2 |
		let answer = self.species.new(self.size - 1);
		let index = 1;
		self.adjacentPairsDo { :p :q |
			answer[index] := aBlock(p, q);
			index := index + 1
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
				index = self.size
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
		self.copyFromTo(1 + n, self.size)
	}

	allButFirstAndLast { :self |
		self.allButFirstAndLast(1)
	}

	allButFirstAndLast { :self :n |
		self.copyFromTo(1 + n, self.size - n)
	}

	allButFirstDo { :self :aBlock:/1 |
		(1 + 1).toDo(self.size) { :index |
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
					self.error('@Sequenceable>>asRange: not an arithmetic series')
				}
			}
		}
	}

	asSpan { :self |
		self.asRange.asSpan
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
				(1 + 1).toDo(self.size) { :i |
					(self[i] - self[i - 1] = step).ifFalse {
						answer.add(Range(start, self[i - 1], step));
						start := self[i];
						(i = self.size).if {
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

	asSpanList { :self |
		self.asRangeList.collect(asSpan:/1)
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

	atAll { :self :primaryIndices :secondaryIndices |
		self.atAll(primaryIndices).collect { :each |
			each.atAll(secondaryIndices)
		}
	}

	atAll { :self :primaryIndices :secondaryIndices :tertiaryIndices |
		self.atAll(primaryIndices).collect { :each |
			each.atAll(secondaryIndices, tertiaryIndices)
		}
	}

	atAllFold { :self :indexList |
		self.atAllUsing(indexList, atFold:/2)
	}

	atAllMissing { :self :indexList |
		self.atAllUsing(indexList, atMissing:/2)
	}

	atAllNil { :self :indexList |
		self.atAllUsing(indexList, atNil:/2)
	}

	atAllPin { :self :indexList |
		self.atAllUsing(indexList, atPin:/2)
	}

	atAllPath { :self :indexList |
		self.atAllUsing(indexList, atPath:/2)
	}

	atAllPut { :self :anObject |
		let size = self.size;
		(size > 50).if {
			self.fromToPut(1, self.size, anObject)
		} {
			self.indicesDo { :index |
				self[index] := anObject
			}
		};
		anObject
	}

	atAllSymmetrical { :self :indexList |
		self.atAllUsing(indexList, atSymmetrical:/2)
	}

	atAllValid { :self :indexList |
		self.atAllMissing(indexList).deleteMissing
	}

	atAllWrap { :self :indexList |
		self.atAllUsing(indexList, atWrap:/2)
	}

	atFold { :self :index |
		self[self.foldedIndex(index)]
	}

	atLastPut { :self :indexFromEnd :anObject |
		self[self.size + 1 - indexFromEnd] := anObject
	}

	atMod { :self :index :n |
		self[index - 1 % n + 1]
	}

	atMod { :self :index |
		let n = self.size;
		self[index - 1 % n + 1]
	}

	atPin { :self :index |
		self[self.pinnedIndex(index)]
	}

	atPutPin { :self :index :value |
		self.atPut(self.pinnedIndex(index), value)
	}

	atPutWrap { :self :index :anObject |
		let k = index.wrapBetweenAnd(1, self.size + 1);
		self[k] := anObject
	}

	atSymmetrical { :self :index |
		index.isInteger.ifFalse {
			self.error('atSymmetrical: invalid index')
		};
		(index > 0).if {
			self.at(index)
		} {
			self.at(self.size + index + 1)
		}
	}

	atUsing { :self :operand :aBlock:/1 |
		operand.isCollection.if {
			let answer = self.species.ofSize(operand.size);
			operand.indicesDo { :each |
				answer[each] := aBlock(operand.at(each))
			};
			answer
		} {
			aBlock(self, operand)
		}
	}

	atWrap { :self :index |
		let k = index.wrapBetweenAnd(1, self.size + 1);
		self[k]
	}

	atRandom { :self |
		self.randomChoice(system, [])
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

	beginsWith { :self :aList |
		aList.isSequenceable.if {
			valueWithReturn { :return:/1 |
				(self.size < aList.size).ifTrue {
					false.return
				};
				aList.indicesDo { :index |
					(aList[index] = self[index]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			self.error('@Sequenceable>>beginsWith: not a sequence')
		}
	}

	beginsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :prefix |
			self.beginsWith(prefix)
		}
	}

	binaryDetectIndex { :self :aBlock:/1 |
		self.size.binaryDetectIndex { :i |
			aBlock(self[i])
		}
	}

	binarySearch { :self :item |
		let n = self.size;
		let i = n.binaryDetectIndex { :each |
			self[each] >= item
		};
		((i <= n) & { self[i] = item }).if {
			i
		} {
			0
		}
	}

	binarySearchLeftmost { :self :item |
		let n = self.size;
		let l = 0;
		let r = n;
		{ l < r }.whileTrue {
			let m = floor((l + r) / 2);
			(self[m + 1] < item).if {
				l := m + 1
			} {
				r := m
			}
		};
		(l < n & { self[l + 1] = item }).if {
			l + 1
		} {
			l
		}
	}

	binarySearchRightmost { :self :item |
		let n = self.size;
		let l = 0;
		let r = n;
		{ l < r }.whileTrue {
			let m = floor((l + r) / 2);
			(self[m + 1] > item).if {
				r := m
			} {
				l := m + 1
			}
		};
		(r = 0).if {
			1
		} {
			(r = n).if {
				n + 1
			} {
				(self[r] = item).if {
					r
				} {
					r + 1
				}
			}
		}
	}

	bisect { :self :anObject |
		self.binarySearchRightmost(anObject)
	}

	cartesianIndex { :shape :anInteger |
		(anInteger - 1).mixedRadixEncode(shape) + 1
	}

	centerArray { :aList :anInteger :anObject |
		(aList.size > anInteger).if {
			aList.error('centerArray')
		} {
			let prefixSize = (anInteger - aList.size / 2).ceiling.max(0);
			let suffixSize = (anInteger - aList.size - prefixSize).max(0);
			(anObject # prefixSize) ++ aList ++ (anObject # suffixSize)
		}
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

	combinations { :self :m |
		let answer = [];
		self.combinationsAtATimeDo(m) { :each |
			answer.add(each.copy)
		};
		answer
	}

	compare { :self :aList |
		let n = self.size;
		let m = aList.size;
		valueWithReturn { :return:/1 |
			1.toDo(n.min(m)) { :i |
				let c = self[i] <=> aList[i];
				(c ~= 0).ifTrue {
					c.return
				}
			};
			n <=> m
		}
	}

	catenateSeparatedBy { :self :aList |
		self.ifEmpty {
			self.copy
		} {
			let answerSize = self.injectInto(0) { :sum :each |
				sum + each.size
			} + (self.size - 1 * aList.size);
			let answer = self.species.ofSize(answerSize);
			let index = 1;
			let put = { :items |
				items.do { :item |
					answer[index] := item;
					index := index + 1
				}
			};
			self.allButLastDo { :each |
				put(each);
				put(aList)
			};
			put(self.last);
			answer
		}
	}

	catenate { :self :isChecked |
		isChecked.ifTrue {
			(self.elementType = self.typeOf).ifFalse {
				self.error('@Sequenceable>>catenate: invalid element type')
			}
		};
		self.catenateSeparatedBy([])
	}

	catenate { :self |
		self.catenate(false)
	}

	constantArray { :self :anObject |
		[anObject].reshape(self)
	}

	convergents { :self |
		self.prefixes.collect(fromContinuedFraction:/1)
	}

	copyFromTo { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self[index + start - 1]
		}
	}

	copyFromToInto { :self :start :stop :aList |
		1.toDo(stop - start + 1) { :index |
			aList[index] := self[index + start - 1]
		}
	}

	copyFromToPin { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self.atPin(index + start - 1)
		}
	}

	copyFromToWrap { :self :start :stop |
		1.toAsCollect(stop - start + 1, self.species) { :index |
			self.atWrap(index + start - 1)
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
				answer.catenate
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

	copyReplaceFromToWithObject { :self :start :stop :anObject |
		self.copyReplaceFromToWith(start, stop, anObject # (stop - start + 1).max(1))
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

	cross { :u |
		let [x, y] = u;
		[y.-, x]
	}

	cross { :u :v |
		let k = u.size;
		(k = 2).if {
			let [ux, uy] = u;
			let [vx, vy] = v;
			(ux * vy) - (uy * vx)
		} {
			let [ux, uy, uz] = u;
			let [vx, vy, vz] = v;
			[
				(uy * vz) - (uz * vy),
				(uz * vx) - (ux * vz),
				(ux * vy) - (uy * vx)
			]
		}
	}

	crossedMultiply { :self :aList |
		self.withCollectCrossed(aList, *)
	}

	deBruijnSequence { :self :anInteger |
		self.lyndonWords(anInteger).select { :each |
			let k = each.size;
			k = 1 | { k.divisible(anInteger) }
		}.catenate
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
		self.detectIndexStartingAtIfFoundIfNone(predicate:/1, 1, identity:/1, { })
	}

	detectIndexIfFound { :self :predicate:/1 :ifFound:/1 |
		self.detectIndexStartingAtIfFoundIfNone(predicate:/1, 1, ifFound:/1, { })
	}

	detectIndexIfFoundIfNone { :self :predicate:/1 :ifFound:/1 :ifNone:/0 |
		self.detectIndexStartingAtIfFoundIfNone(predicate:/1, 1, ifFound:/1, ifNone:/0)
	}

	detectIndexStartingAt { :self :predicate:/1 :startIndex |
		self.detectIndexStartingAtIfFoundIfNone(predicate:/1, startIndex, identity:/1, { })
	}

	detectIndexStartingAtIfFoundIfNone { :self :predicate:/1 :startIndex :ifFound:/1 :ifNone:/0 |
		valueWithReturn { :return:/1 |
			startIndex.toDo(self.size) { :index |
				predicate(self[index]).ifTrue {
					ifFound(index).return
				}
			};
			ifNone()
		}
	}

	detectIndices { :self :predicate:/1 |
		let answer = [];
		1.toDo(self.size) { :i |
			predicate(self.at(i)).ifTrue {
				answer.add(i)
			}
		};
		answer
	}

	detectStartingAt { :self :predicate:/1 :startIndex |
		self.detectStartingAtIfFoundIfNone(predicate:/1, startIndex) { :item |
			item
		} {
			self.error('@Sequenceable>>detectStartingAt: no such item')
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

	differences { :self |
		self.partitionCollect(2, 1) { :each |
			each[2] - each[1]
		}
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

	doWithout { :self :aBlock:/1 :anItem |
		self.indicesDo { :index |
			(anItem = self[index]).ifFalse {
				aBlock(self[index])
			}
		}
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

	endsWith { :self :aList |
		aList.isSequenceable.if {
			let sequenceSize = aList.size;
			let offset = self.size - sequenceSize;
			valueWithReturn { :return:/1 |
				(offset < 0).ifTrue {
					false.return
				};
				1.toDo(sequenceSize) { :index |
					(aList[index] = self[index + offset]).ifFalse {
						false.return
					}
				};
				true
			}
		} {
			self.error('@Sequenceable>>endsWith: not a sequence')
		}
	}

	endsWithAnyOf { :self :aCollection |
		aCollection.anySatisfy { :suffix |
			self.endsWith(suffix)
		}
	}

	equalBy { :self :anObject :aBlock:/2 |
		self == anObject | {
			self.typeOf = anObject.typeOf & {
				self.hasEqualElementsBy(anObject, aBlock:/2)
			}
		}
	}

	eulerMatrix { :self |
		let [ca, cb, cc] = self.cos;
		let [sa, sb, sc] = self.sin;
		[
			[(ca * cb * cc) - (sa * sc), 0 - (cc * sa)  - (ca * cb * sc), ca * sb],
			[(cb * cc * sa) + (ca * sc), (ca * cc) - (cb * sa * sc), sa * sb],
			[0 - (cc * sb), sb * sc, cb]
		]
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

	extract { :self :positionList |
		positionList.collect { :each |
			self.part(each)
		}
	}

	fastWalshHadamardTransform { :self |
		let h = 1;
		let k = self.size;
		k.isPowerOfTwo.ifFalse {
			self.addAll(List(k.asLargerPowerOfTwo - k, 0));
			k := self.size
		};
		{
			h < k
		}.whileTrue {
			1.toByDo(k, h * 2) { :i |
				i.toDo(i + h - 1) { :j |
					let x = self[j];
					let y = self[j + h];
					self[j] := x + y;
					self[j + h] := x - y
				}
			};
			h := h * 2
		};
		self
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

	first { :self :n :zero |
		let k = self.size;
		(k >= n).if {
			self.copyFromTo(1, n)
		} {
			self ++ (zero # (n - k))
		}
	}

	fisherYatesShuffle { :self :rng |
		self.size.toByDo(2, -1) { :each |
			self.swapWith(
				each,
				rng.nextRandomInteger(1, each)
			)
		};
		self
	}

	fisherYatesShuffle { :self |
		self.fisherYatesShuffle(system)
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
		self.flattenTo(Infinity)
	}

	flatten { :self :depth |
		self.flattenTo(depth)
	}

	foldedIndex { :self :index |
		index.foldBetweenAnd(1, self.size)
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
		self[1 + 3]
	}

	fourth { :self :n |
		self.copyFromTo(n * 3 + 1, n * 4)
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

	fromToDo { :self :start :stop :aBlock:/1 |
		start.toDo(stop) { :index |
			aBlock(self[index])
		}
	}

	fromToKeysAndValuesDo { :self :start :stop :aBlock:/2 |
		start.toDo(stop) { :index |
			aBlock(index, self[index])
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

	includesScatteredSubsequence { :self :aList |
		valueWithReturn { :return:/1 |
			1.to(self.size).powerSetDo { :each |
				each.isArithmeticSeriesBy(1, =).ifFalse {
					(self @* each = aList).ifTrue {
						true.return
					}
				}
			};
			false
		}
	}

	includesSubsequence { :self :aList |
		valueWithReturn { :return:/1 |
			let i = 1;
			aList.do { :each |
				i := self.indexOfStartingAtBy(each, i, =);
				(i = 0).ifTrue {
					false.return
				}
			};
			true
		}
	}

	includesSubstring { :self :aList |
		let k = aList.size;
		let c = aList.first;
		self.indicesOf(c).anySatisfy { :i |
			(1 .. k).allSatisfy { :j |
				self[i + j - 1] = aList[j]
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
			(1 .. self.size).gather { :i |
				increasing(self.first(i).last(1), self.drop(i))
			}
		}
	}

	increasingSubsequenceList { :self |
		self.increasingSubsequenceList(<)
	}

	indexOf { :self :anElement |
		self.indexOfStartingAtBy(anElement, 1, =)
	}

	indexOfBy { :self :anElement :aBlock:/2 |
		self.indexOfStartingAtBy(anElement, 1, aBlock:/2)
	}

	indexOfIfAbsent { :self :anElement :exceptionBlock:/0 |
		let index = self.indexOfStartingAtBy(anElement, 1, =);
		(index = 0).if {
			exceptionBlock()
		} {
			index
		}
	}

	indexOfStartingAtBy { :self :anElement :start :aBlock:/2 |
		valueWithReturn { :return:/1 |
			start.toDo(self.size) { :index |
				aBlock(self[index], anElement).ifTrue {
					index.return
				}
			};
			0
		}
	}

	indexOfSubstring { :self :aList |
		self.indexOfSubstringStartingAt(aList, 1)
	}

	indexOfSubstringStartingAt { :self :aList :start |
		let k = aList.size;
		(k = 0).if {
			0
		} {
			let first = aList[1];
			valueWithReturn { :return:/1 |
				start.max(1).toDo(self.size - k + 1) { :startIndex |
					(self[startIndex] = first).ifTrue {
						let index = 2;
						{
							index <= k & {
								self[startIndex + index - 1] = aList[index]
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
		(1 .. self.size)
	}

	indicesSorted { :self |
		self.indices
	}

	indicesDo { :self :aBlock:/1 |
		1.toDo(self.size, aBlock:/1)
	}

	indicesOfSubsequence { :self :aList |
		let answer = [];
		1.to(self.size).powerSetDo { :each |
			(self @* each = aList).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	indicesOfSubstring { :self :aList |
		self.indicesOfSubstringStartingAt(aList, 1)
	}

	indicesOfSubstringStartingAt { :self :aList :initialIndex |
		let answer = [];
		let index = initialIndex - 1;
		{
			index := self.indexOfSubstringStartingAt(aList, index + 1);
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

	interleave { :self :aList |
		let answer = [];
		let k = self.size.max(aList.size);
		1.toDo(k) { :i |
			answer.add(self.atWrap(i));
			answer.add(aList.atWrap(i))
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

	isArithmeticSeries { :self |
		(self.size <= 1).if {
			true
		} {
			self.isArithmeticSeriesBy(self.second - self.first, =)
		}
	}

	isArithmeticSeriesBy { :self :aNumber :aBlock:/2 |
		(self.size <= 1).if {
			true
		} {
			valueWithReturn { :return:/1 |
				self.adjacentPairsDo { :a :b |
					aBlock(b - a, aNumber).ifFalse {
						false.return
					}
				};
				true
			}
		}
	}

	isCloseTo { :self :anObject |
		self.equalBy(anObject, isCloseTo:/2)
	}

	isGeometricSeries { :self |
		(self.size <= 1).if {
			true
		} {
			self.isGeometricSeriesBy(self.second / self.first, =)
		}
	}

	isGeometricSeriesBy { :self :aNumber :aBlock:/2 |
		(self.size <= 1).if {
			true
		} {
			valueWithReturn { :return:/1 |
				self.adjacentPairsDo { :a :b |
					aBlock(b / a, aNumber).ifFalse {
						false.return
					}
				};
				true
			}
		}
	}

	isMonotonicallyIncreasing { :self |
		self.isFinite & {
			self.isSortedBy(<=)
		}
	}

	isOctetSequence { :self |
		self.allSatisfy { :each |
			each.isInteger & {
				each.betweenAnd(0, 255)
			}
		}
	}

	isRegularlySpaced { :self |
		let k = self.size;
		(k <= 2).if {
			true
		} {
			let z = self[2] - self[1];
			(3 .. k).allSatisfy { :i |
				(self[i] - self[i - 1]) = z
			}
		}
	}

	isSequenceable { :unused |
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

	isStrictlyIncreasing { :self |
		self.isFinite & {
			self.isSortedBy(<)
		}
	}

	kadanesAlgorithm { :self |
		let answer = -Infinity;
		let currentSum = 0;
		self.do { :x |
			currentSum := max(x, currentSum + x);
			answer := max(answer, currentSum)
		};
		answer
	}

	keysAndValuesDo { :self :aBlock:/2 |
		self.withIndexDo { :each :index |
			aBlock(index, each)
		}
	}

	last { :self |
		self[self.size]
	}

	last { :self :n |
		let i = self.size;
		self.copyFromTo(i - n + 1, i)
	}

	last { :self :n :zero |
		let i = self.size;
		(i >= n).if {
			self.copyFromTo(i - n + 1, i)
		} {
			(zero # (n - i)) ++ self
		}
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
			lastIndex.toByDo(1, -1) { :index |
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

	lexicographicallyLeastRotationStartIndex { :self |
		let n = self.size;
		let f = List(2 * n, -1);
		let k = 0;
		let b = { :i | self[i - 1 % n + 1] };
		1.toDo(2 * n - 1) { :j |
			let i = f[j - k];
			{
				(i ~= -1) & {
					b(j) ~= b(k + i + 1)
				}
			}.whileTrue {
				(b(j) < b(k + i + 1)).ifTrue {
					k := j - i - 1
				};
				i := f[i + 1]
			};
			(
				(i = -1) & {
					b(j) ~= b(k + i + 1)
				}
			).if {
				(b(j) < b(k + i + 1)).ifTrue {
					k := j
				};
				f[j - k + 1] := -1
			} {
				f[j - k + 1] := i + 1
			}
		};
		k - 1 % n + 1
	}

	lexicographicallyLeastRotation { :self |
		self.rotatedLeft(self.lexicographicallyLeastRotationStartIndex - 1)
	}

	leastSquares { :m :b |
		let x = m.transposed;
		let y = [b];
		let cx = m;
		let cy = y.transposed;
		x.dot(cx).inverse.dot(x).dot(cy).transposed.first
	}

	linearIndex { :shape :aList |
		(aList - 1).mixedRadixDecode(shape) + 1
	}

	linearRecurrence { :kernel :init :n |
		let answer = init.copy;
		let m = kernel.size;
		let d = init.size;
		let j:/2 = (kernel.isVector || init.isVector).if { * } { dot:/2 };
		d.toDo(n - 1) { :k |
			let z = 0;
			1.toDo(m) { :i |
				z := z + j(kernel[i], answer[k + 1 - i])
			};
			answer.add(z)
		};
		answer
	}

	longestCommonSubsequence { :a :b |
		let m = a.size + 1;
		let n = b.size + 1;
		let lengths = m.zeroMatrix(n);
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
						'@Sequenceable>>longestCommonSubsequence: error?'.error
					};
					answer.addFirst(a[m - 1]);
					m := m - 1;
					n := n - 1
				}
			}
		};
		answer
	}

	longestCommonSubstringList { :self :aList |
		let find = { :k |
			self.partition(k, 1).intersection(aList.partition(k, 1))
		};
		let n = self.size.min(aList.size);
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

	longestCommonSubstring { :self :aList |
		let common = self.longestCommonSubstringList(aList);
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

	lyndonWordsDo { :alphabet :n :aBlock:/1 |
		let nextWord = { :w |
			let k = (n // w.size) + 1;
			let x = ({ w } ! k).catenate.first(n);
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

	maximumSegmentSum { :self |
		let answer = -Infinity;
		let currentSum = 0;
		let i = 1;
		let j = 1;
		let a = 1;
		self.withIndexDo { :x :b |
			(currentSum < 0).ifTrue {
				currentSum := 0;
				a := b
			};
			currentSum := currentSum + x;
			(currentSum > answer).ifTrue {
				answer := currentSum;
				i := a;
				j := b
			}
		};
		[answer, i, j]
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

	mergeSortBy { :self :aSortBlock:/2 |
		self.mergeSortFromToBy(1, self.size, aSortBlock:/2)
	}

	mergeSort { :self |
		self.mergeSortBy(<=)
	}

	meshGrid { :x :y |
		let m = y.size;
		let n = x.size;
		[
			x.asList ! m,
			(y.asList ! n).transposed
		]
	}

	middle { :self :count |
		let i = self.size // 2 + 1;
		let j = count // 2;
		let k = i - j;
		self.copyFromTo(k, k + count - 1)
	}

	middle { :self |
		self[self.size // 2 + 1]
	}

	minimumDifferenceBy { :self :aBlock:/1 |
		let answer = Infinity;
		self.adjacentPairsDo { :p :q |
			answer := answer.min(aBlock(q) - aBlock(p))
		};
		answer
	}

	minimumDifference { :self |
		self.minimumDifferenceBy(identity:/1)
	}

	mirror { :self :m :n |
		self ++ self.copyFromTo(n + 1, self.size - m).reversed
	}

	mixedRadixDecode { :self :factors |
		let answer = 0;
		let base = 1;
		let k = factors.size.min(self.size);
		let prefix = self.size - factors.size;
		(prefix > 1).ifTrue {
			self.error('@Sequenceable>>mixedRadixDecode: sequence too long')
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

	movingAverage { :x :rOrW |
		let answer = [];
		let [r, w] = rOrW.isList.if { [rOrW.size, rOrW] } { [rOrW, 1 # rOrW] };
		let wSum = w.sum;
		1.toDo(x.size - r + 1) { :i |
			let n = 0;
			1.toDo(r) { :j |
				n := n + (x[i + j - 1] * w[j])
			};
			answer.add(n / wSum)
		};
		answer
	}

	movingMedian { :self :windowSize |
		median:/1.movingMap(self, windowSize)
	}

	norm { :self :p |
		(self.abs ^ p).sum ^ (1 / p)
	}

	norm { :self |
		(self.scalarProduct(self.conjugated)).sqrt
	}

	normalize { :self |
		let n = self.norm;
		n.isVeryCloseTo(0).if {
			self
		} {
			self / n
		}
	}

	nubCumulatively { :self :compareBlock:/2 |
		let seen = []; /* not Set() */
		self.collect { :each |
			each.select { :item |
				seen.includesBy(item, compareBlock:/2).if {
					false
				} {
					seen.add(item);
					true
				}
			}
		}
	}

	nubCumulatively { :self |
		self.nubCumulatively(=)
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

	outerProduct { :self :aList |
		self *.outer aList
	}

	padLeftAndRight { :self :anInteger :anObject |
		(self.size >= anInteger).if {
			self
		} {
			let i = anInteger - self.size;
			let j = i // 2;
			let k = i - j;
			(anObject # j) ++ self ++ (anObject # k)
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

	pairwiseSum { :self |
		let n = self.size;
		(n <= 128).if {
			self.sum
		} {
			let m = (n / 2).floor;
			self.sliceFromTo(1, m).pairwiseSum
			+
			self.sliceFromTo(m + 1, n).pairwiseSum
		}
	}

	partIndex { :self :operand |
		operand.atAllSymmetrical(self)
	}

	part { :self :indices |
		let k = indices.size;
		let i = indices[1];
		let a = i.partIndex(self);
		(k = 1).if {
			a
		} {
			let j = indices.allButFirst;
			i.isCollection.if {
				a.collect { :each |
					each.part(j)
				}
			} {
				a.part(j)
			}
		}
	}

	partitionCollect { :self :windowSize :stepSize :aBlock:/1 |
		let answer = [];
		self.partitionDo(windowSize, stepSize) { :each |
			answer.add(aBlock(each))
		};
		answer
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
		self.partitionCollect(windowSize, stepSize, copy:/1)
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

	pick { :self :aList :anObject |
		(self.depth > 2).if {
			self.withCollect(aList) { :i :j |
				i.pick(j, anObject)
			}
		} {
			let answer = [];
			self.withDo(aList) { :i :j |
				(j = anObject).ifTrue {
					answer.add(i)
				}
			};
			answer
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

	precedes { :self :aList |
		self.compare(aList) = -1
	}

	precedesOrEqualTo { :self :aList |
		self.compare(aList) ~= 1
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

	projection { :u :v |
		let w = v.conjugated;
		u.dot(w) / v.dot(w) * v
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

	quickSortBy { :self :sortBlock:/2 |
		self.quickSortFromToBy(1, self.size, sortBlock:/2)
	}

	quickSort { :self |
		self.quickSortBy(<=)
	}

	randomChoice { :self :r :shape |
		let k = self.size;
		{
			let i = r.nextRandomInteger(1, k);
			self[i]
		} ! shape
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
			index := self.indexOfStartingAtBy(oldObject, index + 1, =);
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
			self.error('@Sequenceable>> replaceFromToWith: size of replacement does not match')
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
			self.error('@Sequenceable>>replicateEachApplying: counts not of correct size')
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

	reversed { :self :level |
		(level <= 1).if {
			let answer = self.species.ofSize(self.size);
			let fromIndex = self.size + 1;
			self.indicesDo { :toIndex |
				answer[toIndex] := self[fromIndex - 1];
				fromIndex := fromIndex - 1
			};
			answer
		} {
			self.collect { :each |
				each.reversed(level - 1)
			}
		}
	}

	reversed { :self |
		self.reversed(1)
	}

	reverseDo { :self :aBlock:/1 |
		self.size.toByDo(1, -1) { :index |
			aBlock(self[index])
		}
	}

	reverseWithDo { :self :aList :aBlock:/2 |
		(self.size ~= aList.size).if {
			self.error('@Sequenceable>> reverseWithDo: unequal size')
		} {
			self.size.toByDo(1, -1) { :index |
				aBlock(self[index], aList[index])
			}
		}
	}

	riffle { :self :anObject |
		self.isEmpty.if {
			[]
		} {
			anObject.isSequenceable.if {
				let k = self.size;
				(anObject.size >= k).if {
					self.error('riffle: too many items to insert')
				} {
					let answer = [];
					1.toDo(k - 1) { :i |
						answer.add(self[i]);
						answer.add(anObject.atWrap(i))
					};
					answer.add(self.last);
					answer
				}
			} {
				self.intersperse(anObject)
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

	sattoloShuffle { :self :rng |
		let i = self.size;
		{
			i > 1
		}.whileTrue {
			let j = rng.nextRandomInteger(1, i - 1);
			self.swapWith(i, j);
			i := i - 1
		};
		self
	}

	sattoloShuffle { :self |
		self.sattoloShuffle(system)
	}

	scalarProduct { :self :aList |
		(self *.e aList).sum
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

	sequencePosition { :self :subsequence |
		let k = subsequence.size - 1;
		self.indicesOfSubstring(subsequence).collect { :each |
			[each, each + k]
		}
	}

	shiftRegisterSequence { :initialState :taps :count |
		let register = initialState.copy;
		let k = register.size;
		let step = {
			let bit = taps.collect { :i |
				register[k + 1 - i]
			}.reduce(+) % 2;
			register.removeLast;
			register.addFirst(bit);
			bit
		};
		let answer = [register.first];
		(count - 1).timesRepeat {
			answer.add(step())
		};
		answer
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
		self[1 + 1]
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

	shuffle { :self :rng |
		self.fisherYatesShuffle(rng)
	}

	shuffle { :self |
		self.fisherYatesShuffle
	}

	shuffled { :self :rng |
		self.copy.fisherYatesShuffle(rng)
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

	substringsInCommon { :self :aList :k |
		self.partition(k, 1).intersection(aList.partition(k, 1))
	}

	swapAllWith { :self :indices |
		indices.rank.caseOf([
			{ 2 } -> {
				indices.do { :each |
					let [i, j] = each;
					let x = self[i];
					self[i] := self[j];
					self[j] := x
				}
			},
			{ 3 } -> {
				indices.do { :each |
					let [i, j] = each;
					let x = self.atPath(i);
					self.atPathPut(i, self.atPath(j));
					self.atPathPut(j, x)
				}
			}
		])
	}

	swapPathWith { :self :i :j |
		let x = self.atPath(i);
		self.atPathPut(i, self.atPath(j));
		self.atPathPut(j, x)
	}

	swapWith { :self :i :j |
		let x = self[i];
		self[i] := self[j];
		self[j] := x
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

	takeList { :self :aList |
		let answer = [];
		let startIndex = 1;
		aList.do { :each |
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
		self[3]
	}

	third { :self :n |
		self.copyFromTo(n * 2 + 1, n * 3)
	}

	thirdLast { :self |
		self[self.size - 2]
	}

	transposed { :self :permutation |
		permutation.isPermutationList.if {
			let fromShape = self.shape;
			let toShape = fromShape @* permutation;
			let inverse = permutation.inversePermutation.list(permutation.size);
			toShape.fill { :toIndex |
				let fromIndex = toIndex @* inverse;
				self @> fromIndex
			}
		} {
			self.error('@Sequenceable>>transposed: not permutation')
		}
	}

	transposed { :self |
		1.toAsCollect(self.first.size, self.first.species) { :index |
			self.collect { :row |
				row[index]
			}
		}
	}

	tuplesCollect { :self :aBlock:/1 |
		let answer = [];
		self.tuplesDo { :each |
			answer.add(each.aBlock)
		};
		answer
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
		self.tuplesCollect(copy:/1)
	}

	tuples { :self :count |
		(self ! count).tuples
	}

	uniqueElements { :self |
		self.uniqueElements(=)
	}

	uniqueElements { :self :aBlock:/2 |
		self.withIndexCollect { :p :i |
			let seen = [];
			self.withIndexDo { :q :j |
				(i ~= j).ifTrue {
					q.do { :each |
						seen.includesBy(each, aBlock:/2).ifFalse {
							seen.add(each)
						}
					}
				}
			};
			p.difference(seen).nubBy(aBlock:/2)
		}
	}

	vectorAngle { :u :v |
		(u.isVector & { v.isVector }).if {
			(u.dot(v) / (u.norm * v.norm)).arcCos
		} {
			self.error('@Sequenceable>>vectorAngle: not vectors')
		}
	}

	isVeryCloseTo { :self :anObject |
		self.equalBy(anObject, isVeryCloseTo:/2)
	}

	which { :self |
		valueWithReturn { :return:/1 |
			self.do { :each |
				each.key.value.ifTrue {
					each.value.value.return
				}
			};
			nil
		}
	}

	withCollect { :self :aList :aBlock:/2 |
		self.withCollectWrapping(aList, aBlock:/2)
	}

	withCollectCrossed { :self :aList :aBlock:/2 |
		let answer = self.species.new(self.size * aList.size);
		let nextIndex = 1;
		self.do { :leftItem |
			aList.do { :rightItem |
				answer[nextIndex] := aBlock(leftItem, rightItem);
				nextIndex := nextIndex + 1
			}
		};
		answer
	}

	withCollectEqual { :self :aList :aBlock:/2 |
		self.isOfSameSizeCheck(aList);
		1.toAsCollect(self.size, self.species) { :index |
			aBlock(self[index], aList[index])
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
			anObject.isSequenceable
		}).if {
			self.withCollect(anObject, aBlock:/2)
		} {
			anObject.adaptToCollectionAndApply(self, aBlock:/2)
		}
	}

	withCollectOuter { :self :aList :aBlock:/2 |
		aBlock:/2.outer(self, aList)
	}

	withCollectTable { :self :aList :aBlock:/2 |
		self.collect { :each |
			aBlock(each, aList)
		}
	}

	withCollectTruncating { :self :aList :aBlock:/2 |
		(self.size < aList.size).if {
			self.withCollect(aList.take(self.size), aBlock:/2)
		} {
			self.take(aList.size).withCollect(aList, aBlock:/2)
		}
	}

	withCollectWrapping { :self :aList :aBlock:/2 |
		let maximumSize = self.size.max(aList.size);
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atWrap(index), aList.atWrap(index))
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

	withoutTrailingZeros { :self |
		let n = self.size;
		{
			n >= 2 & {
				self[n].isZero
			}
		}.whileTrue {
			n := n - 1
		};
		(n = self.size).if {
			self
		} {
			self.copyFromTo(1, n)
		}
	}

	withIndexReplace { :self :aBlock:/2 |
		self.indicesDo { :index |
			self[index] := aBlock(self[index], index)
		}
	}

	withWithCollect { :self :aList :anotherList :aBlock:/3 |
		let maximumSize = [self, aList, anotherList].collect(size:/1).max;
		1.toAsCollect(maximumSize, self.species) { :index |
			aBlock(self.atWrap(index), aList.atWrap(index), anotherList.atWrap(index))
		}
	}

	withWithDo { :self :aList :anotherList :aBlock:/3 |
		self.isOfSameSizeCheck(aList);
		self.isOfSameSizeCheck(anotherList);
		self.indicesDo { :index |
			aBlock(self[index], aList[index], anotherList[index])
		}
	}

	zeroCrossingCount { :self |
		self.zeroCrossingDetect.count(identity:/1)
	}

	zeroCrossingDetect { :self |
		let answer = List(self.size, false);
		let p = self[1].sign;
		2.toDo(self.size) { :i |
			let q = self[i].sign;
			q.isZero.ifFalse {
				(p + q).isZero.ifTrue {
					answer[i] := true
				};
				p := q
			}
		};
		answer
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

	binaryDetectIndex { :self :aBlock:/1 |
		valueWithReturn { :return:/1 |
			let low = 1;
			let high = self;
			{
				low <= high
			}.whileTrue {
				let mid = (low + high) // 2;
				aBlock(mid).if {
					high := mid - 1
				} {
					low := mid + 1
				}
			};
			low
		}
	}

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

	partIndex { :self :operand |
		operand.atSymmetrical(self)
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

/* NB. CopyableSequence */
+[List, String] {

	chunksOfFrom { :self :chunkSize :startingAt |
		let chunkCount = (self.size - startingAt + 1 / chunkSize).ceiling;
		0.to(chunkCount - 1).collect { :i |
			let startIndex = i * chunkSize + startingAt;
			let stopIndex = (startIndex + chunkSize - 1).min(self.size);
			self.copyFromTo(startIndex, stopIndex)
		}
	}

	chunksOf { :self :chunkSize |
		self.chunksOfFrom(chunkSize, 1)
	}

}

+@Object {

	isSequenceable { :self |
		false
	}

}
