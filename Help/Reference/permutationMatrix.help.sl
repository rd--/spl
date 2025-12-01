# permutationMatrix

- _permutationMatrix(p)_

Answer the permutation matrix given by the permutation vector _p_.

A three element permutation vector:

```
>>> [2 3 1].permutationMatrix
[
	0 1 0;
	0 0 1;
	1 0 0
]
```

The identity permutation answers an identity matrix:

```
>>> [1 2 3].permutationMatrix
[
	1 0 0;
	0 1 0;
	0 0 1
]
```

A four element permutation vector:

```
>>> [4 1 3 2].permutationMatrix
[
	0 0 0 1;
	1 0 0 0;
	0 0 1 0;
	0 1 0 0
]
```

A seven element permutation vector:

```
>>> [4 5 1 3 2 6 7].permutationMatrix
[
	0 0 0 1 0 0 0;
	0 0 0 0 1 0 0;
	1 0 0 0 0 0 0;
	0 0 1 0 0 0 0;
	0 1 0 0 0 0 0;
	0 0 0 0 0 1 0;
	0 0 0 0 0 0 1
]
```

The `determinant` is always one:

```
>>> [2 3 1]
>>> .permutationMatrix
>>> .determinant
1
```

The `transpose` is also the `inverse`:

```
>>> let m = [3 2 4 1].permutationMatrix;
>>> (m, m.transpose, m.inverse)
(
	[
		0 0 1 0;
		0 1 0 0;
		0 0 0 1;
		1 0 0 0
	],
	[
		0 0 0 1;
		0 1 0 0;
		1 0 0 0;
		0 0 1 0
	],
	[
		0 0 0 1;
		0 1 0 0;
		1 0 0 0;
		0 0 1 0
	]
)
```

The dot product of a permutation matrix _m_ with it’s transpose is the identity matrix:

```
>>> let l = [4 5 1 3 2 6 7];
>>> let m = l.permutationMatrix;
>>> m.dot(m.transpose)
7.identityMatrix
```

Define the _n×n_ bit reversal permutation matrix:

```
>>> let n = 2;
>>> let m = 2 ^ n;
>>> permutationMatrix(
>>> 	n.bitReversalPermutation
>>> ).dot([m m].iota)
[
	 1  2  3  4;
	 9 10 11 12;
	 5  6  7  8;
	13 14 15 16
]

>>> 2.bitReversalPermutation
[1 3 2 4]
```

Define the _n×n_ Gray code permutation matrix:

```
>>> let n = 2 ^ 2;
>>> permutationMatrix(
>>> 	[0 .. n - 1].grayDecode + 1
>>> ).dot([n n].iota)
[
	 1  2  3  4;
	 5  6  7  8;
	13 14 15 16;
	 9 10 11 12
]

>>> 0:3.grayDecode + 1
[1 2 4 3]
```

Plot the permutation matrix of a random permutation of length thirty-two:

~~~spl svg=A
Sfc32(326871)
.randomPermutation(32)
.list
.permutationMatrix
.matrixPlot
~~~

![](sw/spl/Help/Image/permutationMatrix-A.svg)

* * *

See also: permutationCycles, permutationList, permute

Guides: Matrix Functions, Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationMatrix.html)
[2](https://reference.wolfram.com/language/ref/PermutationMatrix.html),
_W_
[1](https://en.wikipedia.org/wiki/Permutation_matrix)

Categories: Permutations
