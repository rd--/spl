Permutation : [Object] { | permutationCycles |

	= { :self :anObject |
		anObject.isPermutation & {
			self.permutationCycles = anObject.permutationCycles
		}
	}

	* { :self :aPermutation |
		let length = self.size.max(aPermutation.size);
		aPermutation.apply(
			self.apply([1 .. length])
		).ordering.asPermutation
	}

	^ { :self :anInteger |
		anInteger.isNegative.if {
			self.inversePermutation ^ anInteger.negated
		} {
			(self # anInteger).permutationProduct
		}
	}

	apply { :self :aSequence |
		let length = aSequence.size;
		self.isIdentity.if {
			aSequence
		} {
			let answer = List(length);
			let indices = self.permutationList(length);
			1.toDo(length) { :i |
				answer[indices[i]] := aSequence[i]
			};
			answer
		}
	}

	asPermutation { :self |
		self
	}

	image { :self :anInteger |
		valueWithReturn { :return:/1 |
			self.permutationCycles.do { :each |
				let i = each.indexOf(anInteger);
				(i > 0).ifTrue {
					each.atWrap(i + 1).return
				}
			};
			anInteger
		}
	}

	inversePermutation { :self |
		self.permutationCycles.collect { :each |
			each.reversed
		}.cycles
	}

	isIdentity { :self |
		self.permutationCycles.isEmpty
	}

	isInvolution { :self |
		self.permutationCycles.allSatisfy { :each |
			each.size <= 2
		}
	}

	permutationLength { :self |
		self.permutationSupport.size
	}

	permutationList { :self |
		self.permutationCycles.permutationList(self.size)
	}

	permutationList { :self :anInteger |
		self.permutationCycles.permutationList(anInteger)
	}

	permutationMatrix { :self :anInteger |
		self.permutationList(anInteger).permutationMatrix
	}

	permutationMatrix { :self |
		self.permutationMatrix(self.size)
	}

	permutationMax { :self |
		self.isIdentity.if {
			0
		} {
			self.permutationSupport.max
		}
	}

	permutationMin { :self |
		self.isIdentity.if {
			inf
		} {
			self.permutationSupport.min
		}
	}

	permutationOrder { :self |
		self.isIdentity.if {
			1
		} {
			self.permutationCycles.collect(size:/1).lcm
		}
	}

	permutationOrderList { :self |
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

	permutationSupport { :self |
		self.permutationCycles.concatenation.sort
	}

	replace { :self :aSequence |
		aSequence.collect { :each |
			self.image(each)
		}
	}

	size { :self |
		self.isIdentity.if {
			0
		} {
			self.permutationCycles.concatenation.max
		}
	}

	storeString { :self |
		self.permutationCycles.storeString ++ '.cycles'
	}

}

+@Sequence {

	arePermutations { :self :aSequence |
		(self.size = aSequence.size) & {
			self.sort = aSequence.sort
		}
	}

	asPermutation { :self |
		self.isPermutationCycles.if {
			self.cycles
		} {
			self.permutationCycles.cycles
		}
	}

	cycles { :self |
		self.isPermutationCycles.if {
			newPermutation().initializeSlots(
				self.isEmpty.if {
					[]
				} {
					self.permutationList.permutationCycles.reject { :each |
						each.size = 1
					}
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

	isPermutationCycles { :self |
		self.isEmpty | {
			(self.depth = 3) & {
				let entries = self.concatenation;
				entries.allSatisfy { :each |
					each.isNumber & {
						each.isPositiveInteger
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

	permutationCycle { :self :anInteger |
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

	permutationCycles { :self |
		let visited = Set();
		let answer = [];
		1.toDo(self.size) { :each |
			visited.includes(each).ifFalse {
				let cycle = self.permutationCycle(each);
				visited.addAll(cycle);
				answer.add(cycle)
			}
		};
		answer
	}

	permutationList { :self |
		self.permutationList(self.concatenation.max)
	}

	permutationList { :self :length |
		let answer = [1 .. length];
		self.do { :each |
			1.toDo(each.size) { :index |
				answer[each[index]] := each.atWrap(index + 1)
			}
		};
		answer
	}

	permutationMatrix { :self |
		let answer = [];
		self.do { :each |
			let row = List(self.size, 0);
			row[each] := 1;
			answer.add(row)
		};
		answer
	}

	permutationOrder { :self |
		self.asPermutation.permutationOrder
	}

	permutationPower { :self :anInteger |
		self.asPermutation ^ anInteger
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

	permute { :self :anObject |
		anObject.asPermutation.apply(self)
	}

}

+@ArithmeticProgression {

	permutationsDo { :self :aBlock:/1 |
		self.asList.permutationsDo(aBlock:/1)
	}

}
