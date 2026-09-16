# isCyclicPermutation

- _isCyclicPermutation(p, n)_

Answer `true` if the permutation _p_ is an n-cycle permutation,
a permutation that has one cycle of length _n_.

There are twenty-four _5-cycle_ permutations of _1:5_:

```
>>> [1 .. 5].permutations.count { :p |
>>> 	 p.isCyclicPermutation(5)
>>> }
24
```

* * *

See also: cycles, Permutation

Guides: Permutation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cyclic_permutation)
