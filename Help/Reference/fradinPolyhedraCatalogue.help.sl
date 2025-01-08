# fradinPolyhedraCatalogue

- _fradinPolyhedraCatalogue(aSystem)_

The Fradin catalogue is a collection of polyhedra distributed with TeXgraph by Patrick Fradin.
The catalogue contains:

- JohnsonSolids
- UniformPolyhedra

Answer a `Record` of `Polyhedron`s,
keyed by name.

The `fradinPolyhedraCatalogue` method is `requireLibraryItem` of 'FradinPolyhedraCatalogue'.

Count entries:

~~~
>>> system
>>> .fradinPolyhedraCatalogue
>>> .size
278
~~~

Count the vertices, and faces, and face sizes of the 70th Johnson solid:

```
>>> let c = system.fradinPolyhedraCatalogue;
>>> let j70 = c['Johnson70'];
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
.fradinPolyhedraCatalogue
.at('Johnson70')
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/fradinPolyhedraCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: asPerspectiveDrawing, holmesPolyhedraCatalogue, Polyhedra
