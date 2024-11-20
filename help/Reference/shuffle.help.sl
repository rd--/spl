# shuffle

- _shuffle(aSequence, aRandom)_

Randomly shuffle _aSequence_ in place using the Fisher-Yates algorithm.

```
>>> let l = [1 .. 9];
>>> l.shuffle(Sfc32(36814));
>>> l
[1 9 3 2 6 8 7 4 5]
```

See `shuffled` for a copying variant.

* * *

See also: fisherYatesShuffle, randomPermutation, sattoloShuffle, shuffled

Categories: Rearranging, Random
