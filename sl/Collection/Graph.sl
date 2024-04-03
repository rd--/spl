@Graph {

	adjacencyList { :self |
		self.vertexList.collect { :each |
			self.adjacencyList(each)
		}
	}

	adjacencyList { :self :vertex |
		let answer = [];
		self.edgeList.do { :each |
			(each.first = vertex).ifTrue {
				answer.add(each.second)
			};
			(each.second = vertex).ifTrue {
				answer.add(each.first)
			}
		};
		answer
	}

	adjacencyMatrix { :self |
		let v = self.vertexList;
		{ :i :j |
			self.includesEdge(i -> j).boole
		}.table(v, v)
	}

	allNeighbours { :self |
		self.vertexList.collect { :each |
			each -> self.neighboursOf(each)
		}
	}

	complement { :self |
		self.complementGraph
	}

	complementGraph { :self |
		let m = self.adjacencyMatrix;
		(1 - m.size.identityMatrix - m).adjacencyGraph
	}

	degreeSequence { :self |
		self.vertexDegree.sortBy(>)
	}

	edgeCount { :self |
		self.edgeList.size
	}

	edgeIndex { :self :edge |
		self.edgeList.indexOf(edge)
	}

	edgeProperties { :self :beginVertex :endVertex |
	}

	hasValidEdgeList { :self |
		let v = self.vertexList;
		self.edgeList.allSatisfy { :edge |
			v.includes(edge.first) & {
				v.includes(edge.second)
			}
		}
	}

	incidenceList { :self :vertex |
		self.edgeList.select { :each |
			each.first = vertex | {
				each.second = vertex
			}
		}
	}

	incidenceMatrix { :self |
		self.vertexList.collect { :v |
			self.edgeList.collect { :e |
				e.isUndirectedEdge.if {
					(e.first = v).if {
						(e.second = v).if {
							2
						} {
							1
						}
					} {
						(e.second = v).if {
							1
						} {
							0
						}
					}
				} {
					e.isDirectedEdge.if {
						(e.first = v).if {
							(e.second = v).if {
								-2
							} {
								-1
							}
						} {
							(e.second = v).if {
								1
							} {
								0
							}
						}
					} {
						self.error('@Graph>>incidenceMatrix: invalid edge')
					}
				}
			}
		}
	}

	includesEdge { :self :edge |
		self.edgeList.anySatisfy { :each |
			each.matchesEdge(edge)
		}
	}

	includesVertex { :self :vertex |
		self.vertexList.includes(vertex)
	}

	inEdgesOf { :self :vertex |
		self.edgeList.select { :edge |
			edge.second = vertex
		}
	}

	isDirected { :self |
		self.edgeList.allSatisfy(isDirectedEdge:/1)
	}

	isEmpty { :self |
		self.edgeCount = 0
	}

	isLoopFree { :self |
		self.edgeList.allSatisfy { :each |
			each.first ~= each.second
		}
	}

	isMixed { :self |
		self.edgeList.anySatisfy(isDirectedEdge:/1) & {
			self.edgeList.anySatisfy(isUndirectedEdge:/1)
		}
	}

	isRegular { :self |
		self.vertexDegree.nub.size = 1
	}

	isSingleton { :self |
		self.isEmpty & {
			self.vertexCount = 1
		}
	}

	isUndirected { :self |
		self.edgeList.allSatisfy(isUndirectedEdge:/1)
	}

	isValid { :self |
		self.hasValidEdgeList
	}

	labeledVertexList { :self |
		self.vertexList.collect { :each |
			each -> self.vertexLabel(each)
		}
	}

	lineGraph { :self |
		let k = self.edgeCount;
		let v = [1 .. k];
		let e = [];
		self.isUndirected.ifTrue {
			1.toDo(k) { :i |
				(i + 1).toDo(k) { :j |
					self.edgeList[i].hasCommonVertex(
						self.edgeList[j]
					).ifTrue {
						e.add([i, j])
					}
				}
			}
		};
		self.isDirected.ifTrue {
			1.toDo(k) { :i |
				(i + 1).toDo(k) { :j |
					(
						i ~= j & {
							self.edgeList[i].second = self.edgeList[j].first
						}
					).ifTrue {
						e.add(i -> j)
					}
				}
			}
		};
		self.isMixed.ifTrue {
			self.error('@Graph>>lineGraph: mixed graph')
		};
		Graph(v, e)
	}

	neighboursOf { :self :vertex |
		self.outEdgesOf(vertex).collect(second:/1)
	}

	outEdgesOf { :self :vertex |
		self.edges.select { :edge |
			edge.first = vertex
		}
	}

	undirectedGraph { :self |
		Graph(
			self.vertexList,
			self.edgeList.collect(asUndirectedEdge:/1).nubBy(matchesEdge:/2)
		)
	}

	vertexCount { :self |
		self.vertexList.size
	}

	vertexDegree { :self |
		self.vertexList.collect { :vertex |
			self.vertexDegree(vertex)
		}
	}

	vertexDegree { :self :vertex |
		let answer = 0;
		self.edgeList.do { :each |
			(vertex = each.first).ifTrue {
				answer := answer + 1
			};
			(vertex = each.second).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

	vertexInDegree { :self |
		self.vertexList.collect { :vertex |
			self.vertexInDegree(vertex)
		}
	}

	vertexInDegree { :self :vertex |
		let answer = 0;
		self.edgeList.do { :each |
			(vertex = each.second).ifTrue {
				answer := answer + 1
			};
			each.isList.ifTrue {
				(vertex = each.first).ifTrue {
					answer := answer + 1
				}
			}
		};
		answer
	}

	vertexIndex { :self :vertex |
		self.vertexList.indexOf(vertex)
	}

	vertexOutDegree { :self |
		self.vertexList.collect { :vertex |
			self.vertexOutDegree(vertex)
		}
	}

	vertexOutDegree { :self :vertex |
		let answer = 0;
		self.edgeList.do { :each |
			(vertex = each.first).ifTrue {
				answer := answer + 1
			};
			each.isList.ifTrue {
				(vertex = each.second).ifTrue {
					answer := answer + 1
				}
			}
		};
		answer
	}

}

Graph : [Object, Graph] { | vertexList edgeList vertexProperties edgeProperties |

	addEdge { :self :edge |
		self.edgeList.add(edge)
	}

	includeEdge { :self :edge |
		self.includesEdge(edge).ifFalse {
			self.addEdge(edge)
		}
	}

	isValid {
		self.hasValidEdges & {
			self.edgeProperties.isNil | {
				self.vertexProperties.size = self.vertexList.size
			} & {
				self.edgeProperties.isNil | {
					self.edgeProperties.size = self.edgeList.size
				}
			}
		}
	}

	vertexLabel { :self :vertex |
		self.vertexProperties.ifNil {
			vertex
		} {
			self.vertexProperties[vertex]['label']
		}
	}

}

+@Integer {

	completeGraph { :self |
		let edgeList = [];
		1.toDo(self) { :i |
			edgeList.addAll(
				(i + 1).to(self).collect { :j |
					[i, j]
				}
			)
		};
		Graph([1 .. self], edgeList)
	}

	cycleGraph { :self |
		1:self.collect { :each |
			[each, each % self + 1]
		}.asGraph
	}

	pathGraph { :self |
		(1 .. self - 1).collect { :each |
			[each, each + 1]
		}.asGraph
	}

	starGraph { :self |
		2:self.collect { :each |
			[1, each]
		}.asGraph
	}

	wheelGraph { :self |
		let cycle = 2:self.collect { :each |
			[each, (each = self).if { 2 } { each + 1 }]
		};
		let star = 2:self.collect { :each |
			[1, each]
		};
		(cycle ++ star).asGraph
	}

}

+List {

	gridGraph { :shape |
		let k = shape.product;
		let v = [1 .. k];
		let c = 1:k.collect { :i | shape.cartesianIndex(i) };
		let e = [];
		1.toDo(k) { :i |
			(i + 1).toDo(k) { :j |
				((c[j] - c[i]).abs.sum = 1).ifTrue {
					e.add([i, j])
				}
			}
		};
		Graph(v, e)
	}

}

+Block {

	relationGraph { :self:/2 :isDirected :vertexList |
		let edgeList = [];
		let v = vertexList;
		let k = vertexList.size;
		let addEdge = { :i :j |
			isDirected.if {
				edgeList.add(v[i] -> v[j])
			} {
				(i <= j).ifTrue {
					edgeList.add([v[i], v[j]])
				}
			}
		};
		1:k.do { :i |
			1:k.do { :j |
				self(v[i], v[j]).ifTrue {
					addEdge(i, j)
				}
			}
		};
		Graph(vertexList, edgeList)
	}

}


+List {

	adjacencyGraph { :self |
		self.isSquareMatrix.if {
			let isDirected = self.isSymmetricMatrix.not;
			{ :i :j |
				self[i, j] = 1
			}.relationGraph(isDirected, [1 .. self.size])
		} {
			self.adjacencyGraph('List>>adjacencyGraph: not a square matrix')
		}
	}

	asGraph { :self |
		let edgeList = self.collect(asEdge:/1).asList;
		let vertexList = [];
		edgeList.do { :each |
			vertexList.add(each.first);
			vertexList.add(each.second)
		};
		Graph(vertexList.nub, edgeList)
	}

	Graph { :vertices :edges |
		Graph(vertices, edges, nil, nil)
	}

	Graph { :vertices :edges :vertexProperties :edgeProperties |
		newGraph().initializeSlots(
			vertices,
			edges,
			vertexProperties,
			edgeProperties
		)
	}

}

+Association {

	asEdge { :self |
		self
	}

	asDirectedEdge { :self |
		self.key
	}

	asUndirectedEdge { :self |
		[self.key, self.value]
	}

	head { :self |
		self.second
	}

	isDirectedEdge { :self |
		true
	}

	isEdge { :self |
		true
	}

	isUndirectedEdge { :self |
		false
	}

	matchesEdge { :self :edge |
		self = edge | {
			edge.isList.if {
				edge.matchesEdge(self)
			} {
				false
			}
		}
	}

	tail { :self |
		self.first
	}

}

+List {

	asEdge { :self |
		(self.size ~= 2).if {
			self.error('List>>asEdge: not two-list')
		} {
			self
		}
	}

	asDirectedEdge { :self |
		self.asEdge.asAssociation
	}

	asUndirectedEdge { :self |
		self.asEdge
	}

	hasCommonVertex { :self :anEdge |
		self.includes(anEdge.first) | {
			self.includes(anEdge.second)
		}
	}

	isDirectedEdge { :self |
		false
	}

	isEdge { :self |
		self.size = 2
	}

	isUndirectedEdge { :self |
		self.size = 2
	}

	matchesEdge { :self :edge |
		(self.size ~= 2).if {
			self.error('List>>matchesEdge: not two-list')
		} {
			edge.isList.if {
				self.sorted = edge.sorted
			} {
				edge.isAssociation.if {
					self.sorted = edge.asList.sort
				} {
					false
				}
			}
		}
	}

}
