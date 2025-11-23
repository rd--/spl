# stolarskyIndex

- _stolarskyIndex(n)_

Answer the _(row,column)_ index of the location of the positive integer _n_ in the infinite Stolarsky array.
Every positive integer occurs exactly once in the array.

First few terms:

```
>>> 1:25.collect(stolarskyIndex:/1)
[
	1 1; 1 2; 1 3; 2 1; 1 4; 2 2; 3 1; 1 5;
	4 1; 2 3; 3 2; 5 1; 1 6; 6 1; 4 2; 2 4;
	7 1; 3 3; 5 2; 8 1; 1 7; 9 1; 6 2; 4 3;
	10 1
]
```

The row index of _n_ in the Stolarsky array,
OEIS [A098861](https://oeis.org/A098861):

```
>>> 1:55.collect { :n |
>>> 	n.stolarskyIndex[1] - 1
>>> }
[
	 0  0  0  1  0  1  2  0  3  1
	 2  4  0  5  3  1  6  2  4  7
	 0  8  5  3  9  1 10  6  2 11
	 4  7 12  0 13  8  5 14  3  9
	15  1 16 10  6 17  2 18 11  4
	19  7 12 20  0
]
```

Plot first few terms:

~~~spl svg=A
1:65.collect { :n |
	n.stolarskyIndex[1] - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/stolarskyIndex-A.svg)

The column index of _n_ in the Stolarsky array,
OEIS [A098862](https://oeis.org/A098862):

```
>>> 1:55.collect { :n |
>>> 	n.stolarskyIndex[2] - 1
>>> }
[
	0 1 2 0 3 1 0 4 0 2
	1 0 5 0 1 3 0 2 1 0
	6 0 1 2 0 4 0 1 3 0
	2 1 0 7 0 1 2 0 3 1
	0 5 0 1 2 0 4 0 1 3
	0 2 1 0 8
]
```

Plot first few terms:

~~~spl svg=B
1:55.collect { :n |
	n.stolarskyIndex[2] - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/stolarskyIndex-B.svg)

* * *

See also: fibonacci, stolarskyArray, stolarskyLower, stolarskyPair, stolarskyUpper

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StolarskyArray.html),
_OEIS_
[1](https://oeis.org/A098861)
[2](https://oeis.org/A098862),
_W_
[1](https://en.wikipedia.org/wiki/Stolarsky_array)

Categories: Matrix
