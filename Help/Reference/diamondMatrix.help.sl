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

![](sw/spl/Help/Image/diamondMatrix-A.png)

* * *

See also: boxMatrix, crossMatrix, diskMatrix, manhattanDistance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DiamondMatrix.html)

Categories: Math, Matrix
