# householderMatrix

- _householderMatrix(v)_

Answer the Householder matrix for the real vector _v_.

```
>>> ([1 1] / 2.sqrt)
>>> .householderMatrix
[
	 0 -1;
	-1  0
]

>>> ([1 1 1] / 2.sqrt)
>>> .householderMatrix
[
	 1 -2 -2;
	-2  1 -2;
	-2 -2  1
] / 3

>>> ([1 1 1 1] / 2.sqrt)
>>> .householderMatrix
[
	 1 -1 -1 -1;
	-1  1 -1 -1;
	-1 -1  1 -1;
	-1 -1 -1  1
] / 2

>>> ([1 1 1 1 1] / 2.sqrt)
>>> .householderMatrix
[
	 3 -2 -2 -2 -2;
	-2  3 -2 -2 -2;
	-2 -2  3 -2 -2;
	-2 -2 -2  3 -2;
	-2 -2 -2 -2  3
] / 5

>>> ([1 1 1 1 1 1] / 2.sqrt)
>>> .householderMatrix
[
	 2 -1 -1 -1 -1 -1;
	-1  2 -1 -1 -1 -1;
	-1 -1  2 -1 -1 -1;
	-1 -1 -1  2 -1 -1;
	-1 -1 -1 -1  2 -1;
	-1 -1 -1 -1 -1  2
] / 3
```

* * *

See also: dot, identityMatrix, times

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HouseholderMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Householder_transformation)
