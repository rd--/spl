CrystalLatticeStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.clsLeitner.then { :clsLeitner |
			let cls = clsLeitner.atRandom;
			let mtx = Projection3().chinese.asMatrix33;
			smallKansas.addFrame(SvgViewer(
				'Cls - ' ++ cls.name,
				cls.drawing(0.25) { :each |
					mtx.applyTo(each).xy * 50
				}),
				event
			)
		}
	}

}
