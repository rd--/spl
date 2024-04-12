# permutationSupport

- _permutationSupport(aPermutation)_

Answer the support of _aPermutation_.

The support of a permutation _p_ is the list of integers that are not fixed by _p_.
The list of integers is answered sorted.

Points moved by a permutation in disjoint cyclic form:

```
>>> let p = [1 7; 2 5 10 9; 4 6].cycles;
>>> p.permutationSupport
[1 2 4 5 6 7 9 10]
```

Points moved in a permutation list:

```
>>> let p = [1 4 3 5 2 6 10 7 9 8].asPermutation;
>>> p.permutationSupport
[2 4 5 7 8 10]
```

Support of identity permutation:

```
>>> [].cycles.permutationSupport
[]
```

* * *

See also: cycles, permutationMax, permutationMin, permutationLength

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PermutationSupport.html)

Categories: Permutations
