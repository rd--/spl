# dot

- _dot(a, b)_

Answer products of vectors and matrices.
If both _a_ and _b_ are matrices, the number of columns in _a_ must be equal to the number of rows in _b_.

Scalar product of vectors in two dimensions:

```
>>> [1 1].dot([-1 1])
0

>>> [1 1].dot([-1; 1])
[0]

>>> [1 1].dot([2 3])
5
```

Vectors are perpendicular if their inner product is zero:

```
>>> [1 1].vectorAngle([-1 1], 'Unsigned')
1/2.pi
```

Scalar product of vectors in three dimensions:

```
>>> [3.2 4.2 5.2].dot([0.75 1.1 0.0625])
7.345

>>> [1 1 1].dot([-1 -1 1])
-1

>>> [1 -1 2].dot([0 1 1])
1

>>> [1 2 3].dot([4 5 6])
32

>>> [3 4 5].dot([4 3 5])
49
```

Dot product of exact vectors:

```
>>> (5 # [2]).dot(5 # [3])
30

>>> [1 2 3 4 5].dot([1 8 9 0 -1])
39

>>> [1 .. 5].dot([2 .. 6])
70
```

Dot allows complex inputs, but does not conjugate any of them:

```
>>> let u = [1 2J-1];
>>> let z = 7;
>>> let v = [z 3];
>>> u.dot(v)
(6J-3 + z)
```

Compute the `norm` of a vector using the Hermitian inner product:

```
>>> let h = { :a :b | a.conjugate.dot(b) };
>>> let u = [1 2J-1];
>>> (h(u, u).sqrt, u.norm)
(6.sqrt, 6.sqrt)
```

`dot` of a 1×4 row vector and a 4×1 column vector is a 1×1 scalar:

```
>>> let a = [1 1 0 0];
>>> let b = [1; 2; 3; 4];
>>> (a.dot(b), b.outerProduct(a).++)
(
	[3],
	[
		1 1 0 0;
		2 2 0 0;
		3 3 0 0;
		4 4 0 0
	]
)
```

`dot` of two 2×2 matrices is a 2×2 matrix:

```
>>> [1 0; 0 1].dot([4 1; 2 2])
[4 1; 2 2]
```

`dot` of 2×3 and a 3×3 matrices is a 2×3 matrix:

```
>>> let a = [1 3 5; 2 4 7];
>>> let b = [-5 8 11; 3 9 21; 4 0 8];
>>> (a.dot(b), [2 4 7].dot([11 21 8]))
(
	[
		24 35 114;
		30 52 162
	],
	162
)
```

A 2×3 matrix can be multiplied by a 2-vector only on the left:

```
>>> let v = [0.618678 0.213605];
>>> let m = [
>>> 	0.187902 0.498054 0.767621;
>>> 	0.226789 0.852257 0.819982
>>> ];
>>> v.dot(m)
[0.16469 0.49018 0.65006]
```

A 2×3 matrix can be multiplied by a 3-vector only on the right:

```
>>> let m = [
>>> 	0.187902 0.498054 0.767621;
>>> 	0.226789 0.852257 0.819982
>>> ];
>>> let v = [0.804978 0.587651 0.2951];
>>> m.dot(v)
[0.67046 0.92537]
```

Define a square matrix and a compatible vector.
The products m.v and v.m return different vectors.
The product v.m.v is a scalar.

```
>>> let m = [1 2; 3 4];
>>> let v = [5 6];
>>> (m.dot(v), v.dot(m), v.dot(m).dot(v))
([17 39], [23 34], 319)
```

Define a column and row matrices c and r with the same numerical entries as v.
Products involving m, c and r have the same entries as those involving m and v, but are all matrices.

```
>>> let m = [1 2; 3 4];
>>> let c = [5; 6];
>>> let r = [[5 6]];
>>> (r.dot(m), m.dot(c), r.dot(m).dot(c))
([[23, 34]], [17; 39], [[319]])
```

Define a matrix and two vectors.
Since _m.u_ is a vector, _m.u.v_ is an allowed product.
Note that it is effectively multiplying _v_ on the left side of the matrix, not the right.

```
>>> let m = [0.5 0.32; 0.19 0.73];
>>> let u = [1.5 0.27];
>>> let v = [-3.2 5.5];
>>> (
>>> 	m.dot(u).dot(v),
>>> 	v.dot(m).dot(u),
>>> 	u.dot(m).dot(v)
>>> )
(-0.02493, -0.02493, 1.15989)
```

Multiply real 3×3 matrices:

```
>>> let m = [
>>> 	1.2 3.2 5.2;
>>> 	2.2 4.2 -6.4;
>>> 	3.1 5.1 7.3
>>> ];
>>> let n = [
>>> 	4.2 6.3 8.2;
>>> 	2.5 -7.3 9.3;
>>> 	6.3 8.3 -1.10
>>> ];
>>> m.dot(n)
[
	 45.8   27.36  33.88;
	-20.58 -69.92  64.14;
	 71.76  42.89  64.82
]
```

Product of complex 3×3 matrices:

