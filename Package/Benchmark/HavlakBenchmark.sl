/* Requires: Benchmark */

BasicBlockEdge : [Object] {

	| from to |

	initialize { :self :cfg :fromName :toName |
		self.from := cfg.createNode(fromName);
		self.to := cfg.createNode(toName);
		self.from.addOutEdge(self.to);
		self.to.addInEdge(self.from);
		cfg.addEdge(self);
		self
	}

}

BasicBlock : [Object] {

	| inEdges outEdges name |

	= { :self :other |
		self.name = other.name
	}

	addInEdge { :self :from |
		self.inEdges.addLast!(from)
	}

	addOutEdge { :self :to |
		self.outEdges.addLast!(to)
	}

	initialize { :self :name |
		self.inEdges := [];
		self.outEdges := [];
		self.name := name;
		self
	}

	isImmediate { :unused |
		true
	}

	numPred { :self |
		self.inEdges.size
	}

}

+SmallFloat {

	BasicBlock { :self |
		newBasicBlock().initialize(self)
	}

}

ControlFlowGraph : [Object] {

	| basicBlockMap startNode edgeList |

	addEdge { :self :edge |
		self.edgeList.addLast!(edge)
	}

	basicBlocks { :self |
		self.basicBlockMap
	}

	createNode { :self :name |
		let node = nil;
		self.basicBlockMap.includesIndex(name).if {
			node := self.basicBlockMap[name]
		} {
			node := BasicBlock(name);
			self.basicBlockMap.extendToSize!(name); /* grow array */
			self.basicBlockMap[name] := node
		};
		(self.numNodes == 1).ifTrue {
			self.startNode := node
		};
		node
	}

	initialize { :self |
		self.basicBlockMap := [];
		self.edgeList := [];
		self
	}

	numNodes { :self |
		self.basicBlockMap.size
	}

	startBasicBlock { :self |
		self.startNode
	}

}

+Void {

	ControlFlowGraph {
		newControlFlowGraph().initialize
	}

}

+ControlFlowGraph {

	BasicBlockEdge { :self :fromName :toName |
		newBasicBlockEdge().initialize(self, fromName, toName)
	}

}

HavlakLoopFinder : [Object] {

	| cfg lsg nonBackPreds backPreds number maxSize header type last nodes |

	doDFSCurrent { :self :currentNode :current |
		let lastId = nil;
		let outerBlocks = nil;
		self.nodes[current].initNodeDfs(currentNode, current);
		self.number[currentNode] := current;
		lastId := current;
		outerBlocks := currentNode.outEdges;
		1.toDo(outerBlocks.size) { :i |
			let target = outerBlocks[i];
			(self.number[target] = self.unvisited).ifTrue {
				lastId := self.doDFSCurrent(target, lastId + 1)
			}
		};
		self.last[current] := lastId;
		lastId
	}

	findLoops { :self |
		self.cfg.startBasicBlock.isNil.if {
			self
		} {
			withReturn { :return/1 |
				let size = self.cfg.numNodes;
				self.nonBackPreds.removeAll!;
				self.backPreds.removeAll!;
				self.number.removeAll!;
				(size > self.maxSize).ifTrue {
					self.header := List(size, nil);
					self.type := List(size, nil);
					self.last := List(size, nil);
					self.nodes := List(size, nil);
					self.maxSize := size
				};
				1.toDo(size) { :i |
					self.nonBackPreds.addLast!(IdentitySet());
					self.backPreds.addLast!([]);
					self.nodes[i] := UnionFindNode()
				};
				self.initAllNodes;
				self.identifyEdges(size);
				self.header[1] := 1;
				size.toByDo(1, -1) { :w |
					let nodePool = [];
					let nodeW = self.nodes[w].bb;
					nodeW.isNotNil.ifTrue {
						let workList = [];
						self.stepDNodePool(w, nodePool);
						nodePool.do { :niter |
							workList.addLast!(niter)
						};
						(nodePool.size != 0).ifTrue {
							self.type[w] := 'BBReducible'
						};
						{
							workList.isEmpty
						}.whileFalse {
							let x = workList.removeFirst!;
							let nonBackSize = self.nonBackPreds[x.dfsNumber].size;
							(nonBackSize > self.maxNonBackPreds).ifTrue {
								self.return
							};
							self.stepEProcessNonBackPredsNodePoolWorkListX(w, nodePool, workList, x)
						};
						(nodePool.size > 0 | {
							self.type[w] = 'BBSelf'
						}).ifTrue {
							let loop = self.lsg.createNewLoopReducible(nodeW, self.type[w] != 'BBIrreducible');
							self.setLoopAttributeNodePoolLoop(w, nodePool, loop)
						}
					}
				}
			}
		}
	}

	identifyEdges { :self :size |
		1.toDo(size) { :w |
			let nodeW = self.nodes[w].bb;
			self.header[w] := 1;
			self.type[w] := 'BBNonHeader';
			nodeW.isNil.if {
				self.type[w] := 'BBDead'
			} {
				self.processEdgesW(nodeW, w)
			}
		}
	}

	initAllNodes { :self |
		self.cfg.basicBlocks.do { :bb |
			self.number[bb] := self.unvisited
		};
		self.doDFSCurrent(self.cfg.startBasicBlock, 1)
	}

	initialize { :self :cfg :lsg |
		self.cfg := cfg;
		self.lsg := lsg;
		self.nonBackPreds := [];
		self.backPreds := [];
		self.number := Map();
		self.maxSize := 0;
		self
	}

	isAncestorV { :self :w :v |
		w <= v & {
			v <= self.last[w]
		}
	}

	maxNonBackPreds { :self |
		32 * 1024
	}

	processEdgesW { :self :nodeW :w |
		(nodeW.numPred > 0 ).ifTrue {
			nodeW.inEdges.do { :nodeV |
				let v = self.number[nodeV];
				(v != self.unvisited).ifTrue {
					self.isAncestorV(w, v).if {
						self.backPreds[w].addLast!(v)
					} {
						self.nonBackPreds[w].include!(v)
					}
				}
			}
		}
	}

	setLoopAttributeNodePoolLoop { :self :w :nodePool :loop |
		self.nodes[w].loop := loop;
		nodePool.do { :node |
			self.header[node.dfsNumber] := w;
			node.union(self.nodes[w]);
			node.loop.isNotNil.if {
				node.loop.setParent(loop)
			} {
				loop.addNode(node.bb)
			}
		}
	}

	stepDNodePool { :self :w :nodePool |
		self.backPreds[w].do { :v |
			(v != w).if {
				nodePool.addLast!(self.nodes[v].findSet)
			} {
				self.type[w] := 'BBSelf'
			}
		}
	}

	stepEProcessNonBackPredsNodePoolWorkListX { :self :w :nodePool :workList :x |
		self.nonBackPreds[x.dfsNumber].do { :iter |
			let y = self.nodes[iter];
			let ydash = y.findSet;
			self.isAncestorV(w, ydash. dfsNumber).not.if {
				self.type[w] := 'BBIrreducible';
				self.nonBackPreds[w].include!(ydash.dfsNumber)
			} {
				(ydash.dfsNumber != w).ifTrue {
					nodePool.anySatisfy { :each |
						each == ydash
					}.ifFalse {
						workList.addLast!(ydash);
						nodePool.addLast!(ydash)
					}
				}
			}
		}
	}

	unvisited { :self |
		2147483647
	}

}

