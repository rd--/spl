Tree : [Object, Iterable, Indexable] { | value subTrees |

	= { :self :anObject |
		anObject.isTree & {
			self.value = anObject.value & {
				self.subTrees = anObject.subTrees
			}
		}
	}

	asList { :self |
		self.subTrees.collect { :each |
			each.isLeaf.if {
				each.value
			} {
				each.value.ifNil {
					each.asList
				} {
					'Tree>>asList: non nil entry at non-leaf Tree'.error
				}
			}
		}
	}

	at { :self :index |
		self.subTrees[index]
	}

	collect { :self :aBlock:/1 |
		Tree(
			aBlock(self.value),
			self.subTrees.collect { :each |
				each.collect(aBlock:/1)
			}
		)
	}

	deepWithIndicesDoStartingAt { :self :i :aBlock:/2 |
		self.subTrees.withIndexDo { :each :j |
			let index = i ++ [j];
			aBlock(each, index);
			each.deepWithIndicesDoStartingAt(index, aBlock:/2)
		}
	}

	deepWithIndicesDo { :self :aBlock:/2 |
		self.deepWithIndicesDoStartingAt([], aBlock:/2)
	}

	deepIndices { :self |
		let answer = [];
		self.deepWithIndicesDo { :unused :index |
			answer.add(index)
		};
		answer
	}

	depthStartingAt { :self :depth |
		(self.size = 0).if {
			depth
		} {
			self.subTrees.collect { :each |
				each.depthStartingAt(depth + 1)
			}.max
		}
	}

	depth { :self |
		self.depthStartingAt(1)
	}

	do { :self :aBlock:/1 |
		aBlock(self);
		self.subTrees.do { :each |
			each.do(aBlock:/1)
		}
	}

	flatten { :self |
		self.leaves
	}

	indices { :self |
		(1 .. self.size)
	}

	isLeaf { :self |
		self.subTrees.isEmpty
	}

	leafCount { :self |
		let answer = 0;
		self.leavesDo { :each |
			answer := answer + 1
		};
		answer
	}

	leafIndices { :self |
		let answer = [];
		self.deepWithIndicesDo { :each :index |
			each.isLeaf.ifTrue {
				answer.add(index)
			}
		};
		answer
	}

	leavesDo { :self :aBlock:/1 |
		self.do { :each |
			each.isLeaf.ifTrue {
				aBlock(each.value)
			}
		}
	}

	leaves { :self |
		let answer = [];
		self.leavesDo { :each |
			answer.add(each.value)
		};
		answer
	}

	level { :self :count |
		(count <= 0).if {
			[self]
		} {
			self.subTrees.collect { :each |
				each.level(count - 1)
			}.concatenation
		}
	}

	reverseDo { :self :aBlock:/1 |
		self.subTrees.reverseDo { :each |
			each.reverseDo(aBlock:/1)
		};
		aBlock(self)
	}

	size { :self |
		self.subTrees.size
	}

}

+@Object {

	Tree { :value :subTrees |
		newTree().initializeSlots(value, subTrees)
	}

}

+@Sequence {

	asTree { :self |
		let type = self.typeOf;
		Tree(
			nil,
			self.collect { :each |
				(each.typeOf = type).if {
					each.asTree
				} {
					Tree(each, [])
				}
			}
		)
	}

}
