# shuffle

- _shuffle(l, r)_

Randomly shuffle the sequence _l_ using the Fisher-Yates algorithm.
There are both copying and in-place forms.

In-place shuffle of a `List`:

```
>>> let r = Sfc32(36814);
>>> let a = [1 .. 9];
>>> let b = a.shuffle!(r);
>>> (b, a == b)
([1 9 3 2 6 8 7 4 5], true)
```

Copying variant, also using the Fisher-Yates algorithm:

```
>>> let r = Sfc32(36814);
>>> let a = [1 .. 9];
>>> (a.shuffle(r), a)
([1 9 3 2 6 8 7 4 5], [1 .. 9])
```

See `randomPermutation` for an alternate name for the same function.
See `sattoloShuffle` for a variant algorithm generating only single cycle permutations.

* * *

See also: fisherYatesShuffle, randomPermutation, sattoloShuffle

Guides: Random Functions

Categories: Copying, Rearranging, Random