+ControlFlowGraph {

	HavlakLoopFinder { :self :lsg |
		newHavlakLoopFinder().initialize(self, lsg)
	}

}

LoopStructureGraph : [Object] {

	| root loops loopCounter |

	calculateNestingLevel { :self |
		self.loops.do { :liter |
			liter.isRoot.ifFalse {
				liter.parent.ifNil {
					liter.setParent(self.root)
				}
			}
		};
		self.calculateNestingLevelRecDepth(self.root, 0)
	}

	calculateNestingLevelRecDepth { :self :loop :depth |
		loop.depthLevel := depth;
		loop.children.do { :liter |
			self.calculateNestingLevelRecDepth(liter, depth + 1);
			loop.setNestingLevel(loop.nestingLevel.max(1 + liter.nestingLevel))
		}
	}

	createNewLoopReducible { :self :bb :isReducible |
		let loop = SimpleLoop(bb, isReducible);
		loop.counter := self.loopCounter;
		self.loopCounter := self.loopCounter + 1;
		self.loops.addLast!(loop);
		loop
	}

	initialize { :self |
		self.root := SimpleLoop(nil, false);
		self.loops := [];
		self.loopCounter := 0;
		self.root.setNestingLevel(0);
		self.root.counter := self.loopCounter;
		self.loopCounter := self.loopCounter + 1;
		self.loops.addLast!(self.root);
		self
	}

	numLoops { :self |
		self.loops.size
	}

}

+Void {

	LoopStructureGraph {
		newLoopStructureGraph().initialize
	}

}

