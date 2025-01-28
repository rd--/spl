# Matrices and Arrays

## Array Creation

To create an array with four elements in a single row,
separate the elements with either a comma (,) or a space:

```
>>> [1 2 3 4]
[1 2 3 4]
```

This type of array is a row vector:

```
>>> [1 2 3 4].isVector
true
```

To create a matrix that has multiple rows, separate the rows with semicolons.

```
>>> [1 3 5; 2 4 6; 7 8 9]
[
	1 3 5;
	2 4 6;
	7 8 9
]
```

Another way to create a matrix is to use a function, such as `iota`, `zeros`, or `randomReal`.
Create a 5×1 column vector of zeros:

```
>>> [5 1].zeros
[0; 0; 0; 0; 0]
```

## Matrix and Array Operations

Process all of the values in a matrix using a single arithmetic operator:

```
>>> [3 3].iota + 10
[
	11 12 13;
	14 15 16;
	17 18 19
]
```

Process all of the values in a matrix using a single arithmetic function:

```
>>> [3 3].iota.sin
[
	 0.84147  0.90930  0.14112;
	-0.75680 -0.95892 -0.27942;
	 0.65699  0.98936  0.41212
]
```

Transpose a matrix:

```
>>> [3 3].iota.transposed
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

Standard matrix multiplication computes the inner products between rows and columns.
Confirm that a matrix `dot` its `inverse` returns the `identity` matrix:

```
>>> let m = [1 3 5; 2 4 6; 7 8 10];
>>> m.dot(m.inverse)
[
	1 0 0;
	0 1 0;
	0 0 1
]
```

Elementwise multiplication:

```
>>> let m = [1 3 5; 2 4 6; 7 8 10];
>>> m * m
[
	 1   9  25;
	 4  16  36;
	49  64 100
]
```

The matrix operators for multiplication, division, and power each have a corresponding array operator that operates element-wise.
For example, raise each element of an array to the third power:

```
>>> [3 3].iota ^ 3
[
	  1   8  27;
	 64 125 216;
	343 512 729
]
```

## Concatenation

Concatenation is the process of joining arrays to make larger ones.

Horizontal concatenation:

```
>>> let m = [3 3].iota;
>>> m ++.each m
[
	1 2 3 1 2 3;
	4 5 6 4 5 6;
	7 8 9 7 8 9
]
```

Vertical concatenation:

```
>>> let m = [3 3].iota;
>>> m ++ m
[
	1 2 3;
	4 5 6;
	7 8 9;
	1 2 3;
	4 5 6;
	7 8 9
]
```

* * *

See also: Array, List, Matrix

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/learn_matlab/matrices-and-arrays.html)
