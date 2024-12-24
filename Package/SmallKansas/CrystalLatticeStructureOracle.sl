CrystalLatticeStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'Chemistry/CrystalLatticeStructure/LeitnerCatalogue'
		).then { :leitnerCatalogue |
			let cls = leitnerCatalogue.atRandom;
			let matrix = AxonometricProjection('Chinese').asMatrix;
			smallKansas.SvgViewer(
				'Cls - ' ++ cls.name,
				cls.drawing(0.15) { :each |
					matrix.dot(each).first(2)
				},
				event
			)
		}
	}

}
