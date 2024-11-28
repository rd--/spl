# CrystalLatticeStructureBrowser

The `CrystalLatticeStructureBrowser` is a one column `ColumnBrowser`.

The single column shows the names of the crytsal lattice structures from the Leitner collection.

When selected, the text view shows the description of the lattice and a number of perspective drawings.

~~~
system.smallKansas.clsLeitner.then { :clsLeitner |
	system.smallKansas.SvgViewer(
		'Cls',
		clsLeitner.atRandom.drawing(1) { :each |
			each * 20
		},
		nil
	)
}
~~~

Chinese projection:

~~~
system.smallKansas.clsLeitner.then { :clsLeitner |
	let m = Projection3().chinese.asMatrix;
	system.smallKansas.SvgViewer(
		'Cls',
		clsLeitner.atRandom.drawing(1) { :each |
			m.applyTo(each) * 20
		},
		nil
	)
}
~~~

* * *

See also: ColumnBrowser

Categories: Kansas