LoopTesterApp : [Object] {

	| cfg lsg |

	addDummyLoops { :self :numDummyLoops |
		numDummyLoops.timesRepeat {
			self.findLoops(self.lsg)
		}
	}

	buildBaseLoop { :self :from |
		let header = self.buildStraightN(from, 1);
		let diamond1 = self.buildDiamond(header);
		let d11 = self.buildStraightN(diamond1, 1);
		let diamond2 = self.buildDiamond(d11);
		let footer = self.buildStraightN(diamond2,1);
		self.buildConnectEnd(diamond2, d11);
		self.buildConnectEnd(diamond1, header);
		self.buildConnectEnd(footer, from);
		footer := self.buildStraightN(footer, 1);
		footer
	}

	buildConnectEnd { :self :start :end |
		BasicBlockEdge(self.cfg, start, end)
	}

	buildDiamond { :self :start |
		let bb0 = start;
		BasicBlockEdge(self.cfg, bb0, bb0 + 1);
		BasicBlockEdge(self.cfg, bb0, bb0 + 2);
		BasicBlockEdge(self.cfg, bb0 + 1, bb0 + 3);
		BasicBlockEdge(self.cfg, bb0 + 2, bb0 + 3);
		bb0 + 3
	}

	buildStraightN { :self :start :n |
		0.toDo(n - 1) { :i |
			self.buildConnectEnd(start + i, start + i + 1)
		};
		start + n
	}

	constructCFGPP { :self :parLoops :pparLoops :ppparLoops |
		let n = 3;
		parLoops.timesRepeat {
			self.cfg.createNode(n + 1);
			self.buildConnectEnd(2, n + 1);
			n := n + 1;
			pparLoops.timesRepeat {
				let top = n;
				let bottom = nil;
				n := self.buildStraightN(n, 1);
				ppparLoops.timesRepeat {
					n := self.buildBaseLoop(n)
				};
				bottom := self.buildStraightN(n, 1);
				self.buildConnectEnd(n, top);
				n := bottom
			};
			self.buildConnectEnd(n, 1)
		}
	}

	constructSimpleCFG { :self |
		self.cfg.createNode(1);
		self.buildBaseLoop(1);
		self.cfg.createNode(2);
		BasicBlockEdge(self.cfg, 1, 3)
	}

	findLoops { :self :loopStructure |
		let finder = HavlakLoopFinder(self.cfg, loopStructure);
		finder.findLoops
	}

	initialize { :self |
		self.cfg := ControlFlowGraph();
		self.lsg := LoopStructureGraph();
		self.cfg.createNode(1);
		self
	}

	mainLoopPPP { :self :numDummyLoops :findLoopIterations :parLoop :pparLoops :ppparLoops |
		self.constructSimpleCFG;
		self.addDummyLoops(numDummyLoops);
		self.constructCFGPP(parLoop, pparLoops, ppparLoops);
		self.findLoops(self.lsg);
		findLoopIterations.timesRepeat {
			self.findLoops(LoopStructureGraph())
		};
		self.lsg.calculateNestingLevel;
		[self.lsg.numLoops, self.cfg.numNodes]
	}

}

+Void {

	LoopTesterApp {
		newLoopTesterApp().initialize
	}

}

SimpleLoop : [Object] {

	| counter depthLevel parent isRoot nestingLevel header isReducible basicBlocks children |

	addChildLoop { :self :loop |
		self.children.uncheckedInclude!(loop)
	}

	addNode { :self :bb |
		self.basicBlocks.uncheckedInclude!(bb)
	}

	initialize { :self :aBB :aBool |
		self.counter := 0;
		self.depthLevel := 0;
		self.isRoot := false;
		self.nestingLevel := 0;
		self.header := aBB;
		self.isReducible := aBool;
		self.basicBlocks := IdentitySet();
		self.children := IdentitySet();
		aBB.ifNotNil {
			self.basicBlocks.uncheckedInclude!(aBB)
		};
		self
	}

	setNestingLevel { :self :level |
		self.nestingLevel := level;
		(level = 0).ifTrue {
			self.isRoot := true
		}
	}

	setParent { :self :value |
		self.parent := value;
		self.parent.addChildLoop(self)
	}

}

+[Nil, BasicBlock] {

	SimpleLoop { :self :isReducible |
		newSimpleLoop().initialize(self, isReducible)
	}

}

UnionFindNode : [Object] {

	| parent bb dfsNumber loop |

	findSet { :self |
		let nodeList = [];
		let node = self;
		{
			node !== node.parent
		}.whileTrue {
			(node.parent !== node.parent.parent).ifTrue {
				nodeList.addLast!(node)
			};
			node := node.parent
		};
		nodeList.do { :iter |
			iter.union(self.parent)
		};
		node
	}

	initNodeDfs { :self :bb :dfsNumber |
		self.parent := self;
		self.bb := bb;
		self.dfsNumber := dfsNumber
	}

	initialize { :self |
		self.dfsNumber := 0;
		self
	}

	union { :self :basicBlock |
		self.parent := basicBlock
	}

}

+Void {

	UnionFindNode {
		newUnionFindNode().initialize
	}

}

+Void {

	HavlakBenchmark {
		Benchmark(
			'Havlak',
			Map(
				[
					1 -> [1605, 5213],
					15 -> [1647, 5213],
					150 -> [2052, 5213],
					1500 -> [6102, 5213],
					15000 -> [46602, 5213]
				]
			)
		) { :iterations |
			LoopTesterApp().mainLoopPPP(iterations, 50, 10, 10, 5)
		}
	}

}
