+Block {

	compareOn { :f:/1 |
		{ :a :b |
			compare(f(a), f(b))
		}
	}

	reverseCompareOn { :f:/1 |
		{ :a :b |
			compare(f(b), f(a))
		}
	}

}

+@Collection {

	alphabet { :self |
		self.nub.sort
	}

	countingSort { :input :key:/1 :k |
		let n = input.size;
		let count = List(k, 0);
		let output = List(n);
		1.toDo(n) { :i |
			let j = key(input[i]);
			count[j] := count[j] + 1
		};
		2.toDo(k) { :i |
			count[i] := count[i] + count[i - 1]
		};
		n.downToDo(1) { :i |
			let j = key(input[i]);
			count[j] := count[j] - 1;
			output[count[j] + 1] := input[i]
		};
		output
	}

	countingSort { :input :key:/1 |
		let k = 1;
		input.do { :each |
			k := max(k, key(each))
		};
		countingSort(input, key:/1, k)
	}

	countingSort { :input |
		countingSort(input, identity:/1, input.max)
	}

	heapSort { :self :sortBlock:/2 |
		let h = Heap(sortBlock:/2);
		let l = [];
		let k = self.size;
		h.addAll(self);
		k.timesRepeat {
			l.add(h.removeFirst)
		};
		l
	}

	heapSort { :self |
		self.heapSort(<=|)
	}

	sorted { :self |
		self.asList.sort
	}

	sorted { :self :sortBlock:/2 |
		self.copyList.sortBy(sortBlock:/2)
	}

	stemLeafPlot { :self |
		let negative = Map();
		let positive = Map();
		self.collect { :each |
			let d = each.integerDigits;
			let rhs = d.last;
			let lhsList = (d.size > 1).if { d.allButLast } { [0] };
			let lhs = each.copySignTo(lhsList.fromDigits(10));
			let map = each.isNegative.if { negative } { positive };
			map.atIfPresentIfAbsent(lhs) { :entry |
				entry.add(rhs)
			} {
				map.atPut(lhs, [rhs])
			}
		};
		negative.associations.sort ++ positive.associations.sort
	}

}

