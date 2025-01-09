# leitnerCrystalStructureCatalogue

- _leitnerCrystalStructureCatalogue(aSystem)_

The Leitner catalogue is a collection of crystal structures by Michael Leitner at Universität Wien.

Answer a `Record` of `CrystalStructure`s,
keyed by name.

The `leitnerCrystalStructureCatalogue` method is `requireLibraryItem` of
'LeitnerCrystalStructureCatalogue'.

Count entries:

~~~
>>> system
>>> .leitnerCrystalStructureCatalogue
>>> .size
268
~~~

Lookup the entry for 'NbP':

~~~
>>> let cls = system
>>> .leitnerCrystalStructureCatalogue
>>> .at('NbP');
>>> (
>>> 	cls.name,
>>> 	cls.description.take(25),
>>> 	cls.vertexCount,
>>> 	cls.edges.size
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
system
.leitnerCrystalStructureCatalogue
.at('NbP')
.asPerspectiveDrawing(
	AxonometricProjection(
		pi / 6, pi / 6,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/leitnerCrystalStructureCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: CrystalStructure, CrystalStructureBrowser, LibraryItem, requireLibraryItem
