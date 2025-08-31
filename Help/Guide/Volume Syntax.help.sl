# Volume Syntax

Rewrite rule:

- _[p q; r s:; a b; c d:; ...]_\
  ⟹\
  _[[[p, q], [r, s]], [[a, b], [c, d]], ...]_

Allows writing _volumes_, three-dimensional arrays, as _matrices_ separated by `:;` tokens.

A _2×2×2_ array of integer literals:

```
>>> [
>>> 	1 2;
>>> 	3 4
>>> 	:;
>>> 	5 6;
>>> 	7 8
>>> ]
[[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
```

A _2×2×2_ array, items are let bound variables:

```
>>> let a = 1;
>>> let b = 3;
>>> [
>>> 	a b;
>>> 	b a
>>> 	:;
>>> 	b a;
>>> 	a b
>>> ]
[[[1, 3], [3, 1]], [[3, 1], [1, 3]]]
```

A _4×3×2_ array, indexed at _i_, _i,j_ and _i,j,k_:

```
>>> let v = [
>>> 	1 2;
>>> 	3 4;
>>> 	5 6
>>> 	:;
>>> 	7 8;
>>> 	9 1;
>>> 	2 3
>>> 	:;
>>> 	4 5;
>>> 	6 7;
>>> 	8 9
>>> 	:;
>>> 	1 2;
>>> 	3 4;
>>> 	5 6
>>> ];
>>> (v.shape, v[3], v[3][1], v[3][1][2])
([4 3 2], [4 5; 6 7; 8 9], [4 5], 5)
```

Sum a _3×3×3_ array to a _3×3_ matrix:

```
>>> [
>>> 	1 0 0;
>>> 	0 1 0;
>>> 	0 0 1
>>> 	:;
>>> 	0 1 0;
>>> 	1 0 1;
>>> 	0 1 0
>>> 	:;
>>> 	1 0 1;
>>> 	0 1 0;
>>> 	1 0 1
>>> ].collect(sum:/1)
[
	1 1 1;
	1 2 1;
	2 1 2
]
```

Transpose a _2×3×3_ array to a _3×2×3_ array:

```
>>> [
>>> 	1 0 0;
>>> 	0 1 0;
>>> 	0 0 1
>>> 	:;
>>> 	0 1 0;
>>> 	1 0 1;
>>> 	0 1 0
>>> ].transpose
[
	1 0 0;
	0 1 0
	:;
	0 1 0;
	1 0 1
	:;
	0 0 1;
	0 1 0
]
```

A _2×2×2_ array as list of matrices:

```
>>> [
>>> 	1 2;
>>> 	3 4
>>> 	:;
>>> 	5 6;
>>> 	7 8
>>> ]
[
	[
		1 2;
		3 4
	],
	[
		5 6;
		7 8
	]
]
```

Irregular arrays allowed:

```
>>> [1 2; 3:; 4 5 6;]
[[[1, 2], [3]], [[4, 5, 6], []]]
```

Empty fields are allowed.
The empty field will be _[[]]_, an empty matrix, not an empty vector:

```
>>> [
>>> 	1 2;
>>> 	3 4
>>> 	:;
>>> 	:;
>>> 	5 6;
>>> 	7 8
>>> ]
[[[1, 2], [3, 4]], [[]], [[5, 6], [7, 8]]]
```

Where supported, `:;` is displayed as ↲.
This suggests the Apl notation where matrices are separated by empty lines.

In _J_ three dimensional arrays are called _bricks_.

* * *

See also: Array Syntax, List Syntax, Matrix Syntax, Syntax Guides, Vector Syntax

References:
_Fortress_
[1](https://doi.org/10.1007/978-0-387-09766-4_190)

Unicode: U+21B2 ↲ Downwards Arrow With Tip Leftwards

Categories: Syntax
