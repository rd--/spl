# cauchyMatrix

- _cauchyMatrix(x, y)_

Answer the Cauchy matrix given by the generating vectors _x_ and _y_.

Construct a Cauchy matrix:

```
>>> [1 2 3].cauchyMatrix([1 5 6])
[
	1/2 1/6 1/7;
	1/3 1/7 1/8;
	1/4 1/8 1/9
]

>>> [1 2 3].cauchyMatrix([3 4 5])
[
	1/4 1/5 1/6;
	1/5 1/6 1/7;
	1/6 1/7 1/8
]
```

Generate a rectangular Cauchy matrix:

```
>>> [1 2 3 4 5].cauchyMatrix([1 2 3])
[
	1/2 1/3 1/4;
	1/3 1/4 1/5;
	1/4 1/5 1/6;
	1/5 1/6 1/7;
	1/6 1/7 1/8
]
```

* * *

See also: hilbertMatrix, toeplitzMatrix, vandermondeMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CauchyMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Cauchy_matrix)
