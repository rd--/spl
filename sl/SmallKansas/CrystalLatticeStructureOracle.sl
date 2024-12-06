CrystalLatticeStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.leitnerCatalogue.then { :leitnerCatalogue |
			let cls = leitnerCatalogue.atRandom;
			let mtx = AxonometricProjection('Chinese').asMatrix;
			smallKansas.SvgViewer(
				'Cls - ' ++ cls.name,
				cls.drawing(0.25) { :each |
					mtx.dot(each).first(2) * 50
				},
				event
			)
		}
	}

}
