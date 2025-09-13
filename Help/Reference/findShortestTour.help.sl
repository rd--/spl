# findShortestTour

- _findShortestTour([v₁, v₂, …])_

Answer an ordering of the vertices _v_
that minimizes the total distance on a tour
that visits all vertices once.

Find the length and ordering of the shortest tour through points in the plane:

```
>>> [2 2; 5 2; 5 3; 4 5; 4 4; 3 2]
>>> .findShortestTour
[
	5 + 2.sqrt + 13.sqrt,
	[1 6 2 3 5 4 1]
]
```

Find and draw shortest tour:

~~~spl svg=A
let p = [
	1 1; 1 2; 1 3; 1 4; 1 5;
	2 1; 2 3; 2 5; 3 1; 3 2;
	3 4; 3 5; 4 1; 4 3; 4 5;
	5 1; 5 2; 5 3; 5 4
];
let [_, t] = p.findShortestTour;
let c = p @* t;
[
	p.PointCloud,
	c.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/findShortestTour-A.svg)

Calculate shortest tour:

```
>>> [
>>> 	1 1; 1 2; 1 3; 1 4; 1 5;
>>> 	2 1; 2 3; 2 5; 3 1; 3 2;
>>> 	3 4; 3 5; 4 1; 4 3; 4 5;
>>> 	5 1; 5 2; 5 3; 5 4
>>> ].findShortestTour
[
	14 + (5 * 2.sqrt),
	[
		01 06 09 13 16
		17 18 19 14 10
		07 11 15 12 08
		05 04 03 02 01
	]
]
```

Shortest tour of randomly generated coordinates:

~~~spl svg=B
let r = Sfc32(323193);
let p = r.randomReal([-1 1], [17 2]);
let [_, i] = p.findShortestTour;
[
	p.PointCloud,
	(p @* i).Line
].LineDrawing
~~~

![](sw/spl/Help/Image/findShortestTour-B.svg)

* * *

See also: findShortestPath, heldKarpAlgorithm, nearest, nearestNeighbourAlgorithm

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindShortestTour.html)
