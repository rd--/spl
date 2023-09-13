CrystalLatticeStructureOracle : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.requireLibraryItem('clsLeitner').then { :clsLeitner |
			| cls = clsLeitner.atRandom, mtx = Projection3().chinese.Matrix33; |
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
