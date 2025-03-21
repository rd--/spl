# matrixInterpolation

- _matrixInterpolation(aMatrix, aBlock:/6)_

Answer a `Block` that will interpolate into _aMatrix_ using the interpolation function defined at _aBlock_.

Resample a 3×3 matrix to a 6×6 matrix:

```
>>> let i = (1 -- 3).discretize(6);
>>> [1 2 3; 2 3 4; 3 4 5]
>>> .matrixInterpolation(
>>> 	bilinearInterpolation:/6
>>> )
>>> .table(i, i)
[
	1.0 1.4 1.8 2.2 2.6 3.0;
	1.4 1.8 2.2 2.6 3.0 3.4;
	1.8 2.2 2.6 3.0 3.4 3.8;
	2.2 2.6 3.0 3.4 3.8 4.2;
	2.6 3.0 3.4 3.8 4.2 4.6;
	3.0 3.4 3.8 4.2 4.6 5.0
]
```

Resample a 2×3 matrix to a 4×7 matrix:

```
>>> let i = (1 -- 2).discretize(4);
>>> let j = (1 -- 3).discretize(7);
>>> [1 2 3; 4 5 6]
>>> .matrixInterpolation(
>>> 	bilinearInterpolation:/6
>>> )
>>> .table(i, j)
[3:9, 6:12, 9:15, 12:18] / 3
```

Resample a 2×2 matrix to a 24×24 matrix and plot:

~~~spl svg=A
let i = (1 -- 2).subdivide(23);
[1 0.5; 0 1]
.matrixInterpolation(
	bilinearInterpolation:/6
)
.table(i, i)
.deepCollect { :each |
	[each, 0.6, 0.75].hsvToRgb
}
.arrayPlot
~~~

![](sw/spl/Help/Image/matrixInterpolation-A.svg)

* * *

See also: bilinearInterpolation, listInterpolation

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayResample.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/interp2.html)
