+Function {

	compareOn { :f/1 |
		{ :a :b |
			compare(f(a), f(b))
		}
	}

	reverseCompareOn { :f/1 |
		{ :a :b |
			compare(f(b), f(a))
		}
	}

}

+@Collection {

	alphabet { :self |
		self.nub.sort
	}

	countingSort { :input :key/1 :k |
		let n = input.size;
		let count = List(k, 0);
		let output = List(n, nil);
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

	countingSort { :input :key/1 |
		let k = 1;
		input.do { :each |
			k := max(k, key(each))
		};
		countingSort(input, key/1, k)
	}

	countingSort { :input |
		countingSort(input, identity/1, input.max)
	}

	heapSort { :self :sortFunction/2 |
		let h = Heap(self, sortFunction/2);
		let l = [];
		let k = self.size;
		k.timesRepeat {
			l.add!(h.removeFirst!)
		};
		l
	}

	heapSort { :self |
		self.heapSort(precedes/2)
	}

	sort { :self |
		self.copyList.sort!
	}

	sort { :self :sortFunction/2 |
		self.copyList.sort!(
			sortFunction/2
		)
	}

	stemLeafPlot { :self |
		let negative = Dictionary();
		let positive = Dictionary();
		self.collect { :each |
			let d = each.integerDigits;
			let rhs = d.last;
			let lhsList = (d.size > 1L).if { d.allButLast } { [0L] };
			let lhs = each.copySign(lhsList.fromDigits(10L));
			let map = each.isNegative.if { negative } { positive };
			map.atIfPresentIfAbsent(lhs) { :entry |
				entry.add!(rhs)
			} {
				map.put!(lhs, [rhs])
			}
		};
		negative.associations.sort ++ positive.associations.sort
	}

}

+@Sequence {

	canonicalSort { :self |
		self.copy.canonicalSort!
	}

	canonicalSort! { :self |
		self.sortComparing!(
			canonicalCompare/2
		)
	}

	indicesSorted { :self |
		self.indices
	}

	isMonotonicallyIncreasing { :self |
		self.allTrue(isFinite/1) & {
			self.isSortedBy(isLessOrEqual/2)
		}
	}

	isSorted { :self |
		self.isSortedBetween(1, self.size)
	}

	[isSorted, isSortedBy] { :self :aFunction/2 |
		self.isSortedByBetween(aFunction/2, 1, self.size)
	}

	isSortedBetween { :self :startIndex :endIndex |
		self.isSortedByBetween(precedesOrEqual/2, startIndex, endIndex)
	}

	isSortedByBetween { :self :aFunction/2 :startIndex :endIndex |
		(endIndex <= startIndex).if {
			true
		} {
			let previousElement = self[startIndex];
			withReturn { :return/1 |
				(startIndex + 1).toDo(endIndex) { :index |
					let element = self[index];
					aFunction(previousElement, element).ifFalse {
						false.return
					};
					previousElement := element
				};
				true
			}
		}
	}

	isStrictlyIncreasing { :self |
		self.allTrue(isFinite/1) & {
			self.isSortedBy(isLess/2)
		}
	}

	lexicographicCompare { :self :operand |
		let n = self.size;
		let m = operand.size;
		withReturn { :return/1 |
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

	ordering { :self :aFunction/2 |
		self.sortWithIndices(aFunction/2).collect(value/1)
	}

	ordering { :self |
		self.ordering(precedes/2)
	}

	ranking { :self :mode |
		mode.caseOf(
			[
				'Fractional' -> { self.rankingFractional },
				'Ordinal' -> { self.rankingOrdinal }
			]
		)
	}

	rankingFractional { :self |
		let i = 1;
		let u = self.sortWithIndices;
		let v = [];
		u.split { :p :q |
			p.key = q.key
		}.do { :p |
			let j = p.size;
			let q = i.to(i + j - 1).mean;
			j.timesRepeat {
				v.add!(q)
			};
			i := i + j
		};
		v.atAll(u.collect(value/1).ordering)
	}

	rankingOrdinal { :self |
		self.ordering.ordering
	}

	reverseColexicographicCompare { :self :operand |
		self.colexicographicCompare(operand).negate
	}

	reverseLexicographicCompare { :self :operand |
		self.lexicographicCompare(operand).negate
	}

	reverseSort { :self |
		self.copy.reverseSort!
	}

	reverseSort! { :self |
		self.sortBy!(succeeds/2)
	}

	sort { :self :sortFunction/2 |
		self.copyList.sort!(sortFunction/2)
	}

	sort { :self |
		self.copyList.sort!
	}

	sort! { :self |
		self.sortComparing!(
			compare/2
		)
	}

	sortComparingEach! { :self :functionList |
		let n = functionList.size;
		self.sortComparing! { :a :b |
			let answer = 0;
			let index = 1;
			{ answer = 0 & { index <= n } }.whileTrue {
				let f/2 = functionList[index];
				let c = f(a, b);
				index := index + 1;
				answer := c
			};
			answer
		}
	}

	sortOn { :self :keyFunction/1 |
		self.copy.sortOn!(keyFunction/1)
	}

	sortOn! { :self :keyFunction/1 |
		self.sortByOn!(precedes/2, keyFunction/1)
	}

	sortWithIndices { :self :sortFunction/2 |
		self.ifEmpty {
			[]
		} {
			self.withIndexCollect { :each :index |
				each -> index
			}.sort! { :p :q |
				sortFunction(p.key, q.key)
			}
		}
	}

	sortWithIndices { :self |
		self.sortWithIndices(precedes/2)
	}

	takeSmallest { :self :anInteger |
		self.sort.first(anInteger)
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

	canonicalOrder { :self :operand |
		self.canonicalCompare(operand).negate
	}

	canonicalPrecedes { :self :operand |
		self.canonicalCompare(operand) = -1
	}

	colexicographicCompare { :self :operand |
		let n = self.size;
		let m = operand.size;
		withReturn { :return/1 |
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

}

+List {

	colexicographicSort { :self |
		self.copy.colexicographicSort!
	}

	colexicographicSort! { :self |
		self.sortComparing!(
			colexicographicCompare/2
		)
	}

	gradedColexicographicSort { :self |
		self
		.collect(reverseSort/1)
		.sortComparingEach!(
			[
				sum/1.compareOn,
				size/1.compareOn,
				colexicographicCompare/2
			]
		)
	}

	gradedLexicographicSort { :self |
		self
		.collect(reverseSort/1)
		.sortComparingEach!(
			[
				sum/1.compareOn,
				lexicographicCompare/2
			]
		)
	}

	gradedReflectedColexicographicSort! { :self |
		self
		.collect!(sort!/1)
		.sortComparingEach!(
			[
				sum/1.compareOn,
				size/1.compareOn,
				lexicographicCompare/2
			]
		)
	}

	gradedReflectedLexicographicSort! { :self |
		self
		.collect!(sort!/1)
		.sortComparingEach!(
			[
				sum/1.compareOn,
				colexicographicCompare/2
			]
		)
	}

	gradedReverseLexicographicSort { :self |
		self
		.collect!(reverseSort/1)
		.sortComparingEach!(
			[
				sum/1.compareOn,
				reverseLexicographicCompare/2
			]
		)
	}

	lexicographicSort { :self |
		self.copy.lexicographicSort!
	}

	lexicographicSort! { :self |
		self.sortComparing!(
			lexicographicCompare/2
		)
	}

	localeSort { :self |
		self.copy.localeSort!
	}

	localeSort! { :self |
		self.sortComparing!(
			localeCompare/2
		)
	}

	naturalSort { :self |
		self.copy.naturalSort!
	}

	naturalSort! { :self |
		self.sortComparing!(
			naturalCompare/2
		)
	}

	reflectedColexicographicSort { :self |
		self.colexicographicSort.collect(reverse/1)
	}

	reflectedLexicographicSort { :self |
		self.lexicographicSort.collect(reverse/1)
	}

	reverseColexicographicSort { :self |
		self.copy.reverseColexicographicSort!
	}

	reverseColexicographicSort! { :self |
		self.sortComparing!(
			reverseColexicographicCompare/2
		)
	}

	reverseLexicographicSort { :self |
		self.copy.reverseLexicographicSort!
	}

	reverseLexicographicSort! { :self |
		self.sortComparing!(
			reverseLexicographicCompare/2
		)
	}

	reverseReflectedColexicographicSort { :self |
		self.reverseColexicographicSort.collect(reverse/1)
	}

	reverseReflectedLexicographicSort { :self |
		self.reverseLexicographicSort.collect(reverse/1)
	}

}

+List {

	bubbleSort { :self |
		self.copy.bubbleSort!
	}

	bubbleSort! { :self :sortFunction/2 |
		self.bubbleSortWithMonitor(sortFunction/2, nil.constant)
	}

	bubbleSort! { :self |
		self.bubbleSort!(isLess/2)
	}

	bubbleSortMatrix { :self |
		self.sortTracingState(
			bubbleSortWithMonitor/2
		)
	}

	bubbleSortWithMonitor { :self :sortFunction/2 :monitorFunction/1 |
		let n = self.size - 1;
		let isSorted = false;
		{ isSorted }.whileFalse {
			let t = 1;
			1.toDo(n) { :j |
				sortFunction(self[j + 1], self[j]).ifTrue {
					self.swapWith!(j, j + 1);
					monitorFunction(self);
					t := j
				}
			};
			isSorted := t = 1;
			n := t
		};
		self
	}

	bubbleSortWithMonitor { :self :monitorFunction/1 |
		self.bubbleSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	insertionSort { :self |
		self.copy.insertionSort!
	}

	insertionSort! { :self :sortFunction/2 |
		self.insertionSortWithMonitor(sortFunction/2, nil.constant)
	}

	insertionSort! { :self |
		self.insertionSort!(isLess/2)
	}

	insertionSortMatrix { :self |
		self.sortTracingState(
			insertionSortWithMonitor/2
		)
	}

	insertionSortWithMonitor { :self :sortFunction/2 :monitorFunction/1 |
		let n = self.size;
		2.toDo(n) { :i |
			1.toDo(i) { :j |
				sortFunction(self[i], self[j]).ifTrue {
					let x = self.removeAt!(i);
					self.insertAt!(x, j);
					monitorFunction(self)
				}
			}
		};
		self
	}

	insertionSortWithMonitor { :self :monitorFunction/1 |
		self.insertionSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	shellSort { :self |
		self.copy.shellSort!
	}

	shellSort! { :self :t :sortFunction/2 |
		self.shellSortWithMonitor(t, sortFunction/2, nil.constant)
	}

	shellSort! { :self |
		self.shellSort!([5, 3, 1], isLess/2)
	}

	shellSortMatrix { :self :t |
		let m = [self.copy];
		self.shellSortWithMonitor(t, isLess/2) { :x |
			m.add!(x.copy)
		};
		m
	}

	shellSortMatrix { :self |
		self.shellSortMatrix([5, 3, 1])
	}

	shellSortWithMonitor { :self :t :sortFunction/2 :monitorFunction/1 |
		let n = self.size;
		t.do { :h |
			(h + 1).toDo(n) { :j |
				let i = j - h;
				let r = self[j];
				let continue = true;
				{ continue & { i > 0 } }.whileTrue {
					sortFunction(r, self[i]).if {
						self.swapWith!(i, i + h);
						i := i - h;
						monitorFunction(self)
					} {
						continue := false
					}
				};
				self[i + h] := r
			}
		};
		self
	}

	shellSortWithMonitor { :self :t :monitorFunction/1 |
		self.shellSortWithMonitor(t, isLess/2, monitorFunction/1)
	}

	shellSortWithMonitor { :self :monitorFunction/1 |
		self.shellSortWithMonitor([5, 3, 1], isLess/2, monitorFunction/1)
	}

}

+List {

	combSort { :self |
		self.copy.combSort!
	}

	combSort! { :self :sortFunction/2 |
		self.combSortWithMonitor(sortFunction/2, nil.constant)
	}

	combSort! { :self |
		self.combSort!(isLess/2)
	}

	combSortMatrix { :self |
		self.sortTracingState(
			combSortWithMonitor/2
		)
	}

	combSortWithMonitor { :self :sortFunction/2 :monitorFunction/1 |
		let n = self.size;
		let gap = n;
		let continue = true;
		{ continue }.whileTrue {
			let swaps = false;
			gap := (gap / 1.25).floor;
			1.toDo(n - gap) { :i |
				sortFunction(self[i + gap], self[i]).ifTrue {
					self.swapWith!(i, i + gap);
					monitorFunction(self);
					swaps := true
				}
			};
			(swaps.not & { gap <= 1 }).ifTrue {
				continue := false
			}
		};
		self
	}

	combSortWithMonitor { :self :monitorFunction/1 |
		self.combSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	selectionSort { :self |
		self.copy.selectionSort!
	}

	selectionSort! { :self |
		self.selectionSortWithMonitor(nil.constant)
	}

	selectionSortMatrix { :self |
		self.sortTracingState(
			selectionSortWithMonitor/2
		)
	}

	selectionSortWithMonitor { :self :monitorFunction/1 |
		let n = self.size;
		n.toByDo(1, -1) { :j |
			let m = self.indexOf(self.maxFromTo(1, j));
			(m != j).ifTrue {
				self.swapWith!(j, m);
				monitorFunction(self)
			}
		};
		self
	}

}

+List {

	cycleSort { :self |
		self.copy.cycleSort!
	}

	cycleSort! { :self |
		self.cycleSortWithMonitor(nil.constant)
	}

	cycleSortMatrix { :self |
		self.sortTracingState(
			cycleSortWithMonitor/2
		)
	}

	cycleSortWithMonitor { :self :monitorFunction/1 |
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
					monitorFunction(self);
					y := x;
					n := y;
					(n = i).ifTrue {
						self[n] := y;
						monitorFunction(self);
						continue := false
					}
				}
			}
		};
		self
	}

}

+List {

	bitonicMergeWithMonitor { :a :low :count :direction :sortFunction/2 :monitorFunction/1 |
		(count > 1L).ifTrue {
			let k = count // 2L;
			low.toDo(low + k - 1L) { :i |
				(
					direction = 1L & {
						sortFunction(a[i + k], a[i])
					} | {
						direction = 0L & {
							sortFunction(a[i], a[i + k])
						}
					}
				).ifTrue {
					a.swapWith!(i, i + k);
					monitorFunction(a)
				}
			};
			bitonicMergeWithMonitor(a, low, k, direction, sortFunction/2, monitorFunction/1);
			bitonicMergeWithMonitor(a, low + k, k, direction, sortFunction/2, monitorFunction/1)
		}
	}

	bitonicSort { :self :sortFunction/2 |
		self.copy.bitonicSort!(sortFunction/2)
	}

	bitonicSort { :self |
		self.copy.bitonicSort!
	}

	bitonicSort! { :self :sortFunction/2 |
		self.bitonicSortWithMonitor(sortFunction/2, nil.constant)
	}

	bitonicSort! { :self |
		self.bitonicSort!(isLess/2)
	}

	bitonicSortMatrix { :self |
		self.sortTracingState(
			bitonicSortWithMonitor/2
		)
	}

	bitonicSortWithMonitor { :a :low :count :direction :sortFunction/2 :monitorFunction/1 |
		(count > 1L).ifTrue {
			let k = count // 2L;
			bitonicSortWithMonitor(a, low, k, 1L, sortFunction/2, monitorFunction/1);
			bitonicSortWithMonitor(a, low + k, k, 0L, sortFunction/2, monitorFunction/1);
			bitonicMergeWithMonitor(a, low, count, direction, sortFunction/2, monitorFunction/1)
		}
	}

	bitonicSortWithMonitor { :a :sortFunction/2 :monitorFunction/1 |
		let n = a.size;
		n.isPowerOfTwo.if {
			bitonicSortWithMonitor(a, 1L, a.size, 1L, sortFunction/2, monitorFunction/1);
			a
		} {
			a.error('bitonicSort: size must be power of two')
		}
	}

	bitonicSortWithMonitor { :self :monitorFunction/1 |
		self.bitonicSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	radixSort { :self |
		self.copy.radixSort!
	}

	radixSort! { :self |
		self.radixSortWithMonitor(nil.constant)
	}

	radixSortMatrix { :self |
		self.sortTracingState(
			radixSortWithMonitor/2
		)
	}

	radixSortWithMonitor { :self :monitorFunction/1 |
		let shift = 1;
		{ self.isSorted }.whileFalse {
			let zeroes = [];
			let ones = [];
			let continue = true;
			let o = self.copy;
			{ continue & { o.size != 0 } }.whileTrue {
				let item = o.removeFirst!;
				(item.bitAnd(shift) = 0).if {
					zeroes.add!(item)
				} {
					ones.add!(item)
				};
				(zeroes ++ o ++ ones).withIndexDo { :each :index |
					self[index] := each
				};
				monitorFunction(self);
				continue := self.isSorted.not
			};
			continue.ifTrue {
				monitorFunction(self);
				shift := shift << 1
			}
		};
		self
	}

}

+List {

	oddEvenSort { :self |
		self.copy.oddEvenSort!
	}

	oddEvenSort! { :self :sortFunction/2 |
		self.oddEvenSortWithMonitor(sortFunction/2, nil.constant)
	}

	oddEvenSort! { :self |
		self.oddEvenSort!(isLess/2)
	}

	oddEvenSortMatrix { :self |
		self.sortTracingState(
			oddEvenSortWithMonitor/2
		)
	}

	oddEvenSortWithMonitor { :self :sortFunction/2 :monitorFunction/1 |
		let n = self.size;
		let isSorted = false;
		{ isSorted }.whileFalse {
			isSorted := true;
			1.toDo(2) { :j |
				j.toByDo(n - 1, 2) { :i |
					sortFunction(self[i + 1], self[i]).ifTrue {
						self.swapWith!(i, i + 1);
						monitorFunction(self);
						isSorted := false
					}
				}
			}
		};
		self
	}

	oddEvenSortWithMonitor { :self :monitorFunction/1 |
		self.oddEvenSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	gnomeSort { :self |
		self.copy.gnomeSort!
	}

	gnomeSort! { :self :sortFunction/2 |
		self.gnomeSortWithMonitor(sortFunction/2, nil.constant)
	}

	gnomeSort! { :self |
		self.gnomeSort!(isLess/2)
	}

	gnomeSortMatrix { :self |
		self.sortTracingState(
			gnomeSortWithMonitor/2
		)
	}

	gnomeSortWithMonitor { :self :sortFunction/2 :monitorFunction/1 |
		let n = self.size;
		let i = 1;
		{ i <= n }.whileTrue {
			(
				i = 1 | {
					sortFunction(self[i], self[i - 1]).not
				}
			).if {
				i := i + 1
			} {
				self.swapWith!(i, i - 1);
				monitorFunction(self);
				i := i - 1
			}
		};
		self
	}

	gnomeSortWithMonitor { :self :monitorFunction/1 |
		self.gnomeSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	shuffleSort { :self |
		self.copy.shuffleSort!
	}

	shuffleSort! { :self :sortFunction/2 |
		self.shuffleSortWithMonitor(sortFunction/2, nil.constant)
	}

	shuffleSort! { :self |
		self.shuffleSort!(isLess/2)
	}

	shuffleSortMatrix { :self |
		self.sortTracingState(
			shuffleSortWithMonitor/2
		)
	}

	shuffleSortWithMonitor { :self :sortFunction/2 :monitorFunction/1 |
		let begin = 1;
		let end = self.size - 1;
		let finished = false;
		{ finished }.whileFalse {
			finished := true;
			begin.toDo(end) { :i |
				sortFunction(self[i + 1], self[i]).ifTrue {
					self.swapWith!(i, i + 1);
					monitorFunction(self);
					finished := false
				}
			};
			finished.ifFalse {
				finished := true;
				end := end - 1;
				end.downToDo(begin) { :i |
					sortFunction(self[i + 1], self[i]).ifTrue {
						self.swapWith!(i, i + 1);
						monitorFunction(self);
						finished := false
					}
				}
			};
			begin := begin + 1
		};
		self
	}

	shuffleSortWithMonitor { :self :monitorFunction/1 |
		self.shuffleSortWithMonitor(isLess/2, monitorFunction/1)
	}

}

+List {

	sortTracingComparisons { :self :sort/2 |
		let a = [];
		let b = [];
		let c = self.sort { :p :q |
			a.add!(p);
			b.add!(q);
			p < q
		};
		[c, a, b]
	}

	sortTracingState { :self :sort/2 |
		let m = [self.copy];
		self.sort { :x |
			m.add!(x.copy)
		};
		m
	}

}

+List {

	farthestFirstTraversal { :self :k :distanceFunction/2 :reductionFunction/1 |
		let answer = [self[k]];
		let remaining = self.copy;
		remaining.removeAt!(k);
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
			answer.add!(remaining[index]);
			remaining.removeAt!(index)
		};
		answer
	}

	farthestFirstTraversal { :self |
		self.farthestFirstTraversal(1, euclideanDistance/2, min/1)
	}

}
