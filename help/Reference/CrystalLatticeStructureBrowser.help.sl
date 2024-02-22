# CrystalLatticeStructureBrowser

The _CrystalLatticeStructureBrowser_ is a one column _ColumnBrowser_.

The single column shows the names of the crytsal lattice structures from the Leitner collection.

When selected, the text view shows the description of the lattice and a number of perspective drawings.

	system.smallKansas.clsLeitner.then { :clsLeitner |
		system.smallKansas.SvgViewer(
			'Cls',
			clsLeitner.atRandom.drawing(1) { :each |
				each.xy * 20
			}
		)
	}

Chinese projection:

	system.smallKansas.clsLeitner.then { :clsLeitner |
		let m = Projection3().chinese.Matrix33;
		system.smallKansas.SvgViewer(
			'Cls',
			clsLeitner.atRandom.drawing(1) { :each |
				m.applyTo(each).xy * 20
			}
		)
	}

* * *

Categories: SmallKansas
