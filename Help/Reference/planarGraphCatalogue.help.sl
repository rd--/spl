# planarGraphCatalogue

- _planarGraphCatalogue(aSystem)_

A catalogue of Tutte drawings of planar graphs.
Answers a `List` of `PolygonMesh` values keyed by name.

Count entries:

```
>>> system
>>> .planarGraphCatalogue
>>> .size
5005
```

Draw the entry for the 234th graph in the set _convexpolytopes\_8_,
the set of convex polytopes of eight vertices:

~~~spl svg=A
system
.planarGraphCatalogue
.at('convexpolytopes_8.233')
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-A.svg)

Draw the entry for the 9th cyclically 4-connected non-Hamiltonian graph of 46 vertices:

~~~spl svg=B
system
.planarGraphCatalogue
.at('nonham46c4.8')
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-B.svg)

Draw the entry for the 138th graph in the set _quadrangulations\_17_,
the set of quadrangulations of seventeen vertices:

~~~spl svg=C
system
.planarGraphCatalogue
.at('quadrangulations_17.137')
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-C.svg)

Draw the 471st graph in the set _5reg\_26-41_,
the set of five regular graphs of 26 vertices and 41 faces:

~~~spl svg=D
system
.planarGraphCatalogue
.at('5reg_26-41.470')
~~~

![](sw/spl/Help/Image/planarGraphCatalogue-D.svg)

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: planarConvexPolytopeGraphCatalogue, planarNonHamiltonianGraphCatalogue, planarQuadrangulationsCatalogue, planarRegularGraphCatalogue, PolygonMesh

Further Reading: Brinkmann & McKay 2007
