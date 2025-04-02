Tetrahedron : [Object] { | vertexCoordinates |

	asPolyhedron { :self |
		Polyhedron(
			self.vertexCoordinates,
			[
				2 3 4;
				3 2 1;
				4 1 2;
				1 4 3
			]
		)
	}

	fromBarycentricCoordinates { :self |
		let v = self.vertexCoordinates;
		{ :lambda |
			(v * lambda).sum
		}
	}

	toBarycentricCoordinates { :self :c |
		self.toBarycentricCoordinates.value(c)
	}

	toBarycentricCoordinates { :self |
		let [a, b, c, d] = self.vertexCoordinates;
		toBarycentricCoordinates(a, b, c, d)
	}

}

+List {

	asTetrahedron { :self |
		let [a, b, c, d] = self;
		Tetrahedron(a, b, c, d)
	}

	Tetrahedron { :p1 :p2 :p3 :p4 |
		newTetrahedron().initializeSlots([p1, p2, p3, p4])
	}

}
