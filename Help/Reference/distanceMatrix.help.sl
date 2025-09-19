# distanceMatrix

- _distanceMatrix(u, v, f:/2)_
- _distanceMatrix(u, v)_
- _distanceMatrix(u)_

Answer the matrix of distances between each pair of elements in the vectors _u_ and _v_.
In the unary and binary cases the distance function is `euclideanDistance`,
in the unary case _v_ is set to _u_.

Compute a distance matrix from a list of integers:

```
>>> [1 2 3 4].distanceMatrix
[
	0 1 2 3;
	1 0 1 2;
	2 1 0 1;
	3 2 1 0
]
```

Compute a distance matrix from two lists of integers:

```
>>> [1 2 3 4].distanceMatrix([5 6 7])
[
	4 5 6;
	3 4 5;
	2 3 4;
	1 2 3
]

>>> [60 64 67].distanceMatrix([62 65 69])
[
	2 5 9;
	2 1 5;
	5 2 2
]
```

Compute a distance matrix from real-valued numerical vectors:

```
>>> let u = [1.5 4.3; 2.1 5.6; 6.2 4.5];
>>> let v = [1.6 4.2; 2.3 5.4];
>>> u.distanceMatrix(v)
[
	0.141421 1.360147;
	1.486607 0.282843;
	4.609772 4.002499
]
```

Compute a distance matrix from strings:

```
>>> let u = ['abcd' 'bcde' 'xyz'];
>>> u.distanceMatrix(u, editDistance:/2)
[
	0 2 4;
	2 0 4;
	4 4 0
]
```

Distance matrix of cartesian coordinates for lattice using `manhattanDistance` measure:

```
>>> let x = [
>>> 	1 1; 2 1; 3 1; 4 1;
>>> 	1 2; 2 2; 3 2; 4 2
>>> ];
>>> x.distanceMatrix(
>>> 	x,
>>> 	manhattanDistance:/2
>>> )
[
	0 1 2 3 1 2 3 4;
	1 0 1 2 2 1 2 3;
	2 1 0 1 3 2 1 2;
	3 2 1 0 4 3 2 1;
	1 2 3 4 0 1 2 3;
	2 1 2 3 1 0 1 2;
	3 2 1 2 2 1 0 1;
	4 3 2 1 3 2 1 0
]
```

Distance matrix of two 2×2 matrices:

```
>>> [0 0; 0 1].distanceMatrix([1 0; 1 1])
[1 1.41421; 1.41421 1]
```

Distance matrix of a 3×2 matrix:

```
>>> [
>>> 	0.8444 0.2589;
>>> 	0.7580 0.5113;
>>> 	0.4206 0.4049
>>> ].distanceMatrix
[
	0        0.26678  0.44824;
	0.26678  0        0.35378;
	0.44824  0.35378  0
]
```

Recurrence plot of a trigonometric operation:

~~~spl svg=A
let m = { :x :y |
	x.sin * y.cos
}.table([-10 .. 10], [-10 .. 10]);
(m.distanceMatrix < 1)
.boole
.matrixPlot
~~~

![](sw/spl/Help/Image/distanceMatrix-A.svg)

Cross-recurrence plot of two trigonometric functions:

~~~spl png=B
let x = (0 -- 25).discretize(100);
(x.sin.distanceMatrix(x.tan) < 0.2)
.boole
.Bitmap
~~~

![](sw/spl/Help/Image/distanceMatrix-B.png)

Plot 6×6 distance matrix:

~~~spl svg=C
let v = [2 6; 0 1; 0 0; 3 1; 3 0; 5 0.5];
let m = v.distanceMatrix;
(1 - m.rescale).matrixPlot
~~~

![](sw/spl/Help/Image/distanceMatrix-C.svg)

* * *

See also: adjacencyMatrix, condensedDistanceMatrix, graphDistanceMatrix, norm, outer, pairwiseDistances, recurrenceMatrix

Guides: Matrix Functions, Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DistanceMatrix.html),
_Matlab_
[1](https://mathworks.com/help/stats/pdist.html)
[2](https://mathworks.com/help/stats/pdist2.html),
_W_
[1](https://en.wikipedia.org/wiki/Distance_matrix)

Categories: Math, Matrix
