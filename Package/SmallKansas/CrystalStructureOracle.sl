CrystalStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'LeitnerCrystalStructureCatalogue'
		).then { :leitnerCatalogue |
			let cls = leitnerCatalogue.atRandom;
			let matrix = AxonometricProjection('Chinese').asMatrix;
			smallKansas.SvgViewer(
				'Cls - ' ++ cls.name,
				cls.asSvgElement(12) { :each |
					matrix.dot(each).first(2)
				},
				event
			)
		}
	}

}
