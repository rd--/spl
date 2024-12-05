CrystalLatticeStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.clsLeitner.then { :clsLeitner |
			let cls = clsLeitner.atRandom;
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
