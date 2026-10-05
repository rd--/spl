Parallelepiped : [Object, Geometry] {

	| origin vectorList |

	asPerspectiveDrawing { :self |
		self.Polyhedron.asPerspectiveDrawing
	}

	dimension { :self |
		self.vectorList.size
	}

	embeddingDimension { :self |
		self.origin.size
	}

	faceIndices { :self |
		[
			4 3 2 1;
			1 2 5 6;
			2 3 8 5;
			3 4 7 8;
			4 1 6 7;
			6 5 8 7
		]
	}

	Polyhedron { :self |
		Polyhedron(
			self.vertexCoordinates,
			self.faceIndices
		)
	}

	project { :self :projection |
		self.Polyhedron.project(projection)
	}

	vertexCoordinates { :self |
		let o = self.origin;
		let [v1, v2, v3] = self.vectorList;
		[
			[0 0 0],
			v1, v1 + v2,
			v2, v1 + v3,
			v3, v2 + v3,
			v1 + v2 + v3
		] + [o]
	}

	volume { :self |
		self.vectorList.determinant.abs
	}

}

+List {

	Parallelepiped { :origin :vectorList |
		origin.assertIsOfSize(3);
		vectorList.assertIsOfShape([3 3]);
		newParallelepiped().initializeSlots(origin, vectorList)
	}

}
