(* Requires: Benchmark *)

BasicBlockEdge : [Object] { | from to |

	initialize { :self :cfg :fromName :toName |
		self.from := cfg.createNode(fromName);
		self.to := cfg.createNode(toName);
		self.from.addOutEdge(self.to);
		self.to.addInEdge(self.from);
		cfg.addEdge(self);
		self
	}

}

BasicBlock : [Object] { | inEdges outEdges name |

	= { :self :other |
		self.name = other.name
	}

	initialize { :self :name |
		self.inEdges := Array();
		self.outEdges := Array();
		self.name := name;
		self
	}

	numPred { :self |
		self.inEdges.size
	}

	addOutEdge { :self :to |
		self.outEdges.addLast(to)
	}

	addInEdge { :self :from |
		self.inEdges.addLast(from)
	}

}

+SmallFloat {

	BasicBlock { :self |
		newBasicBlock().initialize(self)
	}

}

ControlFlowGraph : [Object] { | basicBlockMap startNode edgeList |

	initialize { :self |
		self.basicBlockMap := Array();
		self.edgeList := Array();
		self
	}

	createNode { :self :name |
		| node |
		self.basicBlockMap.includesIndex(name).if {
			node := self.basicBlockMap[name]
		} {
			node := BasicBlock(name);
			self.basicBlockMap.ofSize(name); (* grow array *)
			self.basicBlockMap[name] := node
		};
		(self.numNodes == 1).ifTrue {
			self.startNode := node
		};
		node
	}

	addEdge { :self :edge |
		self.edgeList.addLast(edge)
	}

	numNodes { :self |
		self.basicBlockMap.size
	}

	startBasicBlock { :self |
		self.startNode
	}

	basicBlocks { :self |
		self.basicBlockMap
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

HavlakLoopFinder : [Object] { | cfg lsg nonBackPreds backPreds number maxSize header type last nodes |

	initialize { :self :cfg :lsg |
		self.cfg := cfg;
		self.lsg := lsg;
		self.nonBackPreds := Array();
		self.backPreds := Array();
		self.number := Map();
		self.maxSize := 0;
		self
	}

	unvisited { :self |
		2147483647
	}

	maxNonBackPreds { :self |
		32 * 1024
	}

	isAncestorV { :self :w :v |
		(w <= v) & {
			v <= self.last[w]
		}
	}

	doDFSCurrent { :self :currentNode :current |
		| lastId outerBlocks |
		self.nodes[current].initNodeDfs(currentNode, current);
		self.number[currentNode] := current;
		lastId := current;
		outerBlocks := currentNode.outEdges;
		1.toDo(outerBlocks.size) { :i |
			| target = outerBlocks[i]; |
			(self.number[target] = self.unvisited).ifTrue {
				lastId := self.doDFSCurrent(target, lastId + 1)
			}
		};
		self.last[current] := lastId;
		lastId
	}

	initAllNodes { :self |
		self.cfg.basicBlocks.do { :bb |
			self.number[bb] := self.unvisited
		};
		self.doDFSCurrent(self.cfg.startBasicBlock, 1)
	}

	identifyEdges { :self :size |
		1.toDo(size) { :w |
			| nodeW = self.nodes[w].bb; |
			self.header[w] := 1;
			self.type[w] := 'BBNonHeader';
			nodeW.isNil.if {
				self.type[w] := 'BBDead'
			} {
				self.processEdgesW(nodeW, w)
			}
		}
	}

	processEdgesW { :self :nodeW :w |
		(nodeW.numPred > 0 ).ifTrue {
			nodeW.inEdges.do { :nodeV |
				| v = self.number[nodeV]; |
				(v ~= self.unvisited).ifTrue {
					self.isAncestorV(w, v).if {
						self.backPreds[w].addLast(v)
					} {
						self.nonBackPreds[w].include(v)
					}
				}
			}
		}
	}

	findLoops { :self |
		self.cfg.startBasicBlock.isNil.if {
			self
		} {
			valueWithReturn { :return:/1 |
				| size = self.cfg.numNodes; |
				self.nonBackPreds.removeAll;
				self.backPreds.removeAll;
				self.number.removeAll;
				(size > self.maxSize).ifTrue {
					self.header := Array(size);
					self.type := Array(size);
					self.last := Array(size);
					self.nodes := Array(size);
					self.maxSize := size
				};
				1.toDo(size) { :i |
					self.nonBackPreds.addLast(Set());
					self.backPreds.addLast(Array());
					self.nodes[i] := UnionFindNode()
				};
				self.initAllNodes;
				self.identifyEdges(size);
				self.header[1] := 1;
				size.downToDo(1) { :w |
					| nodePool = Array(), nodeW = self.nodes[w].bb; |
					nodeW.notNil.ifTrue {
						| workList = Array(); |
						self.stepDNodePool(w, nodePool);
						nodePool.do { :niter |
							workList.addLast(niter)
						};
						(nodePool.size ~= 0).ifTrue {
							self.type[w] := 'BBReducible'
						};
						{ workList.isEmpty }.whileFalse {
							| x nonBackSize |
							x := workList.removeFirst;
							nonBackSize := self.nonBackPreds[x.dfsNumber].size;
							(nonBackSize > self.maxNonBackPreds).ifTrue {
								self.return
							};
							self.stepEProcessNonBackPredsNodePoolWorkListX(w, nodePool, workList, x)
						};
						(nodePool.size > 0 | {
							self.type[w] = 'BBSelf'
						}).ifTrue {
							| loop = self.lsg.createNewLoopReducible(nodeW, self.type[w] ~= 'BBIrreducible'); |
							self.setLoopAttributeNodePoolLoop(w, nodePool, loop)
						}
					}
				}
			}
		}
	}

	stepEProcessNonBackPredsNodePoolWorkListX { :self :w :nodePool :workList :x |
		self.nonBackPreds[x.dfsNumber].do { :iter |
			| y = self.nodes[iter], ydash = y.findSet; |
			self.isAncestorV(w, ydash. dfsNumber).not.if {
				self.type[w] := 'BBIrreducible';
				self.nonBackPreds[w].include(ydash.dfsNumber)
			} {
				(ydash.dfsNumber ~= w).ifTrue {
					nodePool.anySatisfy { :each |
						each == ydash
					}.ifFalse {
						workList.addLast(ydash);
						nodePool.addLast(ydash)
					}
				}
			}
		}
	}

	setLoopAttributeNodePoolLoop { :self :w :nodePool :loop |
		self.nodes[w].loop(loop);
		nodePool.do { :node |
			self.header[node.dfsNumber] := w;
			node.union(self.nodes[w]);
			node.loop.notNil.if {
				node.loop.setParent(loop)
			} {
				loop.addNode(node.bb)
			}
		}
	}

	stepDNodePool { :self :w :nodePool |
		self.backPreds[w].do { :v |
			(v ~= w).if {
				nodePool.addLast(self.nodes[v].findSet)
			} {
				self.type[w] := 'BBSelf'
			}
		}
	}

}

+ControlFlowGraph {

	HavlakLoopFinder { :self :lsg |
		newHavlakLoopFinder().initialize(self, lsg)
	}

}

LoopStructureGraph : [Object] { | root loops loopCounter |

	initialize { :self |
		self.root := SimpleLoop(nil, false);
		self.loops := Array();
		self.loopCounter := 0;
		self.root.setNestingLevel(0);
		self.root.counter(self.loopCounter);
		self.loopCounter +:= 1;
		self.loops.addLast(self.root);
		self
	}

	createNewLoopReducible { :self :bb :isReducible |
		| loop = SimpleLoop(bb, isReducible); |
		loop.counter(self.loopCounter);
		self.loopCounter +:= 1;
		self.loops.addLast(loop);
		loop
	}

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
		loop.depthLevel(depth);
		loop.children.do { :liter |
			self.calculateNestingLevelRecDepth(liter, depth + 1);
			loop.setNestingLevel(loop.nestingLevel.max(1 + liter.nestingLevel))
		}
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

LoopTesterApp : [Object] { | cfg lsg |

	initialize { :self |
		self.cfg := ControlFlowGraph();
		self.lsg := LoopStructureGraph();
		self.cfg.createNode(1);
		self
	}

	buildDiamond { :self :start |
		| bb0 = start; |
		BasicBlockEdge(self.cfg, bb0, bb0 + 1);
		BasicBlockEdge(self.cfg, bb0, bb0 + 2);
		BasicBlockEdge(self.cfg, bb0 + 1, bb0 + 3);
		BasicBlockEdge(self.cfg, bb0 + 2, bb0 + 3);
		bb0 + 3
	}

	buildConnectEnd { :self :start :end |
		BasicBlockEdge(self.cfg, start, end)
	}

	buildStraightN { :self :start :n |
		0.toDo(n - 1) { :i |
			self.buildConnectEnd(start + i, start + i + 1)
		};
		start + n
	}

	buildBaseLoop { :self :from |
		|(
			header = self.buildStraightN(from, 1),
			diamond1 = self.buildDiamond(header),
			d11 = self.buildStraightN(diamond1, 1),
			diamond2 = self.buildDiamond(d11),
			footer = self.buildStraightN(diamond2,1)
		)|
		self.buildConnectEnd(diamond2, d11);
		self.buildConnectEnd(diamond1, header);
		self.buildConnectEnd(footer, from);
		footer := self.buildStraightN(footer, 1);
		footer
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

	constructCFGPP { :self :parLoops :pparLoops :ppparLoops |
		| n = 3; |
		parLoops.timesRepeat {
			self.cfg.createNode(n + 1);
			self.buildConnectEnd(2, n + 1);
			n +:= 1;
			pparLoops.timesRepeat {
				| top bottom |
				top := n;
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

	addDummyLoops { :self :numDummyLoops |
		numDummyLoops.timesRepeat {
			self.findLoops(self.lsg)
		}
	}

	findLoops { :self :loopStructure |
		| finder = HavlakLoopFinder(self.cfg, loopStructure); |
		finder.findLoops
	}

	constructSimpleCFG { :self |
		self.cfg.createNode(1);
		self.buildBaseLoop(1);
		self.cfg.createNode(2);
		BasicBlockEdge(self.cfg, 1, 3)
	}

}

+Void {

	LoopTesterApp {
		newLoopTesterApp().initialize
	}

}

SimpleLoop : [Object] { | counter depthLevel parent isRoot nestingLevel header isReducible basicBlocks children |

	initialize { :self :aBB :aBool |
		self.counter := 0;
		self.depthLevel := 0;
		self.isRoot := false;
		self.nestingLevel := 0;
		self.header := aBB;
		self.isReducible := aBool;
		self.basicBlocks := Set();
		self.children := Set();
		aBB.ifNotNil {
			self.basicBlocks.include(aBB)
		};
		self
	}

	addNode { :self :bb |
		self.basicBlocks.include(bb)
	}

	addChildLoop { :self :loop |
		self.children.include(loop)
	}

	setParent { :self :value |
		self.parent := value;
		self.parent.addChildLoop(self)
	}

	setNestingLevel { :self :level |
		self.nestingLevel := level;
		(level = 0).ifTrue {
			self.isRoot := true
		}
	}

}

+[Nil, BasicBlock] {

	SimpleLoop { :self :isReducible |
		newSimpleLoop().initialize(self, isReducible)
	}

}

UnionFindNode : [Object] { | parent bb dfsNumber loop |

	initialize { :self |
		self.dfsNumber := 0;
		self
	}

	initNodeDfs { :self :bb :dfsNumber |
		self.parent := self;
		self.bb := bb;
		self.dfsNumber := dfsNumber
	}

	findSet { :self |
		| nodeList = Array(), node = self; |
		{ node ~~ node.parent }.whileTrue {
			(node.parent ~~ node.parent.parent).ifTrue {
				nodeList.addLast(node)
			};
			node := node.parent
		};
		nodeList.do { :iter |
			iter.union(self.parent)
		};
		node
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
		Benchmark('Havlak', [
			1 -> [1605, 5213],
			15 -> [1647, 5213],
			150 -> [2052, 5213],
			1500 -> [6102, 5213],
			15000 -> [46602, 5213]
		].Map) { :iterations |
			LoopTesterApp().mainLoopPPP(iterations, 50, 10, 10, 5)
		}
	}

}
