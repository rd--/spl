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

	heapSortBy { :self :sortBlock:/2 |
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
		self.heapSortBy(<=|)
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
		mode.caseOf([
			'Fractional' -> { self.rankingFractional },
			'Ordinal' -> { self.rankingOrdinal }
		])
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
