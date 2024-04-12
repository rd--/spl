# asPermutation

- _asPermutation(aSequence)_

Answer the `Permutation` indicated by _aSequence_.
It is an error if _aSequence_ is not a permutation.

There are two allowed notations,
_one-line_ notation (also called permutation list notation),
and _cyclic notation_.

The two notations do not overlap,
the predicates `isPermutationCycles` and `isPemutationList`
decide if a sequence is valid as one or the other notation,
or as neither.

A permutation in cyclic notation:

```
>>> [1 3 2; 4 5].asPermutation
[1 3 2; 4 5].cycles
```

A permutation in one-line (permutation list) notation:

```
>>> [3 1 2 5 4].asPermutation
[1 3 2; 4 5].cycles
```

* * *

See also: cycles, isPermutationCycles, isPemutationList, Permutation

Categories: Permutations, Converting
