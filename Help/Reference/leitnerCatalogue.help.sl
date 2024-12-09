# leitnerCatalogue

- _leitnerCatalogue(aSystem)_

The Leitner catalogue is a collection of crystal lattice structures by Michael Leitner at Universität Wien.

Answer a `Promise` that will resolve to a `List` of `CrystalLatticeStructure`s.

The `leitnerCatalogue` method is `requestLibraryItem` of
'Chemistry → CrystalLatticeStructure → LeitnerCatalogue'.

Request the catalogue,
fetching it if it is not already cached,
and when it arrives print its size and a random entry:

~~~
system.leitnerCatalogue.then { :table |
	let cls = table.atRandom;
	(
		table.size,
		cls.name,
		cls.description.trim,
		cls.atoms.size,
		cls.bonds.size
	).postLine
}
~~~

Draw a picture of the entry for _NbP_ in an axonometric perspective:

~~~
system.leitnerCatalogue.then { :table |
	let cls = table.detect { :each |
		each.name = 'NbP'
	};
	let p:/1 = AxonometricProjection(
		'Isometric'
	).asBlock;
	cls.graph.lineDrawing { :each |
		let [name, coordinates] = each;
		p(coordinates)
	}
}
~~~

![](sw/spl/Help/Image/leitnerCatalogue-A.svg)

* * *

See also: CrystalLatticeStructure, requestLibraryItem
