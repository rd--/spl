# planarRegularGraphCatalogue

- _planarRegularGraphCatalogue(aSystem)_

A catalogue of Tutte drawings of planar graphs.
Answers a `List` of `PolygonMesh` values keyed by name.

Count entries:

```
>>> system
>>> .planarRegularGraphCatalogue
>>> .size
650
```

Draw the seventh graph in the set _5reg\_22-35_,
the set of five regular graphs of 22 vertices and 35 faces:

~~~spl svg=A
system
.planarRegularGraphCatalogue
.at('5reg_22-35.6')
~~~

![](sw/spl/Help/Image/planarRegularGraphCatalogue-A.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: planarConvexPolytopeGraphCatalogue, planarNonHamiltonianGraphCatalogue, planarQuadrangulationsCatalogue, PolygonMesh

Further Reading: Brinkmann & McKay 2007
