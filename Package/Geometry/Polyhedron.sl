/* Requires: PolygonMesh */

Polyhedron : [Object, PolygonMesh] { | vertexCoordinates faceIndices |

	project { :self :projection |
		PolygonMesh(
			self.vertexCoordinates.collect(projection.asUnaryBlock),
			self.faceIndices
		)
	}

}

+List {

	Cuboid { :p :q |
		let m = q - p;
		let c = [0.5 0.5 0.5].unitCube;
		Polyhedron(
			c.vertexCoordinates.collect { :each |
				(each * m) + p
			},
			c.faceIndices
		)
	}

	Polyhedron { :vertexCoordinates :faceIndices |
		newPolyhedron().initializeSlots(vertexCoordinates, faceIndices)
	}

	unitCube { :center |
		Polyhedron(
			[
				0 0 0;
				1 0 0;
				1 1 0;
				0 1 0;
				0 0 1;
				1 0 1;
				1 1 1;
				0 1 1
			] - 0.5 + center,
			[
				0 1 2 3;
				4 5 6 7;
				2 3 7 6;
				0 1 5 4;
				0 4 7 3;
				1 2 6 5
			] + 1
		)
	}

	unitDodecahedron { :center |
		Polyhedron(
			[
				-1.37638 0 0.262866;
				1.37638 0 -0.262866;
				-0.425325 -1.30902 0.262866;
				-0.425325 1.30902 0.262866;
				1.11352 -0.809017 0.262866;
				1.11352 0.809017 0.262866;
				-0.262866 -0.809017 1.11352;
				-0.262866 0.809017 1.11352;
				-0.688191 -0.5 -1.11352;
				-0.688191 0.5 -1.11352;
				0.688191 -0.5 1.11352;
				0.688191 0.5 1.11352;
				0.850651 0 -1.11352;
				-1.11352 -0.809017 -0.262866;
				-1.11352 0.809017 -0.262866;
				-0.850651 0 1.11352;
				0.262866 -0.809017 -1.11352;
				0.262866 0.809017 -1.11352;
				0.425325 -1.30902 -0.262866;
				0.425325 1.30902 -0.262866
			] + center,
			[
				15 10 9 14 1;
				2 6 12 11 5;
				5 11 7 3 19;
				11 12 8 16 7;
				12 6 20 4 8;
				6 2 13 18 20;
				2 5 19 17 13;
				4 20 18 10 15;
				18 13 17 9 10;
				17 19 3 14 9;
				3 7 16 1 14;
				16 8 4 15 1
			]
		)
	}

	unitIcosahedron { :center |
		Polyhedron(
			[
				0 0 -0.951057;
				0 0 0.951057;
				-0.850651 0 -0.425325;
				0.850651 0 0.425325;
				0.688191 -0.5 -0.425325;
				0.688191 0.5 -0.425325;
				-0.688191 -0.5 0.425325;
				-0.688191 0.5 0.425325;
				-0.262866 -0.809017 -0.425325;
				-0.262866 0.809017 -0.425325;
				0.262866 -0.809017 0.425325;
				0.262866 0.809017 0.425325
			],
			[
				2 12 8;
				2 8 7;
				2 7 11;
				2 11 4;
				2 4 12;
				5 9 1;
				6 5 1;
				10 6 1;
				3 10 1;
				9 3 1;
				12 10 8;
				8 3 7;
				7 9 11;
				11 5 4;
				4 6 12;
				5 11 9;
				6 4 5;
				10 12 6;
				3 8 10;
				9 7 3
			]
		)
	}

	unitOctahedron { :center |
		Polyhedron(
			[
				-1 0  0;
				0  1  0;
				0  0 -1;
				0  0  1;
				0 -1  0;
				1  0  0
			] * 0.707107 + center,
			[
				4 5 6;
				4 6 2;
				4 2 1;
				4 1 5;
				5 1 3;
				5 3 6;
				3 1 2;
				6 3 2
			]
		)
	}

	unitTetrahedron { :center |
		Polyhedron(
			[
				0 0 0.612372;
				-0.288675 -0.5 -0.204124;
				-0.288675 0.5 -0.204124;
				0.57735 0 -0.204124
			] + center,
			[
				2 3 4;
				3 2 1;
				4 1 2;
				1 4 3
			]
		)
	}

}

+System {

	fradinPolyhedraCatalogue { :self |
		self.requireLibraryItem(
			'FradinPolyhedraCatalogue'
		)
	}

	holmesPolyhedraCatalogue { :self |
		self.requireLibraryItem(
			'HolmesPolyhedraCatalogue'
		)
	}

	levskayaPolyhedraCatalogue { :self |
		self.requireLibraryItem(
			'LevskayaPolyhedraCatalogue'
		)
	}

	mcClurePolyhedraCatalogue { :self |
		self.requireLibraryItem(
			'McClurePolyhedraCatalogue'
		)
	}

}

LibraryItem(
	name: 'FradinPolyhedraCatalogue',
	category: 'Geometry/Polyhedron',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/fradin/FradinPolyhedraCatalogue.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			Polyhedron(each['vertex'], each['face'].catenate + 1)
		}
	}
)

LibraryItem(
	name: 'HolmesPolyhedraCatalogue',
	category: 'Geometry/Polyhedron',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/holmes/HolmesPolyhedraCatalogue.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			Polyhedron(each['vertexCoordinates'], each['faceIndices'] + 1)
		}
	}
)

LibraryItem(
	name: 'LevskayaPolyhedraCatalogue',
	category: 'Geometry/Polyhedron',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/levskaya/LevskayaPolyhedraCatalogue.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			Polyhedron(each['vertexCoordinates'], each['faceIndices'] + 1)
		}
	}
)

LibraryItem(
	name: 'McClurePolyhedraCatalogue',
	category: 'Geometry/Polyhedron',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/mclure/mcClurePolyhedraCatalogue.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			Polyhedron(each['vertexCoordinates'], each['faceIndices'] + 1)
		}
	}
)

