# spiralMatrix

- _spiralMatrix(n)_

Answer an _n×n_ matrix of the first _n²_ integers arranged in a counter-clockwise involute spiral starting at upper left at first descending.

The 5×5 involute spiral matrix:

```
>>> 5.spiralMatrix
[
	1 16 15 14 13;
	2 17 24 23 12;
	3 18 25 22 11;
	4 19 20 21 10;
	5  6  7  8  9
]
```

Transposed to give a clockwise involute starting at upper left:

```
>>> 5.spiralMatrix.transpose
[
	 1  2  3  4  5;
	16 17 18 19  6;
	15 24 25 20  7;
	14 23 22 21  8;
	13 12 11 10  9
]
```

Clockwise evolute at first ascending:

```
>>> (5 ^ 2 + 1) - 5.spiralMatrix
[
	25 10 11 12 13;
	24  9  2  3 14;
	23  8  1  4 15;
	22  7  6  5 16;
	21 20 19 18 17
]
```

Counter-clockwise evolute at first leftwards:

```
>>> (5 ^ 2 + 1)
>>> -
>>> 5.spiralMatrix.transpose
[
	25 24 23 22 21;
	10  9  8  7 20;
	11  2  1  6 19;
	12  3  4  5 18;
	13 14 15 16 17
]
```

Small Ulam spiral:

~~~spl svg=A
let k = 25;
let m = (k ^ 2 + 1) - k.spiralMatrix;
m.transpose.isPrime.boole.matrixPlot
~~~

![](sw/spl/Help/Image/spiralMatrix-A.svg)

Less small Ulam spiral

~~~spl png=B
let k = 300;
let m = (k ^ 2 + 1) - k.spiralMatrix;
m.transpose.isPrime.boole.Bitmap
~~~

![](sw/spl/Help/Image/spiralMatrix-B.png)

Plot matrix:

~~~spl svg=C
13.spiralMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/spiralMatrix-C.svg)

* * *

See also: crossMatrix, isPrime, spirangle, evoluteSpiralMatrix

Guides: Geometry Functions, Matrix Functions

References:
_J_
[1](https://www.jsoftware.com/papers/play132.htm),
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Ulam_spiral)
