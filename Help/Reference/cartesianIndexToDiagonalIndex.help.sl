# cartesianIndexToDiagonalIndex

- _cartesianIndexToDiagonalIndex(i, j)_

Answer the diagonal index for the matrix Cartesian index _(i,j)_.

Unlike `linearIndex` this function does not need to know the shape of the matrix,
and can index infinite matrices.

Calculate the first _n_ rows and _m_ columns of the infinite matrix counted by antidiagonals:

```
>>> cartesianIndexToDiagonalIndex:/2
>>> .table(1:11, 1:1).++
[
	 1  2  4  7 11 16 22 29;
	 3  5  8 12 17 23 30 38;
	 6  9 13 18 24 31 39 48;
	10 14 19 25 32 40 49 59;
	15 20 26 33 41 50 60 71;
	21 27 34 42 51 61 72 84;
	28 35 43 52 62 73 85 98
]
```

The first row gives the central polygonal numbers,
OEIS [A000124](https://oeis.org/A000124):

```
>>> 0:13.collect { :n |
>>> 	3.polygonalNumber(n) + 1
>>> }
[1 2 4 7 11 16 22 29 37 46 56 67 79 92]
```

The first column gives the triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

```
>>> 1:13.triangularNumber
[1 3 6 10 15 21 28 36 45 55 66 78 91]
```

The inverse is `diagonalIndexToCartesianIndex`:

* * *

See also: cartesianIndex, diagonalIndexToCartesianIndex, linearIndex

Guides: Indexing Functions, Matrix Functions

References:
_OEIS_
[1](https://oeis.org/A000124)
[2](https://oeis.org/A000217)

