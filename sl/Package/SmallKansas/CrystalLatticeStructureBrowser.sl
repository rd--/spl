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
		|(
			container = 'div'.createElement,
			description = 'p'.createElement,
			projectionsA = 'p'.createElement,
			projectionsB = 'p'.createElement,
			scaledDrawing = { :projection:/1 |
				self.drawing(0.25) { :each |
					each.projection * 50
				}
			}
		)|
		description.textContent := self.description;
		projectionsA.appendChildren([
			scaledDrawing(xy:/1),
			scaledDrawing(yz:/1),
			scaledDrawing(xz:/1)
		]);
		projectionsB.appendChildren([
			scaledDrawing(Projection3().chinese.procedure),
			scaledDrawing(Projection3().isometric.procedure)
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
				[label, coordinate.Vector3]
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

+Array {

	CrystalLatticeStructureBrowser { :self |
		ColumnBrowser('Crystal Lattice Structure Browser', 'text/html', false, false, [1], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					self.collect(name:/1)
				},
				1 -> {
					| cls = self.detect { :each | each.name = path[1] }; |
					cls.summary.outerHTML
				}
			])
		}
	}

}

CrystalLatticeStructureBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.clsLeitner.then { :clsLeitner |
			smallKansas.addFrame(CrystalLatticeStructureBrowser(clsLeitner), event)
		}
	}

}
