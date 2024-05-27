# matrixRotate

- _matrixRotate(aMatrix, k)_

Rotate _aMatrix_ counter-clockwise by 90° _k_ times.

The three rotations of a 3×3 matrix:

```
>>> let m = [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ];
>>> (1, 2, 3).collect { :k | m.matrixRotate(k) }
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

Create a 17-by-17 diagonally dominant singular matrix A and view the pattern of nonzero elements.

```
>>> let a = [36 54 24 46 64 78 88 94 96 94 88 78 64 46 24 54 36].diagonalMatrix;
>>> let s = [-27 -12 -13 -24 -33 -40 -45 -48 -49 -48 -45 -40 -33 -12 -27 -36].diagonalMatrix(1);
>>> a + s + s.matrixRotate(2)
[
	 36 -27   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0;
	-36  54 -12   0   0   0   0   0   0   0   0   0   0   0   0   0   0;
	  0 -27  24 -13   0   0   0   0   0   0   0   0   0   0   0   0   0;
	  0   0 -12  46 -24   0   0   0   0   0   0   0   0   0   0   0   0;
	  0   0   0 -33  64 -33   0   0   0   0   0   0   0   0   0   0   0;
	  0   0   0   0 -40  78 -40   0   0   0   0   0   0   0   0   0   0;
	  0   0   0   0   0 -45  88 -45   0   0   0   0   0   0   0   0   0;
	  0   0   0   0   0   0 -48  94 -48   0   0   0   0   0   0   0   0;
	  0   0   0   0   0   0   0 -49  96 -49   0   0   0   0   0   0   0;
	  0   0   0   0   0   0   0   0 -48  94 -48   0   0   0   0   0   0;
	  0   0   0   0   0   0   0   0   0 -45  88 -45   0   0   0   0   0;
	  0   0   0   0   0   0   0   0   0   0 -40  78 -40   0   0   0   0;
	  0   0   0   0   0   0   0   0   0   0   0 -33  64 -33   0   0   0;
	  0   0   0   0   0   0   0   0   0   0   0   0 -24  46 -12   0   0;
	  0   0   0   0   0   0   0   0   0   0   0   0   0 -13  24 -27   0;
	  0   0   0   0   0   0   0   0   0   0   0   0   0   0 -12  54 -36;
	  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 -27  36
]
```

The counter clockwise rotation and the two further rotations given in terms of `reversed` and `transposed`:

```
>>> let m = [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ];
>>> (
>>> 	m.collect(reversed:/1).transposed,
>>> 	m.collect(reversed:/1).reversed,
>>> 	m.transposed.collect(reversed:/1)
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

See also: Matrix, reversed, transposed

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rot90.html)
