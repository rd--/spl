# isPermutationOf

- _isPermutationOf(p, q)_

Answer `true` if the sequence _q_ is a permutation of the sequence _p_, else `false`.

```
>>> [1 2 3 4].isPermutationOf([4 3 2 1])
true

>>> [1 2 3 5].isPermutationOf([1 2 3 4])
false
```

Does not mutate _p_ or _q_:

```
>>> let p = [1 2 3 4];
>>> let q = [4 3 2 1];
>>> let r = p.isPermutationOf(q);
>>> (p, q, r)
([1 2 3 4], [4 3 2 1], true)
```

* * *

See also: Permutation

Guides: Permutation Functions

Categories: Permutations, Testing
