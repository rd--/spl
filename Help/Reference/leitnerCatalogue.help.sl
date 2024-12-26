# leitnerCatalogue

- _leitnerCatalogue(aSystem)_

The Leitner catalogue is a collection of crystal lattice structures by Michael Leitner at Universität Wien.

Answer a `Record` of `CrystalLatticeStructure`s,
keyed by name.

The `leitnerCatalogue` method is `requireLibraryItem` of
'Chemistry → CrystalLatticeStructure → LeitnerCatalogue'.

Count entries:

~~~
>>> system.leitnerCatalogue.size
268
~~~

Lookup the entry for 'NbP':

~~~
>>> let cls = system.leitnerCatalogue.at(
>>> 	'NbP'
>>> );
>>> (
>>> 	cls.name,
>>> 	cls.description.take(25),
>>> 	cls.atoms.size,
>>> 	cls.bonds.size
>>> )
(
	'NbP',
	'NbP     & I4_1/amd (#141)',
	23,
	42
)
~~~

Draw a picture of the entry for _NbP_ in an axonometric perspective:

~~~spl svg=A
let cls = system.leitnerCatalogue['NbP'];
let p:/1 = AxonometricProjection(
	'Isometric'
).asBlock;
cls.graph.asLineDrawing { :each |
	let [name, coordinates] = each;
	p(coordinates)
}
~~~

![](sw/spl/Help/Image/leitnerCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: CrystalLatticeStructure, CrystalLatticeStructureBrowser, LibraryItem, requireLibraryItem
