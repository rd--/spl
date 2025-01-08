# holmesPolyhedraCatalogue

- _holmesPolyhedraCatalogue(aSystem)_

The Holmes polyhedron catalogue is a collection of polyhedra by Ryan Holmes.

Answer a `Record` of `Polyhedron`s,
keyed by name.

The `holmesPolyhedraCatalogue` method is `requireLibraryItem` of
'Geometry → Polhyedra → HolmesPolyhedraCatalogue'.

Count entries,
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
and this function requires the item be available locally.

* * *

See also: asPerspectiveDrawing, fradinCatalogue, levskayaPolyhedraCatalogue, Polyhedron
