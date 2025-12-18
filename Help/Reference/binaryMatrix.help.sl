# binaryMatrix

- _binaryMatrix(o, ⍴)_

Answer a matrix of shape _⍴_ with ones specified by _o_,
which may be either `List` of lists of integers,
or a `Map`.
If ⍴ is elided it is inferred from _o_.

The 3×3 identity matrix,
there is a one in the first column or the first row,
the second column of the second row,
and the third column of the third row:

```
>>> [1; 2; 3].binaryMatrix
[
	1 0 0;
	0 1 0;
	0 0 1
]
```

The corresponding antidiagonal:

```
>>> [3; 2; 1].binaryMatrix
[
	0 0 1;
	0 1 0;
	1 0 0
]
```

A 3×3 matrix with no entries in the third column or second row:

```
>>> [2; ; 2].binaryMatrix([3 3])
[
	0 1 0;
	0 0 0;
	0 1 0
]
```

A similar matrix specified using a `Map`:

```
>>> [2: [2], 4: [2]].binaryMatrix([5 3])
[
	0 0 0;
	0 1 0;
	0 0 0;
	0 1 0;
	0 0 0
]
```

Matrix indicating where _i_ divides _j_ evenly, with no remainder:

```
>>> [1 2 3 4; 2 4; 3; 4]
>>> .binaryMatrix
[
	1 1 1 1;
	0 1 0 1;
	0 0 1 0;
	0 0 0 1
]
```

Plot binary matrix:

~~~spl svg=A
[
	1 5 6 7;
	2 5 6 8;
	3 5 7 8;
	4 6 7 8;
	1 5;
	2 6;
	3 7;
	4 8
].binaryMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/binaryMatrix-A.svg)

* * *

See also: zeroMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/01-Matrix.html)
_W_
[1](https://en.wikipedia.org/wiki/Logical_matrix)
