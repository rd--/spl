# shuffled

- _shuffled(l, r)_

Answer a copy of a sequence _l_,
randomly shuffled using the Fisher-Yates algorithm.

```
>>> let r = Sfc32(36814);
>>> let l = [1 .. 9];
>>> (l.shuffled(r), l)
([1 9 3 2 6 8 7 4 5], [1 .. 9])
```

See `randomPermutation` for an alternate name for the same function.
See `shuffle` for an in place variant.
See `sattoloShuffle` for a variant algorithm generating only single cycle permutations.

* * *

See also: fisherYatesShuffle, randomPermutation, sattoloShuffle, shuffle

Guides: Random Functions

Categories: Rearranging, Copying
