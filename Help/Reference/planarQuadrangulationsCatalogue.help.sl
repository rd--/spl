# planarQuadrangulationsCatalogue

- _planarQuadrangulationsCatalogue(aSystem)_

A catalogue of Tutte drawings of planar graphs.
Answers a `List` of `PolygonMesh` values keyed by name.

Count entries:

```
>>> system
>>> .planarQuadrangulationsCatalogue
>>> .size
235
```

Draw the entry for the eleventh graph in the set _quadrangulations\_14_,
the set of quadrangulations of fourteen vertices:

~~~spl svg=A
system
.planarQuadrangulationsCatalogue
.at('quadrangulations_14.10')
.asLineDrawing
~~~

![](sw/spl/Help/Image/planarQuadrangulationsCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: planarConvexPolytopeGraphCatalogue, planarNonHamiltonianGraphCatalogue, planarRegularGraphCatalogue, PolygonMesh

Further Reading: Brinkmann & McKay 2007
