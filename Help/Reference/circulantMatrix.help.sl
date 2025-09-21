# circulantMatrix

- _circulantMatrix([x₁ x₂ …])_

Answer the circulant matrix of the sequence _x_,
a square matrix in which each row is rotated one element to the right relative to the preceding row.

```
>>> 4.iota.circulantMatrix
[
	4 1 2 3;
	3 4 1 2;
	2 3 4 1;
	1 2 3 4
]
```

* * *

See also: toeplitzMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CirculantMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Circulant_matrix)

Categories: Math, Matrix
