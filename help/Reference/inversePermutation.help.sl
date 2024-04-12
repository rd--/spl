# inversePermutation

- _inversePermutation(aPermutation)_

Answer the inverse of _aPermutation_.

Inverse of a permutation:

```
>>> [3 2 5 1; 4 7].cycles.inversePermutation
[1 5 2 3; 4 7].cycles
```

Their product gives the identity permutation:

```
>>> [3 2 5 1; 4 7:; 1 5 2 3; 4 7].permutationProduct
[].cycles
```

Some permutations, called involutions, are their own inverse:

```
>>> [1 2; 3 4].cycles.inversePermutation
[1 2; 3 4].cycles
```

Inverting a permutation is equivalent to reversing its cycles:

```
>>> [1 6 12; 2 9].cycles.inversePermutation
[12 6 1; 9 2].cycles
```

`ordering` gives the inverse of a permutation list:

```
>>> let p = [1 9 6 5 10 7 8 4; 2 3].cycles;
>>> let q = p.inversePermutation;
>>> (q.permutationList, p.permutationList.ordering)
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
