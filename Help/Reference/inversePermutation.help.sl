# inversePermutation

- _inversePermutation(aPermutation)_

Answer the inverse of _aPermutation_.
Every permutation has a uniquely defined inverse.

Inverse of a permutation in cyclic notation:

```
>>> [1 3 2 5; 4 7; 6].inversePermutation
[1 5 2 3; 4 7].cycles
```

Inverse of permutations in one-line (permutation list) notation:

```
>>> [4 8 5 2 1 3 7 6].inversePermutation
[5 4 6 1 3 8 7 2].asPermutation

>>> [
>>> 	3 8 5 10 9
>>> 	4 6 1 7 2
>>> ].inversePermutation
[8 10 1 6 3 7 9 2 5 4].asPermutation

>>> [2 4 1 5 3].inversePermutation
[3 1 5 2 4].asPermutation
```

The product of a permutation with its inverse gives the identity permutation:

```
>>> [
>>> 	1 3 2 5;
>>> 	4 7;
>>> 	6
>>> 	:;
>>> 	1 5 2 3;
>>> 	4 7;
>>> 	6
>>> ].permutationProduct
[1; 2; 3; 4; 5; 6; 7].cycles
```

The support of a permutation is the same as the support of its inverse:

```
>>> let p = [3 2 5 1; 4 7].cycles;
>>> let q = p.inverse;
>>> let i = p.support;
>>> let j = q.support;
>>> i = j
true
```

Some permutations, called involutions, are their own inverse:

```
>>> [1 2; 3 4].cycles.inverse
[1 2; 3 4].cycles
```

Inverting a permutation is equivalent to reversing its cycles:

```
>>> [1 6 12; 2 9].cycles.inverse
[12 6 1; 9 2].cycles
```

`ordering` gives the inverse of a permutation list:

```
>>> let p = [1 9 6 5 10 7 8 4; 2 3].cycles;
>>> let q = p.inverse;
>>> (q.list, p.list.ordering)
(
	[4 3 2 8 6 9 10 7 1 5],
	[4 3 2 8 6 9 10 7 1 5]
)
```

* * *

See also: cycles, Permutation, permutationPower

References:
_Mathematica_
[1](https://mathworld.wolfram.com/InversePermutation.html),
[2](https://reference.wolfram.com/language/ref/InversePermutation.html),
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.inverse)

Categories: Permutations
