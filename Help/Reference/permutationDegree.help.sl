# permutationDegree

- _permutationDegree(aPermutation)_

Answer the notated degree of _aPermutation_.

In the permutation list case the answer is the maximum entry,
and is equal to `permutationMax`:

```
>>> let p = [4 3 2 1];
>>> (
>>> 	p.permutationDegree,
>>> 	p.permutationMax
>>> )
(4, 4)
```

In the permutation cycles case it is the maximum entry at any cycle,
including a unary cycle:

```
>>> let p = [1 2 3; 4];
>>> (
>>> 	p.permutationDegree,
>>> 	p.permutationMax
>>> )
(4, 3)
```

A `Permutation` object stores the notated degree,
and uses it for reconstructing notations as required.

* * *

See also: Permutation, permutationMax

Categories: Permutations
