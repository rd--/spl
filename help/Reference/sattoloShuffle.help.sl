# sattoloShuffle

- _sattoloShuffle(aSequence)_

Shuffle _aSequence_ in place using the Sattolo algorithm,
which generates uniformly distributed cycles of maximal length.

Shuffle a list of nine places:

```
>>> let a = [1 .. 9];
>>> a.sattoloShuffle(Sfc32(21791))
[5 1 6 9 3 4 2 7 8]
```

Shuffle a list of seventeen places,
noting that the permutation contains only one cycle:

```
>>> let a = [1 .. 17];
>>> a.sattoloShuffle(Sfc32(38014));
>>> a.asPermutation
[[1 7 14 5 11 2 17 16 6 10 9 3 15 13 12 4 8]].cycles
```

* * *

See also: fisherYatesShuffle, shuffled

Further Reading: Sattolo 1986

Categories: Shuffling
