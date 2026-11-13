Permutation : [Object, Store, Equal] {

	| cycles degree |

	Permutation { :self |
		self
	}

	applyPermutation { :self :aSequence |
		let length = aSequence.size;
		self.isIdentity.if {
			aSequence
		} {
			let answer = List(length, nil);
			let indices = self.list(length);
			1L.toDo(length) { :i |
				answer[indices[i]] := aSequence[i]
			};
			answer
		}
	}

	ascents { :self :aBlock/2 |
		let p = self.list;
		let k = p.size;
		let answer = [];
		1L.toDo(k - 1L) { :i |
			aBlock(p[i], p[i + 1L]).ifTrue {
				answer.add!(i)
			}
		};
		answer
	}

	ascents { :self |
		self.ascents(isLess/2)
	}

	completeCycles { :self |
		self
		.permutationList
		.permutationListToPermutationCycles(false)
	}

	decreasingRuns { :self |
		self.runs(isGreater/2)
	}

	descents { :self |
		self.ascents(isGreater/2)
	}

	dictionary { :self |
		Dictionary(
			1L.toCollect(self.degree) { :i |
				i -> self.image(i)
			}
		)
	}

	[fixedPoints, permutationFixedPoints] { :self |
		let support = Set(self.support, =);
		let answer = [];
		1L.toDo(self.degree) { :each |
			support.includes(each).ifFalse {
				answer.add!(each)
			}
		};
		answer
	}

	graph { :self |
		let l = self.list;
		let i = self.inversions;
		let e = i.collect { :each |
			l.atAll(each)
		};
		let v = self.degree.iota;
		Graph(v, e)
	}

	hasPattern { :self :pattern |
		withReturn { :return/1 |
			let list = self.list;
			list.subsequencesDo { :each |
				(each.reducedPermutation = pattern).ifTrue {
					true.return
				}
			};
			false
		}
	}

	image { :self :anInteger |
		withReturn { :return/1 |
			self.cycles.do { :each |
				let i = each.indexOf(anInteger);
				(i > 0L).ifTrue {
					each.atWrap(i + 1L).return
				}
			};
			Integer(anInteger)
		}
	}

	[inversePermutation, inverse] { :self |
		self.cycles.collect { :each |
			each.reverse
		}.cycles
	}

	inversionVector { :self |
		let list = self.list;
		let n = list.size;
		let answer = List(n, nil);
		1L.toDo(n) { :i |
			let j = list.indexOf(i);
			let c = 0L;
			1L.toDo(j) { :k |
				(list[k] > i).ifTrue {
					c := c + 1L
				}
			};
			answer[i] := c
		};
		answer
	}

	inversions { :self |
		let list = self.list;
		let answer = [];
		1L.toDo(list.size) { :j |
			let e = list[j];
			1L.toDo(j - 1L) { :i |
				(list[i] > e).ifTrue {
					answer.add!([i j])
				}
			}
		};
		answer
	}

	[isCyclic, isCyclicPermutation] { :self :anInteger |
		let c = self.cycles;
		(c.size = 1L) & {
			c[1L].size = anInteger
		}
	}

	isDerangement { :self |
		self.support.size = self.degree
	}

	[isEqual, =] { :self :anObject |
		anObject.isPermutation & {
			isEqualOn(self, anObject, cycles/1)
		}
	}

	isIdentity { :self |
		self.cycles.isEmpty
	}

	isInvolution { :self |
		self.cycles.allSatisfy { :each |
			each.size <= 2L
		}
	}

	[isRotation, isRotationPermutation] { :p |
		let i = p.permutationMax;
		let j = p.permutationLength;
		(i = j) & {
			p.list.isRotation([1L .. i])
		}
	}

	[isSimilar, ~] { :self :anObject |
		self = anObject
	}

	leftActionProduct { :self :aPermutation |
		aPermutation * self
	}

	leftInversionCount { :self |
		let list = self.list;
		let n = list.size;
		let answer = List(n, nil);
		1L.toDo(n) { :i |
			let c = 0L;
			1L.toDo(i) { :k |
				(list[k] > list[i]).ifTrue {
					c := c + 1L
				}
			};
			answer[i] := c
		};
		answer
	}

	[length, permutationLength] { :self |
		self.support.size
	}

	[list, permutationList] { :self |
		self.list(self.degree)
	}

	[list, permutationList] { :self :anInteger |
		self.cycles.permutationCyclesToPermutationList(anInteger)
	}

	majorIndex { :self |
		self.descents.sum
	}

	matrix { :self :anInteger |
		let list = self.list(anInteger);
		let answer = [];
		list.do { :each |
			let row = List(anInteger, 0L);
			row[each] := 1L;
			answer.add!(row)
		};
		answer
	}

	[matrix, permutationMatrix] { :self |
		self.matrix(self.degree)
	}

	[max, permutationMax] { :self |
		self.isIdentity.if {
			0L
		} {
			self.support.max
		}
	}

	[min, permutationMin] { :self |
		self.isIdentity.if {
			Infinity
		} {
			self.support.min
		}
	}

	[order, permutationOrder] { :self |
		self.isIdentity.if {
			1L
		} {
			self.cycles.collect(size/1).lcm
		}
	}

	[orderList, permutationOrderList] { :self |
		let next = self;
		let answer = [next];
		{
			next := next * self;
			answer.add!(next)
		}.doWhileFalse {
			next.isIdentity
		};
		answer
	}

	patternPositions { :self :pattern |
		let list = self.list;
		let k = list.size;
		let answer = [];
		1L.to(k).powerSetDo { :each |
			let subsequence = list.atAll(each);
			(subsequence.reducedPermutation = pattern).ifTrue {
				answer.add!(each)
			}
		};
		answer
	}

	peaks { :self |
		let p = self.list;
		2L.to(p.size - 1L).select { :i |
			p[i - 1L] < p[i] & {
				p[i] > p[i + 1L]
			}
		}
	}

	permutationCycles { :self |
		self.cycles
	}

	postCopy { :self |
		self.cycles := self.cycles.deepCopy
	}

	[power, ^] { :self :anInteger |
		anInteger.isNegative.if {
			self.inverse ^ anInteger.negate
		} {
			List(anInteger, self).product
		}
	}

	rank { :self |
		let c = self.rightInversionCount;
		let r = self.degree.toBy(1L, -1L);
		c.mixedRadixDecode(r)
	}

	reducedWords { :self |
		let answer = [];
		self.reducedWordsDo { :each |
			answer.add!(each)
		};
		answer
	}

	reducedWordsDo { :self :aBlock/1 |
		let f = { :p |
			let isIdentity = true;
			1L.toDo(p.size - 1L) { :d |
				let e = d + 1L;
				(p[d] > p[e]).ifTrue {
					isIdentity := false;
					p.swapWith!(d, e);
					p.Permutation.reducedWordsDo { :x |
						x.add!(d);
						aBlock(x)
					};
					p.swapWith!(d, e)
				}
			};
			isIdentity.ifTrue {
				aBlock([])
			}
		};
		f(self.list)
	}

	replace { :self :aSequence |
		aSequence.collect { :each |
			self.image(each)
		}
	}

	rightActionProduct { :self :aPermutation |
		self * aPermutation
	}

	rightInversionCount { :self |
		let list = self.list;
		let n = list.size;
		let answer = List(n, nil);
		1L.toDo(n) { :i |
			let c = 0L;
			(i + 1L).toDo(n) { :k |
				(list[k] < list[i]).ifTrue {
					c := c + 1L
				}
			};
			answer[i] := c
		};
		answer
	}

	runs { :self :aBlock/2 |
		self.list.orderedSubstrings(aBlock/2)
	}

	runs { :self |
		self.runs(isLess/2)
	}

	signature { :self |
		-1L ^ self.inversions.size
	}

	stackSort { :self |
		self.list.stackSort.Permutation
	}

	storeString { :self |
		'Permutation(%)'.format([self.cycles.storeString])
	}

	[support, permutationSupport] { :self |
		self.cycles.catenate.sort
	}

	[times, *] { :self :aPermutation |
		let length = self.degree.max(aPermutation.degree);
		aPermutation.applyPermutation(
			self.applyPermutation(length.iota)
		).ordering.Permutation
	}

	twoLineNotation { :self |
		[
			self.degree.iota,
			self.list
		]
	}

}

