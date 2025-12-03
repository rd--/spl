# sattoloShuffle

- _sattoloShuffle([x₁ x₂ …], r)_

Shuffle a sequence _x_ in place using the Sattolo algorithm,
which generates uniformly distributed cycles of maximal length,
given a random number generator _r_.
Answer _x_.

Shuffle a list of nine places:

```
>>> let r = Sfc32(21791);
>>> let x = [1 .. 9];
>>> x.sattoloShuffle(r)
[5 1 6 9 3 4 2 7 8]
```

Shuffle a list of seventeen places,
noting that the permutation contains only one cycle:

```
>>> let r = Sfc32(38014);
>>> let x = [1 .. 17];
>>> x.sattoloShuffle(r);
>>> x.asPermutation
[
	[
		1 7 14 5 11 2 17 16 6 10
		9 3 15 13 12 4 8
	]
].cycles
```

* * *

See also: fisherYatesShuffle, shuffled

Guides: Permutation Functions, Random Functions

Further Reading: Sattolo 1986

Categories: Shuffling
