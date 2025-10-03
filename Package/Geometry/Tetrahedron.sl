Tetrahedron : [Object, Equatable] { | vertexCoordinates |

	asPerspectiveDrawing { :self |
		self.asPolyhedron.asPerspectiveDrawing
	}

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

	circumcenter { :self |
		self.circumsphere.center
	}

	circumradius { :self |
		self.circumsphere.radius
	}

	circumsphere { :self |
		let v = self.vertexCoordinates;
		let a = v.arrayPad([0 0; 0 1], 1).determinant;
		let vSquareSum = v.square.collect { :each |
			each.sum.enclose
		};
		let c = [vSquareSum, v].join(2);
		let d = c.arrayPad([0 0; 0 1], 1);
		let f = { :m :i |
			d.submatrix(
				[1 .. 4],
				[1 .. 5].without(i + 1)
			).determinant * m
		};
		let dx = f(1, 1);
		let dy = f(-1, 2);
		let dz = f(1, 3);
		let r = (dx.square + dy.square + dz.square - (4 * a * c.determinant)).sqrt / (2 * a.abs);
		Sphere(
			[dx dy dz] / (a * 2),
			r
		)
	}

	fromBarycentricCoordinates { :self |
		let v = self.vertexCoordinates;
		{ :lambda |
			(v * lambda).sum
		}
	}

	project { :self :projection |
		self.asPolyhedron.project(projection)
	}

	translate { :self :v |
		Tetrahedron(
			self.vertexCoordinates.collect { :each |
				each + v
			}
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
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

	Tetrahedron { :self |
		let [m, n] = self.shape;
		(m = 4 & { n = 3 }).if {
			newTetrahedron().initializeSlots(self)
		} {
			self.error('Tetrahedron: invalid matrix')
		}
	}

}
