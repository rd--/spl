# diagonalIndexToCartesianIndex

- _diagonalIndexToCartesianIndex(n)_

Answer the matrix Cartesian index _(i,j)_ given the diagonal index _n_.

Unlike `cartesianIndex` this function does not need to know the shape of the matrix,
and can index infinite matrices.

Indices of initial 3×4 matrix:

```
>>> [
>>> 	1  2  4  7;
>>> 	3  5  8 12;
>>> 	6  9 13 18
>>> ].diagonalIndexToCartesianIndex
[
	1 1; 1 2; 1 3; 1 4:;
	2 1; 2 2; 2 3; 2 4:;
	3 1; 3 2; 3 3; 3 4
]
```

The inverse is `cartesianIndexToDiagonalIndex`.

* * *

See also: cartesianIndex, cartesianIndexToDiagonalIndex, linearIndex

Guides: Indexing Functions, Matrix Functions