+@Sequenceable {

	canonicalSort { :self |
		self.sortComparing(canonicalCompare:/2)
	}

	indicesSorted { :self |
		self.indices
	}

	isMonotonicallyIncreasing { :self |
		self.isFinite & {
			self.isSortedBy(<=)
		}
	}

	isSorted { :self |
		self.isSortedBetweenAnd(1, self.size)
	}

	isSortedBetweenAnd { :self :startIndex :endIndex |
		self.isSortedByBetweenAnd(<=|, startIndex, endIndex)
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

	lexicographicCompare { :self :operand |
		let n = self.size;
		let m = operand.size;
		valueWithReturn { :return:/1 |
			1.toDo(n.min(m)) { :i |
				let c = self[i].compare(operand[i]);
				(c != 0).ifTrue {
					c.return
				}
			};
			n.compare(m)
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

	ordering { :self :aBlock:/2|
		self.sortedWithIndices(aBlock:/2).collect(value:/1)
	}

	ordering { :self |
		self.ordering(<|)
	}

	rankingFractional { :self |
		let i = 1;
		let u = self.sortedWithIndices;
		let v = [];
		u.split { :p :q |
			p.key = q.key
		}.do { :p |
			let j = p.size;
			let q = i.to(i + j - 1).mean;
			j.timesRepeat {
				v.add(q)
			};
			i := i + j
		};
		v.atAll(u.collect(value:/1).ordering)
	}

	rankingOrdinal { :self |
		self.ordering.ordering
	}

	ranking { :self :mode |
		mode.caseOf(
			[
				'Fractional' -> { self.rankingFractional },
				'Ordinal' -> { self.rankingOrdinal }
			]
		)
	}

	reverseColexicographicCompare { :self :operand |
		self.colexicographicCompare(operand).negate
	}

	reverseLexicographicCompare { :self :operand |
		self.lexicographicCompare(operand).negate
	}

	reverseSort { :self |
		self.sortBy(|>)
	}

	sort { :self :sortBlock:/2 :keyBlock:/1 |
		keyBlock:/1.ifNil {
			self.sortBy(sortBlock:/2 ? { <| })
		} {
			self.sortByOn(sortBlock:/2 ? { <| }, keyBlock:/1)
		}
	}

	sort { :self :sortBlock:/2 |
		self.sortBy(sortBlock:/2 ? { <| })
	}

	sort { :self |
		self.sortComparing(compare:/2)
	}

	sortComparingEach { :self :blockList |
		let n = blockList.size;
		self.sortComparing { :a :b |
			let answer = 0;
			let index = 1;
			{ answer = 0 & { index <= n } }.whileTrue {
				let f:/2 = blockList[index];
				let c = f(a, b);
				index := index + 1;
				answer := c
			};
			answer
		}
	}

	sortOn { :self :keyBlock:/1 |
		self.sortByOn(<|, keyBlock:/1)
	}

	sorted { :self :sortBlock:/2 |
		self.copyList.sortBy(sortBlock:/2)
	}

	sorted { :self |
		self.copy.sort
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

	sortedWithIndices { :self |
		self.sortedWithIndices(<)
	}

	takeSmallest { :self :anInteger |
		self.sorted.first(anInteger)
	}

}

+[List, String] {

	canonicalCompare { :self :operand |
		let a = self.size;
		let b = operand.size;
		let c = a.compare(b);
		(c = 0).if {
			self.compare(operand)
		} {
			c
		}
	}

	canonicalPrecedes { :self :operand |
		self.canonicalCompare(operand) = -1
	}

	colexicographicCompare { :self :operand |
		let n = self.size;
		let m = operand.size;
		valueWithReturn { :return:/1 |
			0.toDo(n.min(m) - 1) { :i |
				let c = self[n - i].compare(operand[m - i]);
				(c != 0).ifTrue {
					c.return
				}
			};
			n.compare(m)
		}
	}

	lexicographicOrder { :self :operand |
		self.lexicographicCompare(operand).negate
	}

	canonicalOrder { :self :operand |
		self.canonicalCompare(operand).negate
	}

}

+List {

	colexicographicSort { :self |
		self.sortComparing(colexicographicCompare:/2)
	}

	gradedColexicographicSort { :self |
		self
		.collect(reverseSort:/1)
		.sortComparingEach(
			[
				sum:/1.compareOn,
				size:/1.compareOn,
				colexicographicCompare:/2
			]
		)
	}

	gradedLexicographicSort { :self |
		self
		.collect(reverseSort:/1)
		.sortComparingEach(
			[
				sum:/1.compareOn,
				lexicographicCompare:/2
			]
		)
	}

	gradedReflectedColexicographicSort { :self |
		self
		.collect(sort:/1)
		.sortComparingEach(
			[
				sum:/1.compareOn,
				size:/1.compareOn,
				lexicographicCompare:/2
			]
		)
	}

	gradedReflectedLexicographicSort { :self |
		self
		.collect(sort:/1)
		.sortComparingEach(
			[
				sum:/1.compareOn,
				colexicographicCompare:/2
			]
		)
	}

	gradedReverseLexicographicSort { :self |
		self
		.collect(reverseSort:/1)
		.sortComparingEach(
			[
				sum:/1.compareOn,
				reverseLexicographicCompare:/2
			]
		)
	}

	lexicographicSort { :self |
		self.sortComparing(lexicographicCompare:/2)
	}

	reflectedColexicographicSort { :self |
		self.colexicographicSort.collect(reverse:/1)
	}

	reflectedLexicographicSort { :self |
		self.lexicographicSort.collect(reverse:/1)
	}

	reverseColexicographicSort { :self |
		self.sortComparing(reverseColexicographicCompare:/2)
	}

	reverseLexicographicSort { :self |
		self.sortComparing(reverseLexicographicCompare:/2)
	}

	reverseReflectedColexicographicSort { :self |
		self.reverseColexicographicSort.collect(reverse:/1)
	}

	reverseReflectedLexicographicSort { :self |
		self.reverseLexicographicSort.collect(reverse:/1)
	}

}

+List {

	bubbleSortWithMonitor { :self :sortBlock:/2 :monitorBlock:/1 |
		let n = self.size - 1;
		let isSorted = false;
		{ isSorted }.whileFalse {
			let t = 1;
			1.toDo(n) { :j |
				sortBlock(self[j + 1], self[j]).ifTrue {
					self.swapWith(j, j + 1);
					monitorBlock(self);
					t := j
				}
			};
			isSorted := t = 1;
			n := t
		};
		self
	}

	bubbleSortWithMonitor { :self :monitorBlock:/1 |
		self.bubbleSortWithMonitor(<, monitorBlock:/1)
	}

	bubbleSort { :self :sortBlock:/2 |
		self.bubbleSortWithMonitor(sortBlock:/2, nil.constant)
	}

	bubbleSort { :self |
		self.bubbleSort(<)
	}

	bubbleSortMatrix { :self |
		self.sortTracingState(
			bubbleSortWithMonitor:/2
		)
	}

}

+List {

	insertionSortWithMonitor { :self :sortBlock:/2 :monitorBlock:/1 |
		let n = self.size;
		2.toDo(n) { :i |
			1.toDo(i) { :j |
				sortBlock(self[i], self[j]).ifTrue {
					let x = self.removeAt(i);
					self.insertAt(x, j);
					monitorBlock(self)
				}
			}
		};
		self
	}

	insertionSortWithMonitor { :self :monitorBlock:/1 |
		self.insertionSortWithMonitor(<, monitorBlock:/1)
	}

	insertionSort { :self :sortBlock:/2 |
		self.insertionSortWithMonitor(sortBlock:/2, nil.constant)
	}

	insertionSort { :self |
		self.insertionSort(<)
	}

	insertionSortMatrix { :self |
		self.sortTracingState(
			insertionSortWithMonitor:/2
		)
	}

}

+List {

	shellSortWithMonitor { :self :t :sortBlock:/2 :monitorBlock:/1 |
		let n = self.size;
		t.do { :h |
			(h + 1).toDo(n) { :j |
				let i = j - h;
				let r = self[j];
				let continue = true;
				{ continue & { i > 0 } }.whileTrue {
					sortBlock(r, self[i]).if {
						self.swapWith(i, i + h);
						i := i - h;
						monitorBlock(self)
					} {
						continue := false
					}
				};
				self[i + h] := r
			}
		};
		self
	}

	shellSortWithMonitor { :self :t :monitorBlock:/1 |
		self.shellSortWithMonitor(t, <, monitorBlock:/1)
	}

	shellSortWithMonitor { :self :monitorBlock:/1 |
		self.shellSortWithMonitor([5, 3, 1], <, monitorBlock:/1)
	}

	shellSort { :self :t :sortBlock:/2 |
		self.shellSortWithMonitor(t, sortBlock:/2, nil.constant)
	}

	shellSort { :self |
		self.shellSort([5, 3, 1], <)
	}

	shellSortMatrix { :self :t |
		let m = [self.copy];
		self.shellSortWithMonitor(t, <) { :x |
			m.add(x.copy)
		};
		m
	}

	shellSortMatrix { :self |
		self.shellSortMatrix([5, 3, 1])
	}

}

+List {

	combSortWithMonitor { :self :sortBlock:/2 :monitorBlock:/1 |
		let n = self.size;
		let gap = n;
		let continue = true;
		{ continue }.whileTrue {
			let swaps = false;
			gap := (gap / 1.25).floor;
			1.toDo(n - gap) { :i |
				sortBlock(self[i + gap], self[i]).ifTrue {
					self.swapWith(i, i + gap);
					monitorBlock(self);
					swaps := true
				}
			};
			(swaps.not & { gap <= 1 }).ifTrue {
				continue := false
			}
		};
		self
	}

	combSortWithMonitor { :self :monitorBlock:/1 |
		self.combSortWithMonitor(<, monitorBlock:/1)
	}

	combSort { :self :sortBlock:/2 |
		self.combSortWithMonitor(sortBlock:/2, nil.constant)
	}

	combSort { :self |
		self.combSort(<)
	}

	combSortMatrix { :self |
		self.sortTracingState(
			combSortWithMonitor:/2
		)
	}

}

+List {

	selectionSortWithMonitor { :self :monitorBlock:/1 |
		let n = self.size;
		n.toByDo(1, -1) { :j |
			let m = self.indexOf(self.maxFromTo(1, j));
			(m != j).ifTrue {
				self.swapWith(j, m);
				monitorBlock(self)
			}
		};
		self
	}

	selectionSort { :self |
		self.selectionSortWithMonitor(nil.constant)
	}

	selectionSortMatrix { :self |
		self.sortTracingState(
			selectionSortWithMonitor:/2
		)
	}

}

+List {

	cycleSortWithMonitor { :self :monitorBlock:/1 |
		self.isPermutationList.ifFalse {
			self.error('cycleSort: not permutation list')
		};
		1.toDo(self.size) { :i |
			(i != self[i]).ifTrue {
				let n = i;
				let continue = true;
				let y = nil;
				{ continue }.whileTrue {
					let x = self[n];
					self[n] := (n != i).if { y } { nil } ;
					monitorBlock(self);
					y := x;
					n := y;
					(n = i).ifTrue {
						self[n] := y;
						monitorBlock(self);
						continue := false
					}
				}
			}
		};
		self
	}

	cycleSort { :self |
		self.cycleSortWithMonitor(nil.constant)
	}

	cycleSortMatrix { :self |
		self.sortTracingState(
			cycleSortWithMonitor:/2
		)
	}

}

+List {

	bitonicMergeWithMonitor { :a :low :count :direction :sortBlock:/2 :monitorBlock:/1 |
		(count > 1).ifTrue {
			let k = count / 2;
			low.toDo(low + k - 1) { :i |
				(
					direction = 1 & { sortBlock(a[i + k], a[i]) } | {
						direction = 0 & { sortBlock(a[i], a[i + k]) }
					}
				).ifTrue {
					a.swapWith(i, i + k);
					monitorBlock(a)
				}
			};
			bitonicMergeWithMonitor(a, low, k, direction, sortBlock:/2, monitorBlock:/1);
			bitonicMergeWithMonitor(a, low + k, k, direction, sortBlock:/2, monitorBlock:/1)
		}
	}

	bitonicSortWithMonitor { :a :low :count :direction :sortBlock:/2 :monitorBlock:/1 |
		(count > 1).ifTrue {
			let k = count / 2;
			bitonicSortWithMonitor(a, low, k, 1, sortBlock:/2, monitorBlock:/1);
			bitonicSortWithMonitor(a, low + k, k, 0, sortBlock:/2, monitorBlock:/1);
			bitonicMergeWithMonitor(a, low, count, direction, sortBlock:/2, monitorBlock:/1)
		}
	}

	bitonicSortWithMonitor { :a :sortBlock:/2 :monitorBlock:/1 |
		let n = a.size;
		n.isPowerOfTwo.if {
			bitonicSortWithMonitor(a, 1, a.size, 1, sortBlock:/2, monitorBlock:/1);
			a
		} {
			a.error('bitonicSort: size must be power of two')
		}
	}

	bitonicSortWithMonitor { :self :monitorBlock:/1 |
		self.bitonicSortWithMonitor(<, monitorBlock:/1)
	}

	bitonicSort { :self :sortBlock:/2 |
		self.bitonicSortWithMonitor(sortBlock:/2, nil.constant)
	}

	bitonicSort { :self |
		self.bitonicSort(<)
	}

	bitonicSortMatrix { :self |
		self.sortTracingState(
			bitonicSortWithMonitor:/2
		)
	}

}

+List {

	radixSortWithMonitor { :self :monitorBlock:/1 |
		let shift = 1;
		{ self.isSorted }.whileFalse {
			let zeroes = [];
			let ones = [];
			let continue = true;
			let o = self.copy;
			{ continue & { o.size != 0 } }.whileTrue {
				let item = o.removeFirst;
				(item.bitAnd(shift) = 0).if {
					zeroes.add(item)
				} {
					ones.add(item)
				};
				(zeroes ++ o ++ ones).withIndexDo { :each :index |
					self[index] := each
				};
				monitorBlock(self);
				continue := self.isSorted.not
			};
			continue.ifTrue {
				monitorBlock(self);
				shift := shift << 1
			}
		};
		self
	}

	radixSort { :self |
		self.radixSortWithMonitor(nil.constant)
	}

	radixSortMatrix { :self |
		self.sortTracingState(
			radixSortWithMonitor:/2
		)
	}

}

+List {

	oddEvenSortWithMonitor { :self :sortBlock:/2 :monitorBlock:/1 |
		let n = self.size;
		let sorted = false;
		{ sorted }.whileFalse {
			sorted := true;
			1.toDo(2) { :j |
				j.toByDo(n - 1, 2) { :i |
					sortBlock(self[i + 1], self[i]).ifTrue {
						self.swapWith(i, i + 1);
						monitorBlock(self);
						sorted := false
					}
				}
			}
		};
		self
	}

	oddEvenSortWithMonitor { :self :monitorBlock:/1 |
		self.oddEvenSortWithMonitor(<, monitorBlock:/1)
	}

	oddEvenSort { :self :sortBlock:/2 |
		self.oddEvenSortWithMonitor(sortBlock:/2, nil.constant)
	}

	oddEvenSort { :self |
		self.oddEvenSort(<)
	}

	oddEvenSortMatrix { :self |
		self.sortTracingState(
			oddEvenSortWithMonitor:/2
		)
	}

}

+List {

	gnomeSortWithMonitor { :self :sortBlock:/2 :monitorBlock:/1 |
		let n = self.size;
		let i = 1;
		{ i <= n }.whileTrue {
			(
				i = 1 | {
					sortBlock(self[i], self[i - 1]).not
				}
			).if {
				i := i + 1
			} {
				self.swapWith(i, i - 1);
				monitorBlock(self);
				i := i - 1
			}
		};
		self
	}

	gnomeSortWithMonitor { :self :monitorBlock:/1 |
		self.gnomeSortWithMonitor(<, monitorBlock:/1)
	}

	gnomeSort { :self :sortBlock:/2 |
		self.gnomeSortWithMonitor(sortBlock:/2, nil.constant)
	}

	gnomeSort { :self |
		self.gnomeSort(<)
	}

	gnomeSortMatrix { :self |
		self.sortTracingState(
			gnomeSortWithMonitor:/2
		)
	}

}

+List {

	shuffleSortWithMonitor { :self :sortBlock:/2 :monitorBlock:/1 |
		let begin = 1;
		let end = self.size - 1;
		let finished = false;
		{ finished }.whileFalse {
			finished := true;
			begin.toDo(end) { :i |
				sortBlock(self[i + 1], self[i]).ifTrue {
					self.swapWith(i, i + 1);
					monitorBlock(self);
					finished := false
				}
			};
			finished.ifFalse {
				finished := true;
				end := end - 1;
				end.downToDo(begin) { :i |
					sortBlock(self[i + 1], self[i]).ifTrue {
						self.swapWith(i, i + 1);
						monitorBlock(self);
						finished := false
					}
				}
			};
			begin := begin + 1
		};
		self
	}

	shuffleSortWithMonitor { :self :monitorBlock:/1 |
		self.shuffleSortWithMonitor(<, monitorBlock:/1)
	}

	shuffleSort { :self :sortBlock:/2 |
		self.shuffleSortWithMonitor(sortBlock:/2, nil.constant)
	}

	shuffleSort { :self |
		self.shuffleSort(<)
	}

	shuffleSortMatrix { :self |
		self.sortTracingState(
			shuffleSortWithMonitor:/2
		)
	}

}

+List {

	sortTracingComparisons { :self :sort:/2 |
		let a = [];
		let b = [];
		let c = self.sort { :p :q |
			a.add(p);
			b.add(q);
			p < q
		};
		[c, a, b]
	}

	sortTracingState { :self :sort:/2 |
		let m = [self.copy];
		self.sort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	farthestFirstTraversal { :self :k :distanceFunction:/2 :reductionFunction:/1 |
		let answer = [self[k]];
		let remaining = self.copy;
		remaining.removeAt(k);
		{ remaining.isEmpty }.whileFalse {
			let distances = remaining.collect { :p |
				reductionFunction(
					answer.collect { :q |
						distanceFunction(p, q)
					}
				)
			};
			let maxDistance = distances.max;
			let index = distances.indexOf(maxDistance);
			answer.add(remaining[index]);
			remaining.removeAt(index)
		};
		answer
	}

	farthestFirstTraversal { :self |
		self.farthestFirstTraversal(1, euclideanDistance:/2, min:/1)
	}

}
