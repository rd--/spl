# diamondMatrix

- _diamondMatrix(radius)_

Answer a matrix whose elements are 1 in a diamond-shaped region that extends _r_ index positions to each side, and are 0 otherwise.

A _9×9_ diamond matrix:

```
>>> 4.diamondMatrix
[
	0 0 0 0 1 0 0 0 0;
	0 0 0 1 1 1 0 0 0;
	0 0 1 1 1 1 1 0 0;
	0 1 1 1 1 1 1 1 0;
	1 1 1 1 1 1 1 1 1;
	0 1 1 1 1 1 1 1 0;
	0 0 1 1 1 1 1 0 0;
	0 0 0 1 1 1 0 0 0;
	0 0 0 0 1 0 0 0 0
]
```

A _21×21_ diamond matrix:

```
>>> 10.diamondMatrix
[
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0;
	0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
	0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0;
	0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
	0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
	0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0;
	0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
	0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0;
	0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
	0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
]
```

Draw `diamondMatrix`:

~~~spl png=A
33.diamondMatrix.Bitmap
~~~

![](Help/Image/diamondMatrix-A.png)

The sum of a one diamond matrix and a three identity matrix,
two chair trominoes next to three monominoes:

~~~spl svg=B
(
	1.diamondMatrix + 3.identityMatrix
).matrixPlot
~~~

![](Help/Image/diamondMatrix-B.svg)

* * *

See also: boxMatrix, crossMatrix, diskMatrix, manhattanDistance

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiamondMatrix.html)

Categories: Math, Matrix
