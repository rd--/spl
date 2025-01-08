# fradinCatalogue

- _fradinCatalogue(aSystem, aString)_

The Fradin catalogue is a collection of polyhedra distributed with TeXgraph by Patrick Fradin.
The catalogue is divided into parts:

- JohnsonSolids
- UniformPolyhedra

Answer a `Record` of `Polyhedron`s,
keyed by name.

The `fradinCatalogue` method is `requireLibraryItem` of
'Geometry → Polhyedra → Fradin...Catalogue'.

Count entries:

~~~
>>> system.fradinCatalogue(
>>> 	'JohnsonSolids'
>>> ).size
92

>>> system.fradinCatalogue(
>>> 	'UniformPolyhedra'
>>> ).size
81
~~~

Count the vertices, and faces, and face sizes of the 70th Johnson solid:

```
>>> let j = system.fradinCatalogue(
>>> 	'JohnsonSolids'
>>> );
>>> let j70 = j['Johnson70'];
>>> (
>>> 	j70.vertexCount,
>>> 	j70.faceCount,
>>> 	j70.faceSizeCount
>>> )
(
	70,
	52,
	[3 -> 30, 4 -> 10, 5 -> 2, 10 -> 10]
)
```

A perspective drawing of the 70th Johnson solid:

~~~spl svg=A
system
.fradinCatalogue('JohnsonSolids')
.at('Johnson70')
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/fradinCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: asPerspectiveDrawing, holmesPolyhedraCatalogue, Polyhedra
