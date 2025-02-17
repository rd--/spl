Tree : [Object, Iterable, Indexable] { | value subTrees |

	= { :self :anObject |
		anObject.isTree & {
			self.value = anObject.value & {
				self.subTrees = anObject.subTrees
			}
		}
	}

	addChild { :self :child |
		child.isTree.if {
			self.subTrees.add(child)
		} {
			self.error('Tree>>addChild: not tree')
		}
	}

	asGraph { :self |
		let nodeId = 1;
		let vertexLabels = [];
		let labeledTree = self.collect { :each |
			let answer = nodeId -> each;
			nodeId := nodeId + 1;
			vertexLabels.add(each);
			answer
		};
		let edgeList = [];
		labeledTree.do { :i |
			i.subTrees.collect { :j |
				edgeList.add(
					DirectedEdge(
						i.value.key,
						j.value.key
					)
				)
			}
		};
		edgeList.asGraph.also { :graph |
			graph.vertexLabels := vertexLabels
		}
	}

	asList { :self |
		let subLists = self.subTrees.collect { :each |
			each.isLeaf.if {
				each.value
			} {
				each.asList
			}
		};
		self.value.ifNil {
			subLists
		} {
			[self.value] ++ subLists
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

	isBinary { :self |
		self.subTrees.isEmpty | {
			self.subTrees.size = 2 & {
				self.subTrees.allSatisfy(isBinary:/1)
			}
		}
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

	levelOrderDo { :self :aBlock:/1 |
		self.subTrees.do { :each |
			aBlock(each)
		};
		self.subTrees.do { :each |
			each.levelOrderDo(aBlock:/1)
		}
	}

	levelOrderValues { :self |
		let answer = [];
		0.to(self.depth - 1).collect { :each |
			answer.addAll(self.level(each).collect(value:/1))
		};
		answer
	}

	postOrderDo { :self :aBlock:/1 |
		self.subTrees.do { :each |
			each.postOrderDo(aBlock:/1)
		};
		aBlock(self)
	}

	postOrderValues { :self |
		let answer = [];
		self.postOrderDo { :each |
			answer.add(each.value)
		};
		answer
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

	storeString { :self |
		[
			'Tree(',
			self.value.storeString,
			', ',
			self.subTrees.storeString,
			')'
		].join('')
	}

	treePlot { :self |
		self.asGraph.graphPlot
	}

	values { :self |
		let answer = [];
		self.do { :each |
			answer.add(each.value)
		};
		answer
	}

}

+@Object {

	Tree { :value :subTrees |
		newTree().initializeSlots(value, subTrees)
	}

}

+@Sequence {

}

+List {

	expressionTree { :self :anObject |
		Tree(
			anObject,
			self.collect { :each |
				each.isList.if {
					each.expressionTree(anObject)
				} {
					Tree(each, [])
				}
			}
		)
	}

	expressionTree { :self |
		self[1].isList.ifTrue {
			self.error('List>>expressionTree: invalid initial item')
		};
		Tree(
			self[1],
			self.allButFirst.collect { :each |
				each.isList.if {
					each.expressionTree
				} {
					Tree(each, [])
				}
			}
		)
	}

}

+Association {

	rulesTree { :self |
		Tree(
			self.key,
			self.value.collect { :each |
				each.isAssociation.if {
					each.rulesTree
				} {
					Tree(each, [])
				}
			}
		)
	}

}

+@Integer {

	calkinWilfTree { :n :r |
		n.unfoldTree(r) { :each |
			let [a, b] = [each.numerator, each.denominator];
			[Fraction(a, a + b), Fraction(a + b, b)]
		}
	}

	calkinWilfTree { :n |
		n.calkinWilfTree(1/1)
	}

	completeKaryTree { :n :k |
		let f = { :n :k |
			(n <= 2).if {
				nil # k
			} {
				{ f(n - 1, k) } ! k
			}
		};
		f(n, k).expressionTree(nil)
	}

	karyTree { :n :k |
		let t = Tree(nil, []);
		let f = { :l :i |
			t.level(l).do { :each |
				(
					(i > 0) & {
						each.isLeaf
					}
				).ifTrue {
					let j = i.min(k);
					each.subTrees := { Tree(nil, []) } ! j;
					i := i - j
				}
			};
			(i > 0).ifTrue {
				f(l + 1, i)
			}
		};
		f(0, n - 1);
		t
	}

	keplerTree { :depth |
		depth.unfoldTree(1/1) { :each |
			(each = 1/1).if {
				[1/2]
			} {
				let n = each.numerator;
				let d = each.denominator;
				let z = n + d;
				[Fraction(n, z), Fraction(d, z)]
			}
		}
	}

	sternBrocotTree { :n :r |
		n.unfoldTree(r) { :each |
			let a = each.continuedFraction;
			let b = a.copy;
			a[a.size] := a[a.size] + 1;
			b[a.size] := b[a.size] - 1;
			b.add(2);
			[a.fromContinuedFraction, b.fromContinuedFraction].sort
		}
	}

	sternBrocotTree { :n |
		n.sternBrocotTree(1/1)
	}

	unfoldTree { :anInteger :anObject :aBlock:/1 |
		(anInteger <= 1).if {
			Tree(anObject, [])
		} {
			let children = aBlock(anObject);
			Tree(
				anObject,
				children.collect { :each |
					(anInteger - 1).unfoldTree(each, aBlock:/1)
				}
			)
		}
	}

}

+Block {

	nestTree { :aBlock:/1 :aTree :depth |
		(depth = 0).if {
			aTree
		} {
			aTree.isLeaf.if {
				Tree(
					aTree.value,
					aBlock(aTree.value).collect { :each |
						Tree(each, [])
					}
				)
			} {
				nestTree(
					aBlock:/1,
					Tree(
						aTree.value,
						aTree.subTrees.collect { :each |
							nestTree(aBlock:/1, each, 1)
						}
					),
					depth - 1
				)
			}
		}
	}

}

+@RandomNumberGenerator {

	randomTree { :r :n |
		let p = n.iota.fisherYatesShuffle(r);
		let t = Tree(p.removeFirst, []);
		let f = { :l :i |
			t.level(l).do { :each |
				(i > 0).ifTrue {
					let j = r.randomInteger(1, i, []);
					each.subTrees := p.removeFirst(j).collect { :m | Tree(m, []) };
					i := i - j
				}
			};
			(i > 0).ifTrue {
				f(l + 1, i)
			}
		};
		f(0, n - 1);
		t
	}

}