+List {

	[Permutation, listToPermutation] { :self |
		self.isPermutationCycles.if {
			self.cyclesToPermutation
		} {
			self.isPermutationList.if {
				self.permutationListToPermutation
			} {
				self.error('List>>Permutation: not permutation')
			}
		}
	}

	cyclesToPermutation { :self |
		let canonicalCycles = self.isEmpty.if {
			[]
		} {
			self.permutationCyclesToCanonicalForm(true)
		};
		uncheckedCyclesToPermutation(
			canonicalCycles,
			self.permutationDegree
		)
	}

	uncheckedCyclesToPermutation { :self :degree |
		newPermutation().initializeSlots(
			Integer(self),
			Integer(degree)
		)
	}

	permutationListToPermutation { :self |
		uncheckedCyclesToPermutation(
			self.permutationListToPermutationCycles(true),
			self.max
		)
	}

}

+List {

	cycles { :self |
		self.isPermutationCycles.if {
			self.cyclesToPermutation
		} {
			self.error('List>>cycles: not permutation cycles')
		}
	}

	derangements { :self |
		let answer = [];
		self.permutationsDo { :each |
			self.withCollect(each, !=).allSatisfy(identity/1).ifTrue {
				answer.add!(each.copy)
			}
		};
		answer
	}

	findPermutation { :self |
		Permutation(self.ordering)
	}

	findPermutation { :self :aSequence |
		let indices = aSequence.collect { :each |
			self.indexOf(each)
		};
		indices.findPermutation
	}

	heapsAlgorithm { :self |
		self.minimumChangePermutations
	}

	inversePermutation { :self |
		Permutation(self).inversePermutation
	}

	inversionVector { :self |
		Permutation(self).inversionVector
	}

	isCyclicPermutation { :self :anInteger |
		Permutation(self).isCyclicPermutation(anInteger)
	}

	isDerangement { :self |
		Permutation(self).isDerangement
	}

	isGracefulPermutation { :p |
		p.isPermutationList & {
			let k = p.size;
			let q = p.differences.abs.sort;
			q = [1L .. k - 1L]
		}
	}

	isInvolution { :self |
		Permutation(self).isInvolution
	}

	isPermutationCycles { :self |
		self.isEmpty | {
			(self.depth = 3L) & {
				let entries = self.catenate;
				entries.allSatisfy { :each |
					each.isIntegerValuedNumber & {
						each.isPositive
					}
				} & {
					entries.isDuplicateFree(=)
				}
			}
		}
	}

	isPermutationList { :self |
		self.isEmpty.if {
			true
		} {
			let ascending = self.sort;
			ascending.isArithmeticProgression & {
				ascending.first = 1L & {
					ascending.last = self.size
				}
			}
		}
	}

	isPermutationOf { :self :aSequence |
		(self.size = aSequence.size) & {
			self.copy.sort = aSequence.copy.sort
		}
	}

	isSuperpermutation { :p |
		p.alphabet.permutations.allSatisfy { :q |
			p.includesSubstring(q)
		}
	}

	leftInversionCount { :self |
		Permutation(self).leftInversionCount
	}

	lexicographicPermutations { :self |
		let answer = [];
		self.lexicographicPermutationsDo { :each |
			answer.add!(each.copy);
			true
		};
		answer
	}

	lexicographicPermutationsDo { :self :aBlock/1 |
		let list = self.copy.sort;
		let continue = true;
		{
			continue
		}.whileTrue {
			continue := aBlock(list);
			continue.ifTrue {
				let next = list.nextPermutationLexicographic!;
				continue := next.isNotNil
			}
		}
	}

	majorIndex { :self |
		Permutation(self).majorIndex
	}

	[minimumChangePermutations, heapsAlgorithm] { :self |
		let answer = [];
		self.minimumChangePermutationsDo { :each |
			answer.add!(each.copy)
		};
		answer
	}

	minimumChangePermutationsDo { :self :aBlock/1 |
		let a = self.copy;
		let n = a.size;
		let c = List(n, 1L);
		let i = 2L;
		let swap = { :i :j |
			let t = a[i];
			a[i] := a[j];
			a[j] := t
		};
		aBlock(a);
		{
			i <= n
		}.whileTrue {
			(c[i] < i).if {
				i.isOdd.if {
					swap(1L, i)
				} {
					swap(c[i], i)
				};
				aBlock(a);
				c[i] := c[i] + 1L;
				i := 2L
			} {
				c[i] := 1L;
				i := i + 1L
			}
		}
	}

	nextPermutationLexicographic! { :self |
		let swap = { :i :j |
			let t = self[i];
			self[i] := self[j];
			self[j] := t
		};
		let n = self.size;
		let k = n;
		{
			k > 1L & {
				self[k - 1L] >= self[k]
			}
		}.whileTrue {
			k := k - 1L
		};
		k := k - 1L;
		(k = 0L).if {
			nil
		} {
			let l = n;
			{
				self[l] <= self[k]
			}.whileTrue {
				l := l - 1L
			};
			swap(k, l);
			k := k + 1L;
			l := n;
			{
				l > k
			}.whileTrue {
				swap(k, l);
				l := l - 1L;
				k := k + 1L
			};
			self
		}
	}

	nthLexicographicPermutation { :self :n |
		let index = 1L;
		let answer = nil;
		self.lexicographicPermutationsDo { :each |
			(index = n).if {
				answer := each.copy;
				false
			} {
				index := index + 1L;
				true
			}
		};
		answer
	}

	partialInversePermutation { :self |
		let m = self.min;
		(m = 1L).if {
			let u = 1L.to(Infinity);
			let x = self.minimumExcludedValue(u) - 1L;
			1L.toCollect(x) { :i |
				self.indexOfIfAbsent(i) { nil }
			}
		} {
			self.error('partialInversePermutation')
		}
	}

	permutationCycles { :self |
		Permutation(self).cycles
	}

	permutationCycles { :self :deleteUnaryCycles |
		self.permutationListToPermutationCycles(deleteUnaryCycles)
	}

	permutationCyclesToCanonicalForm { :self :deleteUnaryCycles |
		self
		.permutationCyclesToPermutationList
		.permutationListToPermutationCycles(deleteUnaryCycles)
	}

	permutationCyclesToPermutationList { :self |
		self.permutationCyclesToPermutationList(
			self.permutationDegree
		)
	}

	permutationCyclesToPermutationList { :self :anInteger |
		(anInteger = 0).if {
			[]
		} {
			let answer = anInteger.iota;
			self.do { :each |
				1.toDo(each.size) { :index |
					answer[each[index]] := each.atWrap(index + 1)
				}
			};
			answer
		}
	}

	permutationDegree { :self |
		self.isPermutationCycles.if {
			self.isEmpty.if {
				0L
			} {
				self.catenate.max
			}
		} {
			self.isPermutationList.if {
				self.max
			} {
				self.error('List>>permutationDegree: not a permutation')
			}
		}
	}

	permutationFixedPoints { :self |
		Permutation(self).fixedPoints
	}

	permutationGraph { :self |
		Permutation(self).graph
	}

	permutationHasPattern { :self :pattern |
		Permutation(self).hasPattern(pattern)
	}

	permutationInversions { :self |
		Permutation(self).inversions
	}

	permutationLength { :self |
		Permutation(self).length
	}

	permutationList { :self |
		self.isPermutationList.if {
			self
		} {
			self.permutationCyclesToPermutationList(self.permutationDegree)
		}
	}

	permutationList { :self :anInteger |
		Permutation(self).list(anInteger)
	}

	permutationListToPermutationCycle { :self :anInteger |
		let answer = [anInteger];
		let nextItem = self[anInteger];
		{
			nextItem = anInteger
		}.whileFalse {
			answer.add!(nextItem);
			nextItem := self[nextItem]
		};
		answer
	}

	permutationListToPermutationCycles { :self :deleteUnaryCycles |
		let visited = Set([], =);
		let answer = [];
		1L.toDo(self.size) { :each |
			visited.includes(each).ifFalse {
				let cycle = self.permutationListToPermutationCycle(each);
				visited.addAll!(cycle);
				answer.add!(cycle)
			}
		};
		deleteUnaryCycles.if {
			answer.reject { :each |
				each.size = 1L
			}
		} {
			answer
		}
	}

	permutationMatrix { :self |
		Permutation(self).matrix(
			self.permutationDegree
		)
	}

	permutationMax { :self |
		Permutation(self).max
	}

	permutationMin { :self |
		Permutation(self).min
	}

	permutationOrder { :self |
		Permutation(self).order
	}

	permutationOrderList { :self |
		Permutation(self).orderList
	}

	permutationPatternPositions { :self :pattern |
		Permutation(self).patternPositions(pattern)
	}

	permutationPeaks { :self |
		Permutation(self).peaks
	}

	permutationPower { :self :anInteger |
		(anInteger = 0L).if {
			Permutation(self.permutationDegree.iota)
		} {
			Permutation(self) ^ anInteger
		}
	}

	permutationProduct { :self |
		let entries = self.collect(Permutation/1);
		entries.isEmpty.if {
			[].cycles
		} {
			(entries.size = 1L).if {
				entries.first
			} {
				entries.reduce(times/2)
			}
		}
	}

	permutationRank { :self |
		Permutation(self).rank
	}

	permutationReplace { :self :aPermutation |
		Permutation(aPermutation).replace(self)
	}

	permutationRuns { :self |
		Permutation(self).runs
	}

	permutationSupport { :self |
		Permutation(self).support
	}

	permutationSymbol { :self |
		self.isPermutationList.if {
			-1L ^ self.permutationInversions.size
		} {
			0L
		}
	}

	permutations { :self |
		let answer = [];
		self.permutationsDo { :each |
			answer.add!(each.copy)
		};
		answer
	}

	permutations { :self :size |
		self.subsets { :each |
			each.size = size
		}.collectCatenate(permutations/1)
	}

	permutationsDo { :self :aBlock/1 |
		self.copy.permutationsStartingAtDo(1L, aBlock/1)
	}

	permutationsStartingAtDo { :self :anInteger :aBlock/1 |
		(anInteger > self.size).ifFalse {
			(anInteger = self.size).if {
				aBlock(self)
			} {
				anInteger.toDo(self.size) { :index |
					self.swapWith!(anInteger, index);
					self.permutationsStartingAtDo(anInteger + 1L, aBlock/1);
					self.swapWith!(anInteger, index)
				}
			}
		};
		nil
	}

	permute { :self :anObject |
		anObject.Permutation.applyPermutation(self)
	}

	[plainChanges, steinhausJohnsonTrotter] { :self |
		let answer = [];
		self.plainChangesDo { :each |
			answer.add!(each.copy)
		};
		answer
	}

	[plainChangesDo, steinhausJohnsonTrotterDo] { :self :aBlock/1 |
		let p = self.copy;
		let q = self.copy;
		let n = p.size;
		let d = List(n, -1L);
		let move = { :x :y |
			let z = p[q[x] + y];
			p[q[x]] := z;
			p[q[x] + y] := x;
			q[z] := q[x];
			q[x] := q[x] + y
		};
		let perm = { :i |
			(i > n).if {
				aBlock(p)
			} {
				perm(i + 1L);
				(i - 1L).timesRepeat {
					move(i, d[i]);
					perm(i + 1L)
				};
				d[i] := 0L - d[i]
			}
		};
		perm(1L);
		nil
	}

	reducedPermutation { :self |
		let sequence = self.sort;
		self.collect { :each |
			sequence.indexOf(each)
		}
	}

	rightInversionCount { :self |
		Permutation(self).rightInversionCount
	}

	rightInversionCountToPermutation { :self |
		self
		.rightInversionCountToPermutationList
		.Permutation
	}

	rightInversionCountToPermutationList { :self |
		let list = self.size.iota;
		self.collect { :each |
			list.removeAt!(each + 1L)
		}
	}

	signature { :self |
		self.isPermutationList.if {
			Permutation(self).signature
		} {
			0L
		}
	}

	stackSort { :self |
		let stack = Stack();
		let answer = [];
		self.do { :x |
			{
				let n = stack.peek;
				n != nil & {
					x > n
				}
			}.whileTrue {
				answer.add!(stack.pop!)
			};
			stack.push!(x)
		};
		{
			stack.isEmpty
		}.whileFalse {
			answer.add!(stack.pop!)
		};
		answer
	}

}

