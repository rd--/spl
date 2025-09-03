# holmesPolyhedraCatalogue

- _holmesPolyhedraCatalogue(system)_

The Holmes polyhedron catalogue is a collection of polyhedra by Ryan Holmes.
Answers a `Record` of `Polyhedron`s, keyed by name.

Count catalgue entries,
contains the five Platonic solids and the thirteen Archimedean solids:

~~~
>>> system
>>> .holmesPolyhedraCatalogue
>>> .size
5 + 13
~~~

A perspective drawing of the great rhombicosidodecahedron:

~~~spl svg=A
system
.holmesPolyhedraCatalogue
.at('GreatRhombicosidodecahedron')
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/holmesPolyhedraCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

The `holmesPolyhedraCatalogue` method is `requireLibraryItem` of 'HolmesPolyhedraCatalogue'.

* * *

See also: asPerspectiveDrawing, fradinPolhyedraCatalogue, levskayaPolyhedraCatalogue, Polyhedron

Guides: Library Catalogue
