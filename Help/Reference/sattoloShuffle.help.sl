# sattoloShuffle

- _sattoloShuffle(l, r)_

Shuffle a sequence _l_ in place using the Sattolo algorithm,
which generates uniformly distributed cycles of maximal length,
given a random number generator _r_.

Shuffle a list of nine places:

```
>>> let r = Sfc32(21791);
>>> let l = [1 .. 9];
>>> l.sattoloShuffle(r)
[5 1 6 9 3 4 2 7 8]
```

Shuffle a list of seventeen places,
noting that the permutation contains only one cycle:

```
>>> let r = Sfc32(38014);
>>> let l = [1 .. 17];
>>> l.sattoloShuffle(r);
>>> l.asPermutation
[
	[
		1 7 14 5 11 2 17 16 6 10
		9 3 15 13 12 4 8
	]
].cycles
```

* * *

See also: fisherYatesShuffle, shuffled

Guides: Random Functions

Further Reading: Sattolo 1986

Categories: Shuffling
