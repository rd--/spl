# evoluteSpiralMatrix

- _evoluteSpiralMatrix(n)_

Answer an _n×n_ matrix of the first _n²_ integers arranged in a counter-clockwise evolute spiral at first rightwards.

The 5×5 evolute spiral:

```
>>> 5.evoluteSpiralMatrix
[
	17 16 15 14 13;
	18  5  4  3 12;
	19  6  1  2 11;
	20  7  8  9 10;
	21 22 23 24 25
]
```

Transposed to give a counter-clockwise evolute at first descending:

```
>>> 5.evoluteSpiralMatrix.transpose
[
	17 18 19 20 21;
	16  5  6  7 22;
	15  4  1  8 23;
	14  3  2  9 24;
	13 12 11 10 25
]
```

Clockwise involute starting at lower right:

```
>>> (5 ^ 2 + 1) - 5.evoluteSpiralMatrix
[
	9 10 11 12 13;
	8 21 22 23 14;
	7 20 25 24 15;
	6 19 18 17 16;
	5  4  3  2  1
]
```

Counter-clockwise involute starting at lower right:

```
>>> (5 ^ 2 + 1)
>>> -
>>> 5.evoluteSpiralMatrix.transpose
[
	 9  8  7  6  5;
	10 21 20 19  4;
	11 22 25 18  3;
	12 23 24 17  2;
	13 14 15 16  1
]
```

The 7×7 evolute spiral:

```
>>> 7.evoluteSpiralMatrix
[
	37 36 35 34 33 32 31;
	38 17 16 15 14 13 30;
	39 18  5  4  3 12 29;
	40 19  6  1  2 11 28;
	41 20  7  8  9 10 27;
	42 21 22 23 24 25 26;
	43 44 45 46 47 48 49
]
```

Plot matrix:

~~~spl svg=A
13.evoluteSpiralMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/evoluteSpiralMatrix-A.svg)

Small Ulam spiral:

~~~spl svg=B
25.evoluteSpiralMatrix
.transpose.isPrime.boole.matrixPlot
~~~

![](sw/spl/Help/Image/evoluteSpiralMatrix-B.svg)

* * *

See also: spiralMatrix

Guides: Geometry Functions, Matrix Functions
