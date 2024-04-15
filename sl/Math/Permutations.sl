Permutation : [Object] { | cycles |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	* { :self :aPermutation |
		let length = self.max.max(aPermutation.max);
		aPermutation.apply(
			self.apply([1 .. length])
		).ordering.asPermutation
	}

	^ { :self :anInteger |
		anInteger.isNegative.if {
			self.inverse ^ anInteger.negated
		} {
			(self # anInteger).product
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

	asPermutation { :self |
		self
	}

	fixedPoints { :self |
		self.fixedPoints(self.max)
	}

	fixedPoints { :self :anInteger |
		let support = self.support.asSet;
		let answer = [];
		1.toDo(anInteger) { :each |
			support.includes(each).ifFalse {
				answer.add(each)
			}
		};
		answer
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
			each.reversed
		}.cycles
	}

	inversionVector { :self :anInteger |
		let list = self.list;
		let answer = List(anInteger);
		1.toDo(anInteger) { :i |
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

	isDerangement { :self :anInteger |
		self.support.size = anInteger
	}

	isIdentity { :self |
		self.cycles.isEmpty
	}

	isInvolution { :self |
		self.cycles.allSatisfy { :each |
			each.size <= 2
		}
	}

	length { :self |
		self.support.size
	}

	list { :self |
		self.list(self.max)
	}

	list { :self :anInteger |
		self.cycles.permutationCyclesToPermutationList(anInteger)
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
		self.matrix(self.max)
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
			inf
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

	postCopy { :self |
		self.cycles := self.cycles.copy
	}

	replace { :self :aSequence |
		aSequence.collect { :each |
			self.image(each)
		}
	}

	signature { :self |
		-1 ^ self.inversions.size
	}

	storeString { :self |
		self.cycles.storeString ++ '.cycles'
	}

	support { :self |
		self.cycles.concatenation.sort
	}

}

+@Sequence {

	asPermutation { :self |
		self.isPermutationList.if {
			newPermutation().initializeSlots(
				self.permutationListToPermutationCycles(true)
			)
		} {
			self.cycles
		}
	}

	cycles { :self |
		self.isPermutationCycles.if {
			newPermutation().initializeSlots(
				self.isEmpty.if {
					[]
				} {
					self.permutationCyclesToCanonicalForm(true)
				}
			)
		} {
			self.error('@Sequence>>cycles: not permutation cycles')
		}
	}

	derangements { :self |
		let answer = [];
		self.permutationsDo { :each |
			self.withCollect(each, ~=).allSatisfy(identity:/1).ifTrue {
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

	inversionVector { :self |
		self.asPermutation.inversionVector(self.permutationDegree)
	}

	isInvolution { :self |
		self.asPermutation.isInvolution
	}

	isPermutationCycles { :self |
		self.isEmpty | {
			(self.depth = 3) & {
				let entries = self.concatenation;
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
			ascending.isArithmeticSeries & {
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

	lexicographicPermutations { :self |
		let answer = [];
		self.lexicographicPermutationsDo { :each |
			answer.add(each.copy)
		};
		answer
	}

	lexicographicPermutationsDo { :self :aBlock:/1 |
		let list = self.copy.sort;
		let next = nil;
		aBlock(list);
		{
			next := list.nextPermutationLexicographic;
			next.isNil
		}.whileFalse {
			aBlock(list)
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


	permutationCycles { :self |
		self.asPermutation.cycles
	}

	permutationCyclesToCanonicalForm { :self :deleteUnaryCycles |
		let list = self.permutationCyclesToPermutationList;
		list.permutationListToPermutationCycles(deleteUnaryCycles)
	}

	permutationCyclesToPermutationList { :self |
		self.permutationCyclesToPermutationList(self.permutationDegree)
	}

	permutationCyclesToPermutationList { :self :anInteger |
		(anInteger = 0).if {
			[]
		} {
			let answer = [1 .. anInteger];
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
			self.concatenation.max
		} {
			self.isPermutationList.if {
				self.max
			} {
				self.error('@Sequence>>permutationDegree: not a permutation')
			}
		}
	}

	permutationFixedPoints { :self |
		self.asPermutation.fixedPoints(self.permutationDegree)
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
		let visited = Set();
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
		self.asPermutation.matrix
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

	permutationPower { :self :anInteger |
		(anInteger = 0).if {
			[].cycles
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

	permutationReplace { :self :aPermutation |
		aPermutation.asPermutation.replace(self)
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
		}.collect(permutations:/1).concatenation
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

}

+@ArithmeticProgression {

	permutationsDo { :self :aBlock:/1 |
		self.asList.permutationsDo(aBlock:/1)
	}

}

+@Integer {

	randomPermutation { :self :count :randomNumberGenerator |
		{
			(1 .. self).randomSample(self, randomNumberGenerator).asPermutation
		} ! count
	}

	randomPermutation { :self :count |
		self.randomPermutation(system, count)
	}

	randomPermutation { :self |
		self.randomPermutation(1).first
	}

}
