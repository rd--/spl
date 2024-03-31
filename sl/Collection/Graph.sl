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
		[self.size, self.edges.size]
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
		self.size = 0
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

	vertexLabel { :self :vertex |
		vertex
	}

	vertices { :self |
		Range(1, self.size, 1)
	}

}

Graph : [Object, Graph] { | size edges vertexLabels edgeLabels |

	isValid {
		self.hasValidEdges & {
			self.edgeLabels.isNil | {
				self.vertexLabels.size = self.vertexCount
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

}

+@Integer {

	cycleGraph { :self |
		1:self.collect { :each |
			each -> (each % self + 1)
		}.asGraph
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

}

+List {

	asGraph { :self |
		let e = self.collect(asList:/1);
		let [i, j] = e.shape;
		(j = 2).if {
			let k = e.collect(max:/1).max;
			Graph(k, e)
		} {
			self.error('List>>asGraph: invalid edge list')
		}
	}

	asUndirectedGraph { :self |
		let g = self.asGraph;
		g.includeConverse;
		g
	}

}
