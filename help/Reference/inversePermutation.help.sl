# inversePermutation

- _inversePermutation(aPermutation)_

Answer the inverse of _aPermutation_.

Every permutation has a uniquely defined inverse.

Inverse of a permutation:

```
>>> [3 2 5 1; 4 7].cycles.inverse
[1 5 2 3; 4 7].cycles
```

The product of a permutation with its inverse gives the identity permutation:

```
>>> [3 2 5 1; 4 7:; 1 5 2 3; 4 7].permutationProduct
[].cycles
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
[1](https://reference.wolfram.com/language/ref/InversePermutation.html)

Categories: Permutations
