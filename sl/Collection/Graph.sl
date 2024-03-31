Graph : [Object] { | size edges vertexLabels edgeLabels |

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

	includeConverse { :self |
		self.edges.do { :edge |
			self.includeEdge(edge.second, edge.first)
		}
	}

	includeEdge { :self :beginVertex :endVertex |
		self.includesEdge(beginVertex, endVertex).ifFalse {
			self.edges.add([beginVertex, endVertex])
		}
	}

	includesEdge { :self :beginVertex :endVertex |
		self.edges.anySatisfy { :each |
			each.first = beginVertex & {
				each.second = endVertex
			}
		}
	}

	inEdgesOf { :self :vertex |
		self.edges.select { :edge |
			edge.second = vertex
		}
	}

	isValid { :self |
		self.edges.allSatisfy { :edge |
			edge.size = 2 & {
				edge.allSatisfy { :vertex |
					vertex.betweenAnd(1, self.size)
				}
			}
		} & {
			self.vertexLabels.isNil | {
				self.vertexLabels.size = self.size
			} & {
				self.edgeLabels.isNil | {
					self.edgeLabels.size = self.edges.size
				}
			}
		}
	}

	labeledVertices { :self |
		self.vertexLabels.ifNil {
			self.vertices.collect { :each |
				each -> ''
			}
		} {
			self.vertices.withCollect(self.vertexLabels) { :vertex :label |
				vertex -> label
			}
		}
	}

	neighboursOf { :self :vertex |
		self.outEdgesOf(vertex).collect(second:/1)
	}

	outEdgesOf { :self :vertex |
		self.edges.select { :edge |
			edge[1] = vertex
		}
	}

	vertices { :self |
		Range(1, self.size, 1)
	}

}

+@Integer {

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
