# hilbertMatrix

- _hilbertMatrix([m n])_

Answer the _m×n_ Hilbert matrix with elements of the form _1 / (i + j - 1)_.

3×3 Hilbert matrix:

```
>>> [3 3].hilbertMatrix
[
	1/1 1/2 1/3;
	1/2 1/3 1/4;
	1/3 1/4 1/5
]
```

3×5 Hilbert matrix:

```
>>> [3 5].hilbertMatrix
[
	1/1 1/2 1/3 1/4 1/5;
	1/2 1/3 1/4 1/5 1/6;
	1/3 1/4 1/5 1/6 1/7
]
```

Plot of 23×23 Hilbert matrix:

~~~spl svg=A
[23 23].hilbertMatrix.deepCollect { :each |
	[each ^ 1/7, 0.75, 0.5]
	.hslToRgb
	.srgbEncode
}.arrayPlot
~~~

![](sw/spl/Help/Image/hilbertMatrix-A.svg)

* * *

See also: toeplitzMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HilbertMatrix.html)
[2](https://reference.wolfram.com/language/ref/HilbertMatrix.html),
_W_
[1](https://reference.wolfram.com/language/ref/HilbertMatrix.html)

Categories: Math, Matrix
