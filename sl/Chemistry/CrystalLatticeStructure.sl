/* Requires: Graph LibraryItem */

CrystalLatticeStructure : [Object] { | name description atoms bonds |

	drawing { :self :scale :projection:/1 |
		self.graph.drawing(scale) { :each |
			each.second.projection
		}
	}

	graph { :self |
		Graph(
			[1 .. self.atoms.size],
			self.bonds
		).vertexLabels(self.atoms)
	}

}

+Record {

	asCrystalLatticeStructure { :self |
		newCrystalLatticeStructure().initializeSlots(
			self['name'],
			self['description'],
			self['vertexLabels'].withCollect(
				self['vertexCoordinates']
			) { :label :coordinates |
				[label, coordinates]
			},
			self['edges'].collect { :edge |
				edge.collect { :each |
					each + 1
				}
			}
		)
	}

}

+@Cache {

	clsLeitner { :self |
		self.useLibraryItem(
			LibraryItem(
				'clsLeitner',
				'https://rohandrape.net/sw/hsc3-data/data/chemistry/json/cls.json',
				'application/json',
				{ :libraryItem |
					libraryItem.collect(asCrystalLatticeStructure:/1)
				}
			)
		)
	}

}
