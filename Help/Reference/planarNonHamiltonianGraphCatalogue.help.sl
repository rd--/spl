# planarNonHamiltonianGraphCatalogue

- _planarNonHamiltonianGraphCatalogue(aSystem)_

A catalogue of Tutte drawings of planar graphs.
Answers a `List` of `PolygonMesh` values keyed by name.

Count entries:

```
>>> system
>>> .planarNonHamiltonianGraphCatalogue
>>> .size
1213
```

Count the vertices and face degrees of the entry for the sixth graph in the set _nonham52c5_,
the set of cyclically 5-connected non-Hamiltonian graphs of 52 vertices:

```
>>> let p = system
>>> .planarNonHamiltonianGraphCatalogue
>>> .at('nonham52c5.5');
>>> (p.vertexCount, p.faceDegreeCounts)
(52, [5 -> 24, 8 -> 3, 12 -> 1])
```

Draw the the above graph:

~~~spl svg=A
system
.planarNonHamiltonianGraphCatalogue
.at('nonham52c5.5')
.asLineDrawing
~~~

![](sw/spl/Help/Image/planarNonHamiltonianGraphCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: planarConvexPolytopeGraphCatalogue, planarQuadrangulationsCatalogue, planarRegularGraphCatalogue, PolygonMesh

Further Reading: Brinkmann & McKay 2007
