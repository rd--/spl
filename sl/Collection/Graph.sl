Graph : [Object] { | size edges vertexLabels edgeLabels |

	isValid { :self |
		self.edges.allSatisfy { :edge |
			(edge.size = 2) & {
				edge.allSatisfy { :vertex |
					vertex.betweenAnd(1, self.size)
				}
			}
		} & {
			self.vertexLabels.isNil | {
				self.vertexLabels.size = self.size
			}
		} & {
			self.edgeLabels.isNil | {
				self.edgeLabels.size = self.edges.size
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

	vertices { :self |
		Interval(1, self.size, 1)
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
