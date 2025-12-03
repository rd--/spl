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

	bubbleSort { :s :f:/1 |
		let n = s.size - 1;
		let isSorted = false;
		{ isSorted }.whileFalse {
			let t = 1;
			1.toDo(n) { :j |
				(s[j] > s[j + 1]).ifTrue {
					s.swapWith(j, j + 1);
					f(s);
					t := j
				}
			};
			isSorted := t = 1;
			n := t
		};
		s
	}

	bubbleSort { :s |
		s.bubbleSort(nil.constant)
	}

	bubbleSortMatrix { :s |
		let m = [s.copy];
		s.bubbleSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	insertionSort { :s :sortBlock:/2 :visitBlock:/1 |
		let n = s.size;
		2.toDo(n) { :i |
			1.toDo(i) { :j |
				sortBlock(s[i], s[j]).ifTrue {
					let x = s.removeAt(i);
					s.insertAt(x, j);
					visitBlock(s)
				}
			}
		};
		s
	}

	insertionSort { :s :sortBlock:/2 |
		s.insertionSort(sortBlock:/2, nil.constant)
	}

	insertionSort { :s |
		s.insertionSort(<, nil.constant)
	}

	insertionSortMatrix { :s |
		let m = [s.copy];
		s.insertionSort(<) { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	shellSort { :s :t :f:/1 |
		let n = s.size;
		t.do { :h |
			(h + 1).toDo(n) { :j |
				let i = j - h;
				let r = s[j];
				let continue = true;
				{ continue & { i > 0 } }.whileTrue {
					(r < s[i]).if {
						s.swapWith(i, i + h);
						i := i - h;
						f(s)
					} {
						continue := false
					}
				};
				s[i + h] := r
			}
		};
		s
	}

	shellSort { :s |
		s.shellSort([5, 3, 1], nil.constant)
	}

	shellSortMatrix { :s :t |
		let m = [s.copy];
		s.shellSort(t) { :x |
			m.add(x.copy)
		};
		m
	}

	shellSortMatrix { :s |
		s.shellSortMatrix([5, 3, 1])
	}

}

+List {

	combSort { :s :f:/1 |
		let n = s.size;
		let gap = n;
		let continue = true;
		{ continue }.whileTrue {
			let swaps = false;
			gap := (gap / 1.25).floor;
			1.toDo(n - gap) { :i |
				(s[i] > s[i + gap]).ifTrue {
					s.swapWith(i, i + gap);
					f(s);
					swaps := true
				}
			};
			(swaps.not & { gap <= 1 }).ifTrue {
				continue := false
			}
		};
		s
	}

	combSort { :s |
		s.combSort(nil.constant)
	}

	combSortMatrix { :s |
		let m = [s.copy];
		s.combSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	selectionSort { :s :f:/1 |
		let n = s.size;
		n.toByDo(1, -1) { :j |
			let m = s.indexOf(s.maxFromTo(1, j));
			(m != j).ifTrue {
				s.swapWith(j, m);
				f(s)
			}
		};
		s
	}

	selectionSort { :s |
		s.selectionSort(nil.constant)
	}

	selectionSortMatrix { :s |
		let m = [s.copy];
		s.selectionSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	cycleSort { :s :f:/1 |
		s.isPermutationList.ifFalse {
			s.error('cycleSort: not permutation list')
		};
		1.toDo(s.size) { :i |
			(i != s[i]).ifTrue {
				let n = i;
				let continue = true;
				let y = nil;
				{ continue }.whileTrue {
					let x = s[n];
					s[n] := (n != i).if { y } { nil } ;
					f(s);
					y := x;
					n := y;
					(n = i).ifTrue {
						s[n] := y;
						f(s);
						continue := false
					}
				}
			}
		};
		s
	}

	cycleSort { :s |
		s.cycleSort(nil.constant)
	}

	cycleSortMatrix { :s |
		let m = [s.copy];
		s.cycleSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	bitonicMerge { :a :low :count :direction :observe:/1 |
		(count > 1).ifTrue {
			let k = count / 2;
			low.toDo(low + k - 1) { :i |
				((direction = 1 & { a[i] > a[i + k] }) | { direction = 0 & { a[i] < a[i + k] } }).ifTrue {
					a.swapWith(i, i + k);
					observe(a)
				}
			};
			bitonicMerge(a, low, k, direction, observe:/1);
			bitonicMerge(a, low + k, k, direction, observe:/1)
		}
	}

	bitonicSort { :a :low :count :direction :observe:/1 |
		(count > 1).ifTrue {
			let k = count / 2;
			bitonicSort(a, low, k, 1, observe:/1);
			bitonicSort(a, low + k, k, 0, observe:/1);
			bitonicMerge(a, low, count, direction, observe:/1)
		}
	}

	bitonicSort { :a :f:/1 |
		let n = a.size;
		n.isPowerOfTwo.if {
			bitonicSort(a, 1, a.size, 1, f:/1);
			a
		} {
			a.error('bitonicSort: size must be power of two')
		}
	}

	bitonicSort { :a |
		a.bitonicSort(nil.constant)
	}

	bitonicSortMatrix { :a |
		let m = [a.copy];
		a.bitonicSort { :x |
			m.add(a.copy)
		};
		m
	}

}

+List {

	radixSort { :s :f:/1 |
		let shift = 1;
		{ s.isSorted }.whileFalse {
			let zeroes = [];
			let ones = [];
			let continue = true;
			let o = s.copy;
			{ continue & { o.size != 0 } }.whileTrue {
				let item = o.removeFirst;
				(item.bitAnd(shift) = 0).if {
					zeroes.add(item)
				} {
					ones.add(item)
				};
				(zeroes ++ o ++ ones).withIndexDo { :each :index |
					s[index] := each
				};
				f(s);
				continue := s.isSorted.not
			};
			continue.ifTrue {
				f(s);
				shift := shift << 1
			}
		};
		s
	}

	radixSort { :s |
		s.radixSort(nil.constant)
	}

	radixSortMatrix { :s |
		let m = [s.copy];
		s.radixSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	oddEvenSort { :s :f:/1 |
		let n = s.size;
		let sorted = false;
		{ sorted }.whileFalse {
			sorted := true;
			1.toDo(2) { :j |
				j.toByDo(n - 1, 2) { :i |
					(s[i] > s[i + 1]).ifTrue {
						s.swapWith(i, i + 1);
						f(s);
						sorted := false
					}
				}
			}
		};
		s
	}

	oddEvenSort { :s |
		s.oddEvenSort(nil.constant)
	}

	oddEvenSortMatrix { :s |
		let m = [s.copy];
		s.oddEvenSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	gnomeSort { :s :f:/1 |
		let n = s.size;
		let i = 1;
		{ i <= n }.whileTrue {
			(i = 1 | { s[i] >= s[i - 1] }).if {
				i := i + 1
			} {
				s.swapWith(i, i - 1);
				f(s);
				i := i - 1
			}
		};
		s
	}

	gnomeSort { :s |
		s.gnomeSort(nil.constant)
	}

	gnomeSortMatrix { :s |
		let m = [s.copy];
		s.gnomeSort { :x |
			m.add(x.copy)
		};
		m
	}

}

+List {

	shuffleSort { :s :f:/1 |
		let begin = 1;
		let end = s.size - 1;
		let finished = false;
		{ finished }.whileFalse {
			finished := true;
			begin.toDo(end) { :i |
				(s[i] > s[i + 1]).ifTrue {
					s.swapWith(i, i + 1);
					f(s);
					finished := false
				}
			};
			finished.ifFalse {
				finished := true;
				end := end - 1;
				end.downToDo(begin) { :i |
					(s[i] > s[i + 1]).ifTrue {
						s.swapWith(i, i + 1);
						f(s);
						finished := false
					}
				}
			};
			begin := begin + 1
		};
		s
	}

	shuffleSort { :s |
		s.shuffleSort(nil.constant)
	}

	shuffleSortMatrix { :s |
		let m = [s.copy];
		s.shuffleSort { :x |
			m.add(x.copy)
		};
		m
	}

}

