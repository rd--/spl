# isGracefulPermutation

- _isGracefulPermutation(p)_

Answer `true` if _p_ is a graceful permutation,
a permutation where the absolute values of the first differences is the set _1:k-1_,
where _k_ is the size of _p_.

```
>>> [1 7 2 6 3 5 4]
>>> .isGracefulPermutation
true

>>> [1 7 2 6 3 5 4]
>>> .differences.abs.sort
[1 2 3 4 5 6]
```

There are four graceful permutations on _1,2,3,4_:

```
>>> [1 4 2 3; 2 3 1 4; 3 2 4 1; 4 1 3 2]
>>> .allSatisfy(isGracefulPermutation:/1)
true
```

A twelve-place graceful permutation:

```
>>> [1 12 2 11 3 10 4 9 5 8 6 7]
>>> .isGracefulPermutation
true

>>> [1 12 2 11 3 10 4 9 5 8 6 7]
>>> .differences.abs.sort
[1 2 3 4 5 6 7 8 9 10 11]
```

* * *

See also: abs, differences, isPermutationList, sort

Guides: Permutation Functions
