# wythoffIndex

- _wythoffIndex(n)_

Answer the _(row,column)_ index of the location of the positive integer _n_ in the infinite Wythoff array.
Every positive integer occurs exactly once in the array.

First few terms:

```
>>> 1:25.collect(wythoffIndex:/1)
[
	1 1; 1 2; 1 3; 2 1; 1 4; 3 1; 2 2; 1 5;
	4 1; 3 2; 2 3; 5 1; 1 6; 6 1; 4 2; 3 3;
	7 1; 2 4; 8 1; 5 2; 1 7; 9 1; 6 2; 4 3;
	10 1
]
```

The vertical para-Fibonacci sequence,
OEIS [A019586](https://oeis.org/A019586):

```
>>> 1:87.collect { :n |
>>> 	n.wythoffIndex[1] - 1
>>> }
[
	 0  0  0  1  0  2  1  0  3  2
	 1  4  0  5  3  2  6  1  7  4
	 0  8  5  3  9  2 10  6  1 11
	 7  4 12  0 13  8  5 14  3 15
	 9  2 16 10  6 17  1 18 11  7
	19  4 20 12  0 21 13  8 22  5
	23 14  3 24 15  9 25  2 26 16
	10 27  6 28 17  1 29 18 11 30
	 7 31 19  4 32 20 12
]
```

Plot first few terms:

~~~spl svg=A
1:200.collect { :n |
	n.wythoffIndex[1] - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffIndex-A.svg)

The horizontal para-Fibonacci sequence,
OEIS [A035614](https://oeis.org/A035614):

```
>>> 1:81.collect { :n |
>>> 	n.wythoffIndex[2] - 1
>>> }
[
	0 1 2 0 3 0 1 4 0 1
	2 0 5 0 1 2 0 3 0 1
	6 0 1 2 0 3 0 1 4 0
	1 2 0 7 0 1 2 0 3 0
	1 4 0 1 2 0 5 0 1 2
	0 3 0 1 8 0 1 2 0 3
	0 1 4 0 1 2 0 5 0 1
	2 0 3 0 1 6 0 1 2 0
	3
]
```

Plot first few terms:

~~~spl svg=B
1:200.collect { :n |
	n.wythoffIndex[2] - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/wythoffIndex-B.svg)

* * *

See also: fibonacci, wythoffArray, wythoffLower, wythoffPair, wythoffUpper

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WythoffArray.html),
_OEIS_
[1](https://oeis.org/A019586)
[2](https://oeis.org/A035614),
_W_
[1](https://en.wikipedia.org/wiki/Wythoff_array)

Categories: Matrix
