# shuffled

- _shuffled(aSequence, aRandom)_

Answer a copy of _aSequence_, randomly shuffled using the Fisher-Yates algorithm.

```
>>> let l = [1 .. 9];
>>> (l.shuffled(Sfc32(36814)), l)
([1 9 3 2 6 8 7 4 5], [1 .. 9])
```

See `shuffle` for an in place variant.
See `sattoloShuffle` for a variant algorithm generating only single cycle permutations.

* * *

See also: fisherYatesShuffle, sattoloShuffle, shuffle

Categories: Copying
