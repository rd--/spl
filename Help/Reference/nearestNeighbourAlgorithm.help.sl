# nearestNeighbourAlgorithm

- _nearestNeighbourAlgorithm([v₁, v₂, …], k)_

Starting at vertex _k_ visit each vertex in nearest neighbour sequence.

Nearest neighour tour of six vertices:

```
>>> [2 2; 5 2; 5 3; 4 5; 4 4; 3 2]
>>> .nearestNeighbourAlgorithm(1)
[1 6 2 3 5 4]
```

Plot nearest neighbour tour:

~~~spl svg=A
let p = [
	1 1; 1 2; 1 3; 1 4; 1 5;
	2 1; 2 3; 2 5; 3 1; 3 2;
	3 4; 3 5; 4 1; 4 3; 4 5;
	5 1; 5 2; 5 3; 5 4
];
let t = p.nearestNeighbourAlgorithm(1);
let c = p @* t;
[
	p.PointCloud,
	c.Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/nearestNeighbourAlgorithm-A.svg)

Nearest neighbour tour of randomly generated coordinates:

~~~spl svg=B
let r = Sfc32(323193);
let p = r.randomReal([-1 1], [17 2]);
let i = p.nearestNeighbourAlgorithm(1);
[
	p.PointCloud,
	(p @* i).Polygon
].LineDrawing
~~~

![](sw/spl/Help/Image/nearestNeighbourAlgorithm-B.svg)

* * *

See also: findShortestTour, nearest

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Nearest_neighbour_algorithm)
