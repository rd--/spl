# meanGraphDistance

- _meanGraphDistance(g)_

Answer the mean distance between all pairs of vertices in the graph _g_,
the off-diagonal mean of the graph distance matrix.

The mean graph distance of the seven star graph:

```
>>> 7.starGraph
>>> .meanGraphDistance
12/7
```

The mean graph distance of the _3,2_ grid graph:

```
>>> [3 2].gridGraph
>>> .meanGraphDistance
5/3
```

The mean graph distance of the _4,3_ knight’s graph:

```
>>> knightGraph(4, 3)
>>> .meanGraphDistance
83/33
```

The mean graph distance of the _(8,1:3)_ circulant graph:

```
>>> 8.circulantGraph([1 2 3])
>>> .meanGraphDistance
1.14286
```

The mean graph distance of is one if and only if the graph is a complete graph:

```
>>> 5.completeGraph
>>> .meanGraphDistance
1
```

* * *

See also: Graph, graphDistance, graphDistanceMatrix, offDiagonalMean

Guides: Distance Functions, Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MeanGraphDistance.html)
