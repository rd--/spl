Tetrahedron : [Object, Store, Equal, Geometry, PolygonMesh] {

	| vertexCoordinates |

	PerspectiveDrawing { :self |
		self.Polyhedron.PerspectiveDrawing
	}

	Polyhedron { :self |
		Polyhedron(
			self.vertexCoordinates,
			self.faceIndices
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
		let a = v.arrayPad([0.0 0.0; 0.0 1.0], 1.0).determinant;
		let vSquareSum = v.square.collect { :each |
			each.sum.enclose
		};
		let c = [vSquareSum, v].join(2.0);
		let d = c.arrayPad([0.0 0.0; 0.0 1.0], 1.0);
		let f = { :m :i |
			d.submatrix(
				4L.iota,
				5L.iota.without!(i + 1L)
			).determinant * m
		};
		let dx = f(1.0, 1L);
		let dy = f(-1.0, 2L);
		let dz = f(1.0, 3L);
		let r = (dx.square + dy.square + dz.square - (4 * a * c.determinant)).sqrt / (2.0 * a.abs);
		Sphere(
			[dx dy dz] / (a * 2.0),
			r
		)
	}

	faceIndices { :unused |
		[
			2L 3L 4L;
			3L 2L 1L;
			4L 1L 2L;
			1L 4L 3L
		]
	}

	fromBarycentricCoordinates { :self |
		let v = self.vertexCoordinates;
		{ :lambda |
			(v * lambda).sum
		}
	}

	project { :self :projection |
		Polyhedron(self).project(projection)
	}

	toBarycentricCoordinates { :self :c |
		let f/1 = self.toBarycentricCoordinates;
		f(c)
	}

	toBarycentricCoordinates { :self |
		let [a, b, c, d] = self.vertexCoordinates;
		toBarycentricCoordinates(a, b, c, d)
	}

	translate { :self :v |
		Tetrahedron(
			self.vertexCoordinates.collect { :each |
				each + v
			}
		)
	}

}

+List {

	Tetrahedron { :self |
		(self.shape = [4L, 3L]).if {
			newTetrahedron().initializeSlots(self)
		} {
			self.error('Tetrahedron: invalid matrix')
		}
	}

}
