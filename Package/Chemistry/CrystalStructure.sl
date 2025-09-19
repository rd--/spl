/* Requires: Graph LibraryItem */

CrystalStructure : [Object] { | name description vertexCount edges vertexLabels vertexCoordinates |

	asGraph { :self |
		let answer = Graph(
			self.vertexList,
			self.edges
		);
		answer.vertexLabels(self.vertexLabels);
		answer.vertexCoordinates(self.vertexCoordinates);
		answer
	}

	asPerspectiveDrawing { :self :projection |
		self.asGraph.asPerspectiveDrawing(projection)
	}

	asPerspectiveDrawing { :self |
		self.asGraph.asPerspectiveDrawing
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

	asCrystalStructure { :self |
		newCrystalStructure().initializeSlots(
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

	leitnerCrystalStructureCatalogue { :self |
		self.requireLibraryItem(
			'LeitnerCrystalStructureCatalogue'
		)
	}

}

LibraryItem(
	name: 'LeitnerCrystalStructureCatalogue',
	category: 'Chemistry/Crystallography',
	url: 'https://rohandrape.net/sw/hsc3-data/data/chemistry/json/cls.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect(asCrystalStructure:/1)
	}
)
