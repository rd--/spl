+@Collection {

	alphabet { :self |
		self.nub.sort
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
		self.asList.sortBy(sortBlock:/2)
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
		self.sortBy(canonicalPrecedes:/2)
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

	lexicographicSort { :self |
		self.sortBy(precedes:/2)
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
		self.sortBy(<|)
	}

	sortOn { :self :keyBlock:/1 |
		self.sortByOn(<|, keyBlock:/1)
	}

	sorted { :self :sortBlock:/2 |
		self.copy.sortBy(sortBlock:/2)
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

	lexicographicOrder { :self :operand |
		self.compare(operand).negate
	}

	canonicalOrder { :self :operand |
		self.canonicalCompare(operand).negate
	}

}