```
>>> let m = [
>>> 	1J1 2J0 3J-2;
>>> 	0J0 4J0 5J2;
>>> 	0J0 0J0 6J0
>>> ];
>>> let n = [
>>> 	6J1 4J0 5J-7;
>>> 	5J0 3J0 2J1;
>>> 	5J0 2J0 7J0
>>> ];
>>> m.dot(n)
[
	30J-3 16J0 37J-14;
	45J10 22J4 43J18;
	30J0  12J0 42J0
]
```

Product of exact 3×2 and 2×3 matrices:

```
>>> let m = [1 2; 3 4; 5 6];
>>> let n = [6 5 4; 3 2 1];
>>> (m.dot(n), n.dot(m))
(
	[
		12  9  6;
		30 23 16;
		48 37 26
	],
	[
		41 56;
		14 20
	]
)

>>> [4 3 8; 6 5 3].dot([5 4; 9 6; 4 2])
[79 50; 87 60]
```

Project the vector _(-1, 3)_ on the line spanned by the vector _(1, 1)_:

```
>>> let v = [-1 3];
>>> let l = [1 1];
>>> v.dot(l) / l.dot(l) * l
[1 1]
```

Project the vector _(-1, -4, -2)_ on the plane spanned by the vectors _(1, 1, -1)_ and _(1, 0, 1)_:

```
>>> let v = [1 2 0.5];
>>> let b1 = [2 4 -2];
>>> let b2 = [-3 3 0];
>>> let b3 = b2 - (b2.dot(b1) / b1.dot(b1) * b1);
>>> let p1 = v.dot(b1) / b1.dot(b1) * b1;
>>> let p2 = v.dot(b3) / b3.dot(b3) * b3;
>>> let p = p1 + p2;
>>> (b3, p, v - p)
(
	[-7/2 2 1/2],
	[13/22 35/22 -8/11],
	[9/22 9/22 27/22]
)
```

For a vector _v_ with real entries, _v.norm_ equals _(v.v).sqrt_:

```
>>> let r = Sfc32(839214);
>>> let v = r.randomReal([0 1], [3]);
>>> v.dot(v).sqrt
v.norm
```

Multiply 2×3 and 3×4 integer matrices:

```
>>> [
>>> 	2 1 4;
>>> 	0 1 1
>>> ].dot([
>>> 	6 3 -1 0;
>>> 	1 1 0 4;
>>> 	-2 5 0 2
>>> ])
[
	5 27 -2 12;
	-1 6 0 6
]
```

Multiply two 2×2 integer matrices:

```
>>> [1 2; 3 4].dot([1 0; 3 2])
[7 4; 15 8]
```

Multiply two 4×4 integer matrices:

```
>>> let a = [
>>> 	1 2 3 4;
>>> 	5 6 7 8;
>>> 	2 3 4 5;
>>> 	6 7 8 9
>>> ];
>>> let b = [
>>> 	6 7 8 9;
>>> 	5 6 7 8;
>>> 	2 3 4 5;
>>> 	1 2 3 4
>>> ];
>>> a.dot(b)
[
	26 36 46 56;
	82 108 134 160;
	40 54 68 82;
	96 126 156 186
]
```

Examine properties of a magic square,
the matrix-vector product sums the rows,
the vector-matrix product sums the columns,
also show the diagonal and antidiagonal sums and the matrix rank:

```
>>> let mu = 4 * (4 * 4 + 1) / 2;
>>> let m = [
>>> 	16 3 2 13;
>>> 	5 10 11 8;
>>> 	9 6 7 12;
>>> 	4 15 14 1
>>> ];
>>> let v = [1 1 1 1];
>>> (
>>> 	mu,
>>> 	m.dot(v),
>>> 	v.dot(m),
>>> 	m.diagonal.sum,
>>> 	m.antidiagonal.sum,
>>> 	m.matrixRank
>>> )
(34, [34 34 34 34], [34 34 34 34], 34, 34, 3)
```

The matrix product of a 4×3 and a 3×3 matrix is a 4×3 matrix:

```
>>> let a = [1 0 1; 2 1 1; 0 1 1; 1 1 2];
>>> let b = [1 2 1; 2 3 1; 4 2 2];
>>> a.dot(b)
[5 4 3; 8 9 5; 6 5 3; 11 9 6]
```

Evaluate symbolically:

```
>>> [`a` `b`; `c` `d`]
>>> .dot([`w` `x`; `y` `z`])
>>> .collect(printString:/1)
[
	'[(+ (* a w) (* b y)), (+ (* a x) (* b z))]',
	'[(+ (* c w) (* d y)), (+ (* c x) (* d z))]'
]
```

* * *

See also: +, *, dotProduct, inner, outer

Guides: List Functions, Vector Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.dot),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=VectorCalculus/DotProduct),
_Mathematica_
[1](https://mathworld.wolfram.com/DotProduct.html)
[2](https://mathworld.wolfram.com/MatrixMultiplication.html)
[3](https://reference.wolfram.com/language/ref/Dot.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/mtimes.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.dot.html),
_W_
[1](https://en.wikipedia.org/wiki/Matrix_multiplication)
[2](https://en.wikipedia.org/wiki/Dot_product)
[3](https://en.wikipedia.org/wiki/Inner_product_space)

Categories: Math
