CrystalStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requestLibraryItem(
			'LeitnerCrystalStructureCatalogue'
		).then { :leitnerCatalogue |
			let cls = leitnerCatalogue.atRandom;
			let prj:/1 = 'CabinetOblique'.namedAxonometricProjection(1/6.pi).asUnaryBlock;
			smallKansas.SvgViewer(
				'Cls - ' ++ cls.name,
				cls.asSvgElement(12) { :each |
					prj(each).first(2)
				},
				event
			)
		}
	}

}
