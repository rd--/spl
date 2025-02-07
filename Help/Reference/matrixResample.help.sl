# matrixResample

- _matrixResample(aMatrix, shape)_

Answer a matrix that is the bilinear resampling of _aMatrix_ to have the specified _shape_.

Resample a 3×3 matrix to a 6×6 matrix:

```
>>> [
>>> 	1 2 3;
>>> 	2 3 4;
>>> 	3 4 5
>>> ].matrixResample([6 6])
[
	1.0 1.4 1.8 2.2 2.6 3.0;
	1.4 1.8 2.2 2.6 3.0 3.4;
	1.8 2.2 2.6 3.0 3.4 3.8;
	2.2 2.6 3.0 3.4 3.8 4.2;
	2.6 3.0 3.4 3.8 4.2 4.6;
	3.0 3.4 3.8 4.2 4.6 5.0
]
```

The answer matrix need to have the same proportions as the initial matrix.
Resample a 2×3 matrix to a 4×7 matrix:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6
>>> ].matrixResample([4 7])
[3:9, 6:12, 9:15, 12:18] / 3
```

Resample a 2×2 matrix to a 5×5 matrix and draw image:

~~~spl svg=A
[1 0.5; 0 1]
.matrixResample([5 5])
.deepCollect { :each |
	[each, 0.65, 0.75].hsvToRgb
}.arrayPlot
~~~

![](sw/spl/Help/Image/matrixResample-A.svg)

Resample a 2×2 matrix to a 100×100 matrix and draw image:

~~~spl png=B
[1 0.5; 0 1]
.matrixResample([100 100])
.deepCollect { :each |
	[each, 0.65, 0.75].hsvToRgb
}
.Image
~~~

![](sw/spl/Help/Image/matrixResample-B.png)

* * *

See also: bilinearInterpolation, matrixInterpolation, resample

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayResample.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/interp2.html)
