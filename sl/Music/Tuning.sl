@Tuning {

	cents { :self |
		self.typeResponsibility('cents')
	}

	integers { :self |
		self.typeResponsibility('integers')
	}

	latticeEdges { :self :vertices |
		| indices = [1 .. self.degree], answer = []; |
		indices.combinationsAtATimeDo(2) { :each |
			| [i, j] = each; |
			(vertices[i].latticeDistance(vertices[j]) = 1).ifTrue {
				answer.add(each.copy)
			}
		};
		answer
	}

	latticeVertices { :self |
		self.ratios.collect { :each |
			each.latticeVector(self.limit)
		}
	}

	ratios { :self |
		self.typeResponsibility('ratios')
	}

}
