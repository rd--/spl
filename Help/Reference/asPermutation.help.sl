# asPermutation

- _asPermutation(x)_

Answer the `Permutation` indicated by _x_,
which may be in _one-line_ or _cyclic notation_.
It is an error if _x_ is not a permutation.

A permutation in cyclic notation:

```
>>> [1 3 2; 4 5].asPermutation.list
[3 1 2 5 4]
```

A permutation in one-line (permutation list) notation:

```
>>> [3 1 2 5 4].asPermutation.cycles
[1 3 2; 4 5]
```

The empty list answers the identity permutation:

```
>>> [].asPermutation.isIdentity
true
```

* * *

See also: cycles, isPermutationCycles, isPemutationList, Permutation

Guides: Permutation Functions

Categories: Permutations, Converting
