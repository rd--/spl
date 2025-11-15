# permutationSupport

- _permutationSupport(p)_

Answer the support of the permutation _p_.

The support of a permutation _p_ is the list of integers that are not fixed by _p_.
The list of integers is answered sorted.

Points moved by a permutation in disjoint cyclic form:

```
>>> [1 7; 2 5 10 9; 4 6].permutationSupport
[1 2 4 5 6 7 9 10]
```

Points moved in a permutation list:

```
>>> [1 4 3 5 2 6 10 7 9 8].permutationSupport
[2 4 5 7 8 10]
```

Support of identity permutation:

```
>>> [].permutationSupport
[]
```

* * *

See also: cycles, permutationMax, permutationMin, permutationLength

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationSupport.html)

Categories: Permutations
