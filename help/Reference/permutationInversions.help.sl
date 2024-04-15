# permutationInversions

- _permutationInversions(aPermutation)_

Answer a `List` of the inversions of _aPermutation_.
Inversions are the indice of pairs which are out of order.

```
>>> [3 2 4 1 5].permutationInversions
[1 2; 1 4; 2 4; 3 4]
```

The number of inversions in a permutation is equal to that of its inverse:

```
>>> let p = [1 3 2; 4 5 6].cycles;
>>> let q = p.inverse;
>>> (
>>> 	p.list.permutationInversions,
>>> 	q.list.permutationInversions
>>> )
(
	[1 2; 1 3; 4 6; 5 6],
	[1 3; 2 3; 4 5; 4 6]
)
```

* * *

See also:

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationInversion.html)
