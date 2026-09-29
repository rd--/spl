# shuffle (shuffle!)

- _shuffle(l, r)_

Randomly shuffle a sequence _l_ either in-place or copying using the Fisher-Yates algorithm.

In-place shuffle of a `List`:

```
>>> let r = Sfc32(36814);
>>> let l = [1 .. 9];
>>> l.shuffle!(r);
>>> l
[1 9 3 2 6 8 7 4 5]
```

Copying variant, also using the Fisher-Yates algorithm:

```
>>> let r = Sfc32(36814);
>>> let l = [1 .. 9];
>>> (l.shuffle(r), l)
([1 9 3 2 6 8 7 4 5], [1 .. 9])
```

See `randomPermutation` for an alternate name for the same function.
See `sattoloShuffle` for a variant algorithm generating only single cycle permutations.

* * *

See also: fisherYatesShuffle, randomPermutation, sattoloShuffle

Guides: Random Functions

Categories: Copying, Rearranging, Random
