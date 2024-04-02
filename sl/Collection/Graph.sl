DirectedEdge : [Object] { | first second |

	asEdge { :self |
		self
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

UndirectedEdge : [Object] { | first second |

	asEdge { :self |
		self
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+@Object {

	DirectedEdge { :self :anObject |
		newDirectedEdge().initializeSlots(self, anObject)
	}

	UndirectedEdge { :self :anObject |
		newUndirectedEdge().initializeSlots(self, anObject)
	}

}

@Graph {

	adjacencyMatrix { :self |
		let v = self.vertexList;
		{ :i :j |
			self.includesEdge(i, j).boole
		}.table(v, v)
	}

	allNeighbours { :self |
		self.vertexList.collect { :each |
			each -> self.neighboursOf(each)
		}
	}

	degree { :self |
		[self.vertexCount, self.edgeCount]
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
			edge.size = 2 & {
				v.includes(edge.first) & {
					v.includes(edge.second)
				}
			}
		}
	}

	includeConverse { :self |
		self.edgeList.do { :edge |
			self.includeEdge(edge.second, edge.first)
		}
	}

	includeEdge { :self :beginVertex :endVertex |
		self.includesEdge(beginVertex, endVertex).ifFalse {
			self.addEdge(beginVertex, endVertex)
		}
	}

	includesEdge { :self :beginVertex :endVertex |
		self.edgeList.anySatisfy { :each |
			each.first = beginVertex & {
				each.second = endVertex
			}
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

	isEmpty { :self |
		self.vertexCount = 0 & {
			self.edgeCount = 0
		}
	}

	isValid { :self |
		self.hasValidEdgeList
	}

	labeledVertexList { :self |
		self.vertexList.collect { :each |
			each -> self.vertexLabel(each)
		}
	}

	neighboursOf { :self :vertex |
		self.outEdgesOf(vertex).collect(second:/1)
	}

	outEdgesOf { :self :vertex |
		self.edges.select { :edge |
			edge.first = vertex
		}
	}

	vertexCount { :self |
		self.vertexList.size
	}

}

Graph : [Object, Graph] { | vertexList edgeList vertexProperties edgeProperties |

	addEdge { :self :beginVertex :endVertex |
		self.edgeList.add([beginVertex, endVertex])
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
		let edges = [];
		1.toDo(self) { :i |
			edges.addAll(
				(i + 1).to(self).collect { :j |
					(i, j)
				}
			)
		};
		edges.asGraph
	}

	cycleGraph { :self |
		1:self.collect { :each |
			(each, each % self + 1)
		}.asGraph
	}

	pathGraph { :self |
		(1 .. self - 1).collect { :each |
			(each, each + 1)
		}.asGraph
	}

	starGraph { :self |
		2:self.collect { :each |
			(1, each)
		}.asGraph
	}

	wheelGraph { :self |
		let cycle = 2:self.collect { :each |
			(each, (each = self).if { 2 } { each + 1 })
		};
		let star = 2:self.collect { :each |
			(1, each)
		};
		(cycle ++ star).asGraph
	}

}

+List {

	asGraph { :self |
		let edges = self.collect(asEdge:/1);
		let vertices = [];
		edges.do { :each |
			vertices.add(each.first);
			vertices.add(each.second)
		};
		Graph(vertices.nub.sort, edges)
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
		DirectedEdge(self.key, self.value)
	}

}

+List {

	asEdge { :self |
		(self.size = 2).if {
			UndirectedEdge(self.min, self.max)
		} {
			self.error('List>>asEdge: not two-list')
		}
	}

}