+@ArithmeticProgression {

	permutationsDo { :self :aBlock/1 |
		self.List.permutationsDo(aBlock/1)
	}

}

+@Integer {

	bitReversalPermutation { :k |
		let n = 2L ^ k - 1L;
		0L.toCollect(n) { :i |
			i.bitReverse(k)
		} + 1
	}

	heapsAlgorithm { :self |
		self.iota.heapsAlgorithm
	}

	insertionPermutations { :self :method |
		let reorder/1 = method.caseOf(
			[
				'FrontToBack' -> { identity/1 },
				'BackToFront' -> { reverse/1 }
			]
		);
		let f/1 = { :n |
			(n = 1L).if {
				[[1L]]
			} {
				f(n - 1L).collect { :x |
					[1L .. n].reorder.collect { :i |
						let y = x.copy;
						y.insertAt!(n, i);
						y
					}
				}.catenate
			}
		}.memoize(true);
		1L.toCollect(self, f/1)
	}

	[minimumChangePermutations, heapsAlgorithm] { :self |
		self.iota.minimumChangePermutations
	}

	permutationUnrank { :rank :degree |
		rank.mixedRadixEncode(
			degree.toBy(1L, -1L)
		).rightInversionCountToPermutation
	}

	[plainChanges, steinhausJohnsonTrotter] { :self |
		(self < 1L).if {
			self.error('@Integer>>plainChanges: n < 1')
		} {
			self.iota.plainChanges
		}
	}

	reversalPermutation { :n :b |
		[0L .. b ^ n - 1].collect { :i |
			i.integerReverse(b, n) + 1
		}
	}

}

