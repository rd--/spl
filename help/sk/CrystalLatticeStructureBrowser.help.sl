# CrystalLatticeStructureBrowser

```
system.smallKansas.clsLeitner.then { :clsLeitner |
	system.smallKansas.SvgViewer(
		'Cls',
		clsLeitner.atRandom.drawing(1) { :each |
			each.xy * 20
		}
	)
}
```

```
system.smallKansas.clsLeitner.then { :clsLeitner |
	| m = Projection3().chinese.Matrix33; |
	system.smallKansas.SvgViewer(
		'Cls',
		clsLeitner.atRandom.drawing(1) { :each |
			m.applyTo(each).xy * 20
		}
	)
}
```
