/* Requires: Graph LibraryItem */

CrystalLatticeStructure : [Object] { | name description vertexCount edges vertexLabels vertexCoordinates |

	asGraph { :self |
		let answer = Graph(
			self.vertexList,
			self.edges
		);
		answer.vertexLabels(self.vertexLabels);
		answer.vertexCoordinates(self.vertexCoordinates);
		answer
	}

	asPerspectiveDrawing { :self :projection:/1 |
		self.asGraph.asPerspectiveDrawing(projection:/1)
	}

	atoms { :self |
		self.vertexLabels.withCollect(
			self.vertexCoordinates
		) { :label :coordinates |
			[label, coordinates]
		}
	}

	bonds { :self |
		self.edges
	}

	vertexList { :self |
		[1 .. self.vertexCount]
	}

}

+Record {

	asCrystalLatticeStructure { :self |
		newCrystalLatticeStructure().initializeSlots(
			self['name'],
			self['description'],
			self['vertexLabels'].size,
			self['edges'].collect { :edge |
				edge.collect { :each |
					each + 1
				}
			},
			self['vertexLabels'],
			self['vertexCoordinates']
		)
	}

}

+System {

	leitnerCatalogue { :self |
		self.requireLibraryItem(
			'Chemistry/CrystalLatticeStructure/LeitnerCatalogue'
		)
	}

}

LibraryItem(
	name: 'Chemistry/CrystalLatticeStructure/LeitnerCatalogue',
	url: 'https://rohandrape.net/sw/hsc3-data/data/chemistry/json/cls.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect(asCrystalLatticeStructure:/1)
	}
)
