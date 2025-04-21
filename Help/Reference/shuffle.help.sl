# shuffle

- _shuffle(l, r)_

Randomly shuffle a sequence _l_ in place using the Fisher-Yates algorithm.

```
>>> let r = Sfc32(36814);
>>> let l = [1 .. 9];
>>> l.shuffle(r);
>>> l
[1 9 3 2 6 8 7 4 5]
```

See `shuffled` for a copying variant.

* * *

See also: fisherYatesShuffle, randomPermutation, sattoloShuffle, shuffled

Guides: Random Functions

Categories: Rearranging, Random