+List {

	multisetPermutations { :self |
		(self.size = 1L).if {
			[self]
		} {
			let answer = [];
			self.multisetPermutationsDoLink { :each |
				answer.add!(each.List)
			};
			answer
		}
	}

	multisetPermutationsDo { :self :visit/1 |
		self.multisetPermutationsDoLink { :each |
			visit(each.List)
		}
	}

	multisetPermutationsDoLink { :self :visit/1 |
		let n = self.size;
		let l = LinkedList(self.sort(succeeds/2));
		let h = l.firstLink;
		let i = l.linkAt(n - 1L);
		let j = l.lastLink;
		visit(h);
		{
			j.nextLink.isNotNil | {
				j.value < h.value
			}
		}.whileTrue {
			let s = (
				j.nextLink.isNotNil & {
					i.value >= j.nextLink.value
				}
			).if {
				j
			} {
				i
			};
			let t = s.nextLink;
			s.nextLink := t.nextLink;
			t.nextLink := h;
			(t.value < h.value).ifTrue {
				i := t
			};
			j := i.nextLink;
			h := t;
			visit(h)
		}
	}

}

+Float {

	mahonianNumber { :n :k |
		(
			n = 0L & {
				k = 0L
			}
		).if {
			1L
		} {
			(n = -1L).if {
				0L
			} {
				let m = n * (n - 1L) / 2L;
				(
					k >= 0L & {
						k <= m
					}
				).if {
					let a = mahonianNumber(n, k - 1L);
					let b = mahonianNumber(n - 1L, k);
					let c = mahonianNumber(n - 1L, k - n);
					a + b - c
				} {
					0L
				}
			}
		}
	}

}
