# planarGraphCatalogue

- _planarGraphCatalogue(aSystem)_

A catalogue of Tutte drawings of planar graphs.
Answers a `List` of `PolygonMesh` values keyed by name.

Count entries:

```
>>> system.planarGraphCatalogue.size
7236
```

Draw the entry for the sixth graph in the set _nonham52c5_,
the set of cyclically 5-connected non-Hamiltonian graphs of 52 vertices:

~~~spl svg=A
system
.planarGraphCatalogue
.at('nonham52c5.5')
.asLineDrawing
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-A.svg)

Count the vertices and face degrees of the above graph:

```
>>> let p = system
>>> .planarGraphCatalogue
>>> .at('nonham52c5.5');
>>> (p.vertexCount, p.faceDegreeCounts)
(52, [5 -> 24, 8 -> 3, 12 -> 1])
```

Draw the entry for the 189th graph in the set _convexpolytopes\_8_,
the set of convex polytopes of eight vertices:

~~~spl svg=B
system
.planarGraphCatalogue
.at('convexpolytopes_8.188')
.asLineDrawing
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-B.svg)

Draw the seventh graph in the set _5reg\_22-35_,
the set of five regular graphs of 22 vertices and 35 faces:

~~~spl svg=C
system
.planarGraphCatalogue
.at('5reg_22-35.6')
.asLineDrawing
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-C.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

The `planarGraphCatalogue` method is `requireLibraryItem` of 'PlanarGraphCatalogue'.

To clear the library item:

~~~
system
.library[
	'PlanarGraphCatalogue'
]
.deleteLocalStorage
~~~

* * *

See also: PolygonMesh

Further Reading: Brinkmann & McKay 2007
