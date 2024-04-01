@Graph {

	addEdge { :self :beginVertex :endVertex |
		self.edges.add([beginVertex, endVertex])
	}

	adjacencyMatrix { :self |
		let v = self.vertices;
		{ :beginVertex :endVertex |
			self.includesEdge(beginVertex, endVertex).boole
		}.table(v, v)
	}

	allNeighbours { :self |
		self.vertices.collect { :each |
			each -> self.neighboursOf(each)
		}
	}

	degree { :self |
		[self.vertexCount, self.edgesCount]
	}

	edgeCount { :self |
		self.edges.size
	}

	edgeLabel { :self :beginVertex :endVertex |
		[beginVertex, endVertex]
	}

	hasValidEdges { :self |
		let v = self.vertices;
		self.edges.allSatisfy { :edge |
			edge.size = 2 & {
				v.includes(edge.first) & {
					v.includes(edge.second)
				}
			}
		}
	}

	includeConverse { :self |
		self.edges.do { :edge |
			self.includeEdge(edge.second, edge.first)
		}
	}

	includeEdge { :self :beginVertex :endVertex |
		self.includesEdge(beginVertex, endVertex).ifFalse {
			self.addEdge(beginVertex, endVertex)
		}
	}

	includesEdge { :self :beginVertex :endVertex |
		self.edges.anySatisfy { :each |
			each.first = beginVertex & {
				each.second = endVertex
			}
		}
	}

	includesVertex { :self :vertex |
		self.vertices.includes(vertex)
	}

	inEdgesOf { :self :vertex |
		self.edges.select { :edge |
			edge.second = vertex
		}
	}

	isEmpty { :self |
		self.vertexCount = 0 & {
			self.edgeCount = 0
		}
	}

	isValid { :self |
		self.hasValidEdges
	}

	labeledVertices { :self |
		self.vertices.collect { :each |
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

	vertextCount { :self |
		self.vertices.size
	}

	vertexLabel { :self :vertex |
		vertex
	}

}

Graph : [Object, Graph] { | lastVertex edges vertexLabels edgeLabels |

	isValid {
		self.hasValidEdges & {
			self.edgeLabels.isNil | {
				self.vertexLabels.size = self.lastVertex
			} & {
				self.edgeLabels.isNil | {
					self.edgeLabels.size = self.edges.size
				}
			}
		}
	}

	vertexLabel { :self :vertex |
		self.vertexLabels.ifNil {
			vertex
		} {
			self.vertexLabels[vertex]
		}
	}

	vertices { :self |
		Range(1, self.lastVertex, 1)
	}

}

+@Integer {

	completeGraph { :self |
		let edges = [];
		1.toDo(self) { :i |
			(i + 1).toDo(self) { :j |
				edges.add(i -> j)
			}
		};
		edges.asUndirectedGraph
	}

	cycleGraph { :self |
		1:self.collect { :each |
			each -> (each % self + 1)
		}.asUndirectedGraph
	}

	Graph { :self :edges |
		Graph(self, edges, nil, nil)
	}

	Graph { :self :edges :vertexLabels :edgeLabels |
		newGraph().initializeSlots(
			self,
			edges,
			vertexLabels,
			edgeLabels
		)
	}

	pathGraph { :self |
		(1 .. self - 1).collect { :each |
			each -> (each + 1)
		}.asUndirectedGraph
	}

	starGraph { :self |
		2:self.collect { :each |
			1 -> each
		}.asUndirectedGraph
	}

	wheelGraph { :self |
		let cycle = 2:self.collect { :each |
			each -> (each = self).if { 2 } { each + 1 }
		};
		let star = 2:self.collect { :each |
			1 -> each
		};
		(cycle ++ star).asUndirectedGraph
	}

}

+List {

	asDirectedGraph { :self |
		let e = self.collect(asList:/1);
		let [i, j] = e.shape;
		(j = 2).if {
			let k = e.collect(max:/1).max;
			Graph(k, e)
		} {
			self.error('List>>asDirectedGraph: invalid edge list')
		}
	}

	asUndirectedGraph { :self |
		let g = self.asDirectedGraph;
		g.includeConverse;
		g
	}

}
