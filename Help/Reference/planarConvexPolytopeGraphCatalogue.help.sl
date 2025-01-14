# planarConvexPolytopeGraphCatalogue

- _planarConvexPolytopeGraphCatalogue(aSystem)_

A catalogue of Tutte drawings of planar graphs.
Answers a `List` of `PolygonMesh` values keyed by name.

Count entries:

```
>>> system
>>> .planarConvexPolytopeGraphCatalogue
>>> .size
2907
```

Draw the entry for the 189th graph in the set _convexpolytopes\_8_,
the set of convex polytopes of eight vertices:

~~~spl svg=A
system
.planarConvexPolytopeGraphCatalogue
.at('convexpolytopes_8.188')
.asLineDrawing
~~~

![](sw/spl/Help/Image/planarConvexPolytopeGraphCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: planarNonHamiltonianGraphCatalogue, planarQuadrangulationsCatalogue, planarRegularGraphCatalogue, PolygonMesh

Further Reading: Brinkmann & McKay 2007
