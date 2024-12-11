# crossMatrix

- _crossMatrix(radius)_

Answer a matrix whose elements are 1 in a cross-shaped region that extends _r_ index positions to each side, and are 0 otherwise.

A _15×15_ cross matrix:

```
>>> 7.crossMatrix
[
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
]
```

A _21×21_ cross matrix:

```
>>> 10.crossMatrix
[
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
	0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
]
```

Draw `crossMatrix`:

~~~spl png=A
33.crossMatrix.Bitmap
~~~

![](sw/spl/Help/Image/crossMatrix-A.png)

* * *

See also: boxMatrix, diamondMatrix, diskMatrix, editDistance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CrossMatrix.html)

Categories: Math, Matrix
