# edgeCount

- _edgeCount(aGraph | aGeometry)_

Answer the number of edges in a `Graph` or a geometric object.

At `Graph`:

```
>>> 5.completeGraph.edgeCount
10

>>> 5.cycleGraph.edgeCount
5

>>> 5.pathGraph.edgeCount
4
```

At `Line`,
the number of edges is one less than the number of vertices:

```
>>> let l = Line([0 0; 1 1; 2 0]);
>>> (l.vertexCount, l.edgeCount)
(3, 2)
```

At `Polygon`,
the number of edges is equal to the number of vertices:

```
>>> let p = 4.regularPolygon([0 0], 1, 0);
>>> (p.vertexCount, p.edgeCount)
(4, 4)
```

At `Polyhedron`, the number of edges is half of the sum of the face degrees:

```
>>> let p = [0 0 0].unitCube;
>>> (
>>> 	p.faceDegreeCounts,
>>> 	p.edgeCount
>>> )
([4 -> 6], 12)
```

* * *

See also: edgeList, Graph, Polygon, Polyhedron, vertexCount

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EdgeCount.html)
[2](https://reference.wolfram.com/language/ref/EdgeCount.html)

Categories: Collection
