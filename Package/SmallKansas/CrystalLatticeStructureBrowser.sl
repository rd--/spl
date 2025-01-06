/* Requires: CrystalLatticeStructure */

+CrystalLatticeStructure {

	asSvgElement { :self :scale :projection:/1 |
		self.asGraph.asSvgElement(scale, projection:/1)
	}

	summary { :self |
		let container = 'div'.createElement;
		let description = 'p'.createElement;
		let projectionsA = 'p'.createElement;
		let projectionsB = 'p'.createElement;
		let scaledDrawing = { :projection:/1 |
			self.asSvgElement(12, projection:/1)
		};
		description.textContent := self.description;
		projectionsA.appendChildren([
			scaledDrawing { :each | let [x, y, z] = each; [x y] },
			scaledDrawing { :each | let [x, y, z] = each; [y z] },
			scaledDrawing { :each | let [x, y, z] = each; [x z] }
		]);
		projectionsB.appendChildren([
			scaledDrawing(AxonometricProjection('Chinese').asBlock),
			scaledDrawing(AxonometricProjection('Isometric').asBlock)
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

	CrystalLatticeStructureBrowser { :self :structures |
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

CrystalLatticeStructureBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'Chemistry/CrystalLatticeStructure/LeitnerCatalogue'
		).then { :leitnerCatalogue |
			smallKansas.addFrame(
				smallKansas.CrystalLatticeStructureBrowser(leitnerCatalogue),
				event
			)
		}
	}

}
