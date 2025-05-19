# hankelMatrix

- _hankelMatrix(n)_
- _hankelMatrix([c₁ c₂ …])_
- _hankelMatrix([c₁ c₂ …], [r₁ r₂ …])_

Answer the Hankel matrix with first column _c_ and last row _r_.

Given first column only:

```
>>> [1 2 3 4].hankelMatrix
[
	1 2 3 4;
	2 3 4 0;
	3 4 0 0;
	4 0 0 0
]
```

Given first column and last row:

```
>>> [1 2 3].hankelMatrix([3 4 5 6])
[
	1 2 3 4;
	2 3 4 5;
	3 4 5 6
]
```

Given column size:

```
>>> 3.hankelMatrix
[
	1 2 3;
	2 3 0;
	3 0 0
]
```

Plot 9×9 Hankel matrix:

~~~spl svg=A
9.hankelMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/hankelMatrix-A.svg)

* * *

See also: hilbertMatrix, padRight, table, toeplitzMatrix, vandermondeMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HankelMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Hankel_matrix)
