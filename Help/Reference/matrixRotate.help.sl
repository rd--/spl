# matrixRotate

- _matrixRotate(m, k)_

Rotate the matrix _m_ counter-clockwise by 90° _k_ times.

The three rotations of a 3×3 matrix:

```
>>> let m = [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ];
>>> [1 2 3].collect { :k |
>>> 	m.matrixRotate(k)
>>> }
[
	3 6 9;
	2 5 8;
	1 4 7
	:;
	9 8 7;
	6 5 4;
	3 2 1
	:;
	7 4 1;
	8 5 2;
	9 6 3
]
```

Create a 17-by-17 diagonally dominant singular matrix A and view the pattern of nonzero elements.

```
>>> let a = [
>>> 	36 54 24 46 64 78 88 94 96 94
>>> 	88 78 64 46 24 54 36
>>> ].diagonalMatrix;
>>> let s = [
>>> 	-27 -12 -13 -24 -33 -40 -45 -48 -49 -48
>>> 	-45 -40 -33 -12 -27 -36
>>> ].diagonalMatrix(1);
>>> let m = a + s + s.matrixRotate(2);
>>> m.collect { :each |
>>> 	each.select { :item |
>>> 		item != 0
>>> 	}
>>> }
[
	 36 -27;
	-36  54 -12;
	-27  24 -13;
	-12  46 -24;
	-33  64 -33;
	-40  78 -40;
	-45  88 -45;
	-48  94 -48;
	-49  96 -49;
	-48  94 -48;
	-45  88 -45;
	-40  78 -40;
	-33  64 -33;
	-24  46 -12;
	-13  24 -27;
	-12  54 -36;
	-27  36
]
```

The counter clockwise rotation and the two further rotations given in terms of `reverse` and `transpose`:

```
>>> let m = [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ];
>>> (
>>> 	m.collect(reverse:/1).transpose,
>>> 	m.collect(reverse:/1).reverse,
>>> 	m.transpose.collect(reverse:/1)
>>> )
(
	[
		3 6 9;
		2 5 8;
		1 4 7
	],
	[
		9 8 7;
		6 5 4;
		3 2 1
	],
	[
		7 4 1;
		8 5 2;
		9 6 3
	]
)
```

* * *

See also: Matrix, reverse, transpose

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rot90.html)

Categories: Math, Matrix
