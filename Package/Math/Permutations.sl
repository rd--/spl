Permutation : [Object, Storeable, Equatable] { | cycles degree |

	= { :self :anObject |
		anObject.isPermutation & {
			self.cycles = anObject.cycles
		}
	}

	~ { :self :anObject |
		self = anObject
	}

	* { :self :aPermutation |
		let length = self.degree.max(aPermutation.degree);
		aPermutation.apply(
			self.apply(length.iota)
		).ordering.asPermutation
	}

	^ { :self :anInteger |
		anInteger.isNegative.if {
			self.inverse ^ anInteger.negate
		} {
			List(anInteger, self).product
		}
	}

	apply { :self :aSequence |
		let length = aSequence.size;
		self.isIdentity.if {
			aSequence
		} {
			let answer = List(length);
			let indices = self.list(length);
			1.toDo(length) { :i |
				answer[indices[i]] := aSequence[i]
			};
			answer
		}
	}

	ascents { :self :aBlock:/2 |
		let p = self.list;
		let k = p.size;
		let answer = [];
		1.toDo(k - 1) { :i |
			aBlock(p[i], p[i + 1]).ifTrue {
				answer.add(i)
			}
		};
		answer
	}

	ascents { :self |
		self.ascents(<)
	}

	asPermutation { :self |
		self
	}

	decreasingRuns { :self |
		self.runs(>)
	}

	descents { :self |
		self.ascents(>)
	}

	dictionary { :self |
		1.to(self.degree).collect { :i |
			i -> self.image(i)
		}.asMap
	}

	fixedPoints { :self |
		let support = self.support.asIdentitySet;
		let answer = [];
		1.toDo(self.degree) { :each |
			support.includes(each).ifFalse {
				answer.add(each)
			}
		};
		answer
	}

	graph { :self |
		let l = self.list;
		let i = self.inversions;
		let e = i.collect { :each | l @* each };
		let v = self.degree.iota;
		Graph(v, e)
	}

	hasPattern { :self :pattern |
		valueWithReturn { :return:/1 |
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
		valueWithReturn { :return:/1 |
			self.cycles.do { :each |
				let i = each.indexOf(anInteger);
				(i > 0).ifTrue {
					each.atWrap(i + 1).return
				}
			};
			anInteger
		}
	}

	inverse { :self |
		self.cycles.collect { :each |
			each.reverse
		}.cycles
	}

	inversionVector { :self |
		let list = self.list;
		let n = list.size;
		let answer = List(n);
		1.toDo(n) { :i |
			let j = list.indexOf(i);
			let c = 0;
			1.toDo(j) { :k |
				(list[k] > i).ifTrue {
					c := c + 1
				}
			};
			answer[i] := c
		};
		answer
	}

	inversions { :self |
		let list = self.list;
		let answer = [];
		1.toDo(list.size) { :j |
			let e = list[j];
			1.toDo(j - 1) { :i |
				(list[i] > e).ifTrue {
					answer.add([i j])
				}
			}
		};
		answer
	}

	isDerangement { :self |
		self.support.size = self.degree
	}

	isIdentity { :self |
		self.cycles.isEmpty
	}

	isInvolution { :self |
		self.cycles.allSatisfy { :each |
			each.size <= 2
		}
	}

	leftActionProduct { :self :aPermutation |
		aPermutation * self
	}

	leftInversionCount { :self |
		let list = self.list;
		let n = list.size;
		let answer = List(n);
		1.toDo(n) { :i |
			let c = 0;
			1.toDo(i) { :k |
				(list[k] > list[i]).ifTrue {
					c := c + 1
				}
			};
			answer[i] := c
		};
		answer
	}

	length { :self |
		self.support.size
	}

	list { :self |
		self.list(self.degree)
	}

	list { :self :anInteger |
		self.cycles.permutationCyclesToPermutationList(anInteger)
	}

	majorIndex { :self |
		self.descents.sum
	}

	matrix { :self :anInteger |
		let list = self.list(anInteger);
		let answer = [];
		list.do { :each |
			let row = List(anInteger, 0);
			row[each] := 1;
			answer.add(row)
		};
		answer
	}

	matrix { :self |
		self.matrix(self.degree)
	}

	max { :self |
		self.isIdentity.if {
			0
		} {
			self.support.max
		}
	}

	min { :self |
		self.isIdentity.if {
			Infinity
		} {
			self.support.min
		}
	}

	order { :self |
		self.isIdentity.if {
			1
		} {
			self.cycles.collect(size:/1).lcm
		}
	}

	orderList { :self |
		let answer = [];
		let next = self;
		{
			next.isIdentity
		}.whileFalse {
			answer.add(next);
			next := next * self
		};
		answer
	}

	patternPositions { :self :pattern |
		let list = self.list;
		let k = list.size;
		let answer = [];
		1.to(k).powerSetDo { :each |
			let subsequence = list @* each;
			(subsequence.reducedPermutation = pattern).ifTrue {
				answer.add(each)
			}
		};
		answer
	}

	peaks { :self |
		let p = self.list;
		2.to(p.size - 1).select { :i |
			p[i - 1] < p[i] & {
				p[i] > p[i + 1]
			}
		}
	}

	postCopy { :self |
		self.cycles := self.cycles.deepCopy
	}

	rank { :self |
		let c = self.rightInversionCount;
		let r = self.degree.toBy(1, -1);
		c.mixedRadixDecode(r)
	}

	reducedWordsDo { :self :aBlock:/1 |
		let f = { :p |
			let isIdentity = true;
			1.toDo(p.size - 1) { :d |
				let e = d + 1;
				(p[d] > p[e]).ifTrue {
					isIdentity := false;
					p.swapWith(d, e);
					p.asPermutation.reducedWordsDo { :x |
						x.add(d);
						aBlock(x)
					};
					p.swapWith(d, e)
				}
			};
			isIdentity.ifTrue {
				aBlock([])
			}
		};
		f(self.list)
	}

	reducedWords { :self |
		let answer = [];
		self.reducedWordsDo { :each |
			answer.add(each)
		};
		answer
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
		let answer = List(n);
		1.toDo(n) { :i |
			let c = 0;
			(i + 1).toDo(n) { :k |
				(list[k] < list[i]).ifTrue {
					c := c + 1
				}
			};
			answer[i] := c
		};
		answer
	}

	runs { :self :aBlock:/2 |
		self.list.orderedSubstrings(aBlock:/2)
	}

	runs { :self |
		self.runs(<)
	}

	signature { :self |
		-1 ^ self.inversions.size
	}

	stackSort { :self |
		self.list.stackSort.asPermutation
	}

	storeString { :self |
		'Permutation(%)'.format([self.cycles.storeString])
	}

	support { :self |
		self.cycles.catenate.sort
	}

	twoLineNotation { :self |
		[
			self.degree.iota,
			self.list
		]
	}

}

+List {

	Permutation { :self |
		self.isPermutationCycles.if {
			self.uncheckedCyclesToPermutation
		} {
			self.isPermutationList.if {
				self.uncheckedPermutationListToPermutation
			} {
				self.error('List>>Permutation: not permutation')
			}
		}
	}

	uncheckedCyclesToPermutation { :self |
		newPermutation().initializeSlots(
			self.isEmpty.if {
				[]
			} {
				self.permutationCyclesToCanonicalForm(true)
			},
			self.permutationDegree
		)
	}

	uncheckedPermutationListToPermutation { :self |
		newPermutation().initializeSlots(
			self.permutationListToPermutationCycles(true),
			self.max
		)
	}

}

+List {

	asPermutation { :self |
		Permutation(self)
	}

	cycles { :self |
		self.isPermutationCycles.if {
			self.uncheckedCyclesToPermutation
		} {
			self.error('List>>cycles: not permutation cycles')
		}
	}

	derangements { :self |
		let answer = [];
		self.permutationsDo { :each |
			self.withCollect(each, !=).allSatisfy(identity:/1).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	findPermutation { :self |
		self.ordering.asPermutation
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
		self.asPermutation.inverse
	}

	inversionVector { :self |
		self.asPermutation.inversionVector
	}

	isInvolution { :self |
		self.asPermutation.isInvolution
	}

	isPermutationCycles { :self |
		self.isEmpty | {
			(self.depth = 3) & {
				let entries = self.catenate;
				entries.allSatisfy { :each |
					each.isInteger & {
						each.isPositive
					}
				} & {
					entries.isDuplicateFree(==)
				}
			}
		}
	}

	isPermutationList { :self |
		self.isEmpty.if {
			true
		} {
			let ascending = self.sorted;
			ascending.isArithmeticProgression & {
				ascending.first = 1 & {
					ascending.last = self.size
				}
			}
		}
	}

	isPermutationOf { :self :aSequence |
		(self.size = aSequence.size) & {
			self.sort = aSequence.sort
		}
	}

	leftInversionCount { :self |
		self.asPermutation.leftInversionCount
	}

	lexicographicPermutations { :self |
		let answer = [];
		self.lexicographicPermutationsDo { :each |
			answer.add(each.copy);
			true
		};
		answer
	}

	lexicographicPermutationsDo { :self :aBlock:/1 |
		let list = self.copy.sort;
		let next = nil;
		let continue = true;
		{
			continue
		}.whileTrue {
			continue := aBlock(list);
			continue.ifTrue {
				next := list.nextPermutationLexicographic;
				continue := next.isNotNil
			}
		}
	}

	minimumChangePermutations { :self |
		let answer = [];
		self.minimumChangePermutationsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	minimumChangePermutationsDo { :self :aBlock:/1 |
		let a = self.copy;
		let n = a.size;
		let c = List(n, 1);
		let i = 2;
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
					swap(1, i)
				} {
					swap(c[i], i)
				};
				aBlock(a);
				c[i] := c[i] + 1;
				i := 2
			} {
				c[i] := 1;
				i := i + 1
			}
		}
	}

	nextPermutationLexicographic { :self |
		let swap = { :i :j |
			let t = self[i];
			self[i] := self[j];
			self[j] := t
		};
		let n = self.size;
		let k = n;
		{
			k > 1 & {
				self[k - 1] >= self[k]
			}
		}.whileTrue {
			k := k - 1
		};
		k := k - 1;
		(k = 0).if {
			nil
		} {
			let l = n;
			{
				self[l] <= self[k]
			}.whileTrue {
				l := l - 1
			};
			swap(k, l);
			k := k + 1;
			l := n;
			{
				l > k
			}.whileTrue {
				swap(k, l);
				l := l - 1;
				k := k + 1
			};
			self
		}
	}

	nthLexicographicPermutation { :self :n |
		let index = 1;
		let answer = nil;
		self.lexicographicPermutationsDo { :each |
			(index = n).if {
				answer := each.copy;
				false
			} {
				index := index + 1;
				true
			}
		};
		answer
	}

	plainChanges { :self |
		let answer = [];
		self.plainChangesDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	plainChangesDo { :self :aBlock:/1 |
		let p = self.copy;
		let q = self.copy;
		let n = p.size;
		let d = List(n, -1);
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
				perm(i + 1);
				(i - 1).timesRepeat {
					move(i, d[i]);
					perm(i + 1)
				};
				d[i] := 0 - d[i]
			}
		};
		perm(1)
	}

	permutationCycles { :self |
		self.asPermutation.cycles
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
				0
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

	permutationHasPattern { :self :pattern |
		self.asPermutation.hasPattern(pattern)
	}

	permutationFixedPoints { :self |
		self.asPermutation.fixedPoints
	}

	permutationGraph { :self |
		self.asPermutation.graph
	}

	permutationInversions { :self |
		self.asPermutation.inversions
	}

	permutationListToPermutationCycle { :self :anInteger |
		let answer = [anInteger];
		let nextItem = self[anInteger];
		{
			nextItem = anInteger
		}.whileFalse {
			answer.add(nextItem);
			nextItem := self[nextItem]
		};
		answer
	}

	permutationListToPermutationCycles { :self :deleteUnaryCycles |
		let visited = IdentitySet();
		let answer = [];
		1.toDo(self.size) { :each |
			visited.includes(each).ifFalse {
				let cycle = self.permutationListToPermutationCycle(each);
				visited.addAll(cycle);
				answer.add(cycle)
			}
		};
		deleteUnaryCycles.if {
			answer.reject { :each |
				each.size = 1
			}
		} {
			answer
		}
	}

	permutationList { :self |
		self.isPermutationList.if {
			self
		} {
			self.permutationCyclesToPermutationList(self.permutationDegree)
		}
	}

	permutationList { :self :anInteger |
		self.asPermutation.list(anInteger)
	}

	permutationMatrix { :self |
		self.asPermutation.matrix(self.permutationDegree)
	}

	permutationMax { :self |
		self.asPermutation.max
	}

	permutationMin { :self |
		self.asPermutation.min
	}

	permutationOrder { :self |
		self.asPermutation.order
	}

	permutationPatternPositions { :self :pattern |
		self.asPermutation.patternPositions(pattern)
	}

	permutationPeaks { :self |
		self.asPermutation.peaks
	}

	permutationPower { :self :anInteger |
		(anInteger = 0).if {
			self.permutationDegree.iota.asPermutation
		} {
			self.asPermutation ^ anInteger
		}
	}

	permutationProduct { :self |
		let entries = self.collect(asPermutation:/1);
		entries.isEmpty.if {
			[].cycles
		} {
			(entries.size = 1).if {
				entries.first
			} {
				entries.reduce(*)
			}
		}
	}

	permutationRank { :self |
		self.asPermutation.rank
	}

	permutationReplace { :self :aPermutation |
		aPermutation.asPermutation.replace(self)
	}

	permutationRuns { :self |
		self.asPermutation.runs
	}

	permutationSupport { :self |
		self.asPermutation.support
	}

	permutations { :self |
		let answer = [];
		self.permutationsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	permutations { :self :size |
		self.subsets { :each |
			each.size = size
		}.collectCatenate(permutations:/1)
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
				anInteger.toDo(self.size) { :index |
					self.swapWith(anInteger, index);
					self.permutationsStartingAtDo(anInteger + 1, aBlock:/1);
					self.swapWith(anInteger, index)
				}
			}
		}
	}

	permutationSymbol { :self |
		self.isPermutationList.if {
			-1 ^ self.permutationInversions.size
		} {
			0
		}
	}

	permute { :self :anObject |
		anObject.asPermutation.apply(self)
	}

	reducedPermutation { :self |
		let sequence = self.sorted;
		self.collect { :each |
			sequence.indexOf(each)
		}
	}

	rightInversionCount { :self |
		self.asPermutation.rightInversionCount
	}

	rightInversionCountToPermutationList { :self |
		let list = self.size.iota;
		self.collect { :each |
			list.removeAt(each + 1)
		}
	}

	rightInversionCountToPermutation { :self |
		self.rightInversionCountToPermutationList.asPermutation
	}

	signature { :self |
		self.isPermutationList.if {
			self.asPermutation.signature
		} {
			0
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
				answer.add(stack.pop)
			};
			stack.push(x)
		};
		{
			stack.isEmpty
		}.whileFalse {
			answer.add(stack.pop)
		};
		answer
	}

}

+@ArithmeticProgression {

	permutationsDo { :self :aBlock:/1 |
		self.asList.permutationsDo(aBlock:/1)
	}

}

+@Integer {

	bitReversalPermutation { :k |
		let n = 2 ^ k;
		0.to(n - 1).collect { :i |
			i.integerDigits(2, k).reverse.fromDigits(2) + 1
		}
	}

	heapsAlgorithm { :self |
		self.iota.heapsAlgorithm
	}

	minimumChangePermutations { :self |
		self.iota.minimumChangePermutations
	}

	plainChanges { :self |
		(self < 1).if {
			self.error('@Integer>>plainChanges: n < 1')
		} {
			self.iota.plainChanges
		}
	}

	steinhausJohnsonTrotterDo { :self :aBlock:/1 |
		self.plainChangesDo(aBlock:/1)
	}

	steinhausJohnsonTrotter { :self |
		self.plainChanges
	}

	unrankPermutation { :rank :degree |
		rank.mixedRadixEncode(
			degree.toBy(1, -1)
		).rightInversionCountToPermutation
	}

}
