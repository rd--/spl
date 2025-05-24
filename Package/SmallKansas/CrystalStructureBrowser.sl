/* Requires: CrystalStructure */

+CrystalStructure {

	asSvgElement { :self :scale :projection:/1 |
		self.asGraph.asSvgElement(scale, projection:/1)
	}

	summary { :self |
		let container = 'div'.createElement;
		let description = 'p'.createElement;
		let projectionsA = 'p'.createElement;
		let projectionsB = 'p'.createElement;
		let scaledDrawing = { :projection |
			self.asSvgElement(12, projection.asUnaryBlock)
		};
		description.textContent := self.description;
		projectionsA.appendChildren([
			scaledDrawing { :each | let [x, y, z] = each; [x y] },
			scaledDrawing { :each | let [x, y, z] = each; [y z] },
			scaledDrawing { :each | let [x, y, z] = each; [x z] }
		]);
		projectionsB.appendChildren([
			scaledDrawing('CabinetOblique'.namedAxonometricProjection(1/6.pi)),
			scaledDrawing('Isometric'.namedAxonometricProjection)
		]);
		container.appendChildren([
			description,
			projectionsA,
			projectionsB
		]);
		container
	}

}

+SmallKansas {

	CrystalStructureBrowser { :self :structures |
		self.ColumnBrowser(
			'Crystal Lattice Structure Browser',
			'text/html',
			false,
			false,
			[1],
			nil,
			nil
		) { :browser :path |
			path.size.caseOf([
				0 -> {
					structures.keys
				},
				1 -> {
					let cls = structures.detect { :each |
						each.name = path[1]
					};
					cls.summary.outerHtml
				}
			])
		}
	}

}

CrystalStructureBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'LeitnerCrystalStructureCatalogue'
		).then { :leitnerCatalogue |
			smallKansas.addFrame(
				smallKansas.CrystalStructureBrowser(leitnerCatalogue),
				event
			)
		}
	}

}
