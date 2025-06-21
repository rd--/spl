# warpingDistance

- _warpingDistance(x, y, w=∞)_

Answer the dynamic time warping distance between sequences _x_ and _y_,
uses a window specified by _w_ for local search.

Find the time warping distance between two sequences of values:

```
>>> let x = [11 12 13 14 15];
>>> let y = [12 13];
>>> x.warpingDistance(y)
4
```

Find the time warping distance between two real-valued vectors:

```
>>> let x = [
>>> 	1.pi,
>>> 	-1.e,
>>> 	1.e + 1.pi,
>>> 	0 - 1.eulerGamma
>>> ];
>>> let y = [
>>> 	1.goldenRatio,
>>> 	-1.e * 1.pi,
>>> 	1.e ^ 1.pi,
>>> 	0 - (1.pi ^ 1.e)
>>> ];
>>> x.warpingDistance(y)
46.5078
```

Find the time warping distance between two sequences of two-dimensional coordinates:

```
>>> let x = [11 12; 13 14; 15 16];
>>> let y = [12 13; 14 15];
>>> x.warpingDistance(y)
4.24264
```

Specify a radius for the search window:

```
>>> let x = [1 2 3 4 5 6 7 8 9 10 11 12 13];
>>> let y = [1 1 1 1 1 1 2 3 4 5 5 5 6 7];
>>> [1 2 3 Infinity].collect { :w |
>>> 	x.warpingDistance(y, w)
>>> }
[43 37 31 21]
```

The two sequences need not have the same length:

```
>>> [1 .. 5].warpingDistance([1 .. 3])
3
```

The distance between two equal sequences is always 0:

```
>>> [1 .. 9].warpingDistance([1 .. 9])
0
```

Compare two sequences using different distance functions:

```
>>> let x = [
>>> 	71 73 75 80 80 80 78 76 75 73
>>> 	71 71 71 73 75 76
>>> ];
>>> let y = [
>>> 	69 69 73 75 79 80 79 78 76 73
>>> 	72 71 70 70
>>> ];
>>> (
>>> 	x.warpingDistance(y),
>>> 	x.warpingDistance(
>>> 		y, Infinity, binaryDistance:/2
>>> 	)
>>> )
(21, 9)
```

Dynamic time warping is not translation invariant:

```
>>> let x = [
>>> 	0 0 1 1 1 2 2 3 3 4
>>> 	4 5 6
>>> ];
>>> let y = [
>>> 	1 2 3 3 3 3 4 4 4 4
>>> 	5 5 5 5 6 6 7
>>> ];
>>> (
>>> 	x.warpingDistance(y),
>>> 	x.warpingDistance(y - 1)
>>> )
(3, 0)
```

* * *

See also: euclideanDistance, levenshteinDistance, warpingCorrespondence, warpingMatrices, warpingPlot

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WarpingDistance.html)
_W_
[1](https://en.wikipedia.org/wiki/Dynamic_time_warping)
