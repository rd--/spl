CrystalLatticeStructure : [Object] { | name description atoms bonds |

	drawing { :self :scale :projection:/1 |
		self.graph.drawing(scale) { :each |
			each.second.projection
		}
	}

	graph { :self |
		Graph(self.atoms.size, self.bonds, self.atoms, nil)
	}

	summary { :self |
		let container = 'div'.createElement;
		let description = 'p'.createElement;
		let projectionsA = 'p'.createElement;
		let projectionsB = 'p'.createElement;
		let scaledDrawing = { :projection:/1 |
			self.drawing(0.25) { :each |
				each.projection * 50
			}
		};
		description.textContent := self.description;
		projectionsA.appendChildren([
			scaledDrawing(xy:/1),
			scaledDrawing(yz:/1),
			scaledDrawing(xz:/1)
		]);
		projectionsB.appendChildren([
			scaledDrawing(Projection3().chinese.block),
			scaledDrawing(Projection3().isometric.block)
		]);
		container.appendChildren([
			description,
			projectionsA,
			projectionsB
		]);
		container
	}

}

+Record {

	CrystalLatticeStructure { :self |
		newCrystalLatticeStructure().initializeSlots(
			self::name,
			self::description,
			self::vertexLabels.withCollect(self::vertexCoordinates) { :label :coordinate |
				[label, coordinate.asVector3]
			},
			self::edges.collect { :item |
				item.collect { :each |
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
				{ :item |
					item.collect(CrystalLatticeStructure:/1)
				}
			)
		)
	}

}

+SmallKansas {

	CrystalLatticeStructureBrowser { :self :structures |
		self.ColumnBrowser('Crystal Lattice Structure Browser', 'text/html', false, false, [1], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					structures.collect(name:/1)
				},
				1 -> {
					let cls = structures.detect { :each |
						each.name = path[1]
					};
					cls.summary.outerHTML
				}
			])
		}
	}

}

CrystalLatticeStructureBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.clsLeitner.then { :clsLeitner |
			smallKansas.addFrame(
				smallKansas.CrystalLatticeStructureBrowser(clsLeitner),
				event
			)
		}
	}

}
