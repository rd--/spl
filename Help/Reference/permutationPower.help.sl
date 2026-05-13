# permutationPower

- _permutationPower(p, n)_

Answer the _n_-th permutation power of the permutation _p_,
i.e. the product of _p_ with itself _n_ times.
When _n_ is negative,
`permutationPower` finds powers of the inverse of _p_.

Sixth power of a permutation:

```
>>> let p = [1 7 6 3; 2 5 4];
>>> p.permutationPower(6)
Permutation[1 6; 2; 3 7; 4; 5]
```

The same answer arrived at using `permutationProduct`:

```
>>> let p = [1 7 6 3; 2 5 4].cycles;
>>> List(6, p).permutationProduct
Permutation[1 6; 2; 3 7; 4; 5]
```

Second power of the inverse permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(-2)
Permutation[1 6; 2 5 4; 3 7]
```

`permutationPower` can yield the identity permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(12)
Permutation[1; 2; 3; 4; 5; 6; 7]
```

When _n_ is zero, `permutationPower` answers the identity permutation:

```
>>> [1 7 6 3; 2 5 4].permutationPower(0)
Permutation[1; 2; 3; 4; 5; 6; 7]
```

Square of permutation given in list form:

```
>>> [1 4 5 6 2 3].permutationPower(2)
Permutation[1 6 2 3 4 5]
```

Powers of permutation _235174968_:

```
>>> 1:10.collect { :n |
>>> 	[2 3 5 1 7 4 9 6 8]
>>> 	.permutationPower(n)
>>> 	.permutationList
>>> }
[
	2 3 5 1 7 4 9 6 8;
	3 5 7 2 9 1 8 4 6;
	5 7 9 3 8 2 6 1 4;
	7 9 8 5 6 3 4 2 1;
	9 8 6 7 4 5 1 3 2;
	8 6 4 9 1 7 2 5 3;
	6 4 1 8 2 9 3 7 5;
	4 1 2 6 3 8 5 9 7;
	1 2 3 4 5 6 7 8 9;
	2 3 5 1 7 4 9 6 8
]
```

Powers of permutation _23517468_:

```
>>> 1:8.collect { :n |
>>> 	[2 3 5 1 7 4 6 8]
>>> 	.permutationPower(n)
>>> 	.permutationList
>>> }
[
	2 3 5 1 7 4 6 8;
	3 5 7 2 6 1 4 8;
	5 7 6 3 4 2 1 8;
	7 6 4 5 1 3 2 8;
	6 4 1 7 2 5 3 8;
	4 1 2 6 3 7 5 8;
	1 2 3 4 5 6 7 8;
	2 3 5 1 7 4 6 8
]
```

* * *

See also: asPermutation, cycles, inversePermutation, permutationProduct

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationPower.html)

Categories: Permutations
