# fisherYatesShuffle

- _fisherYatesShuffle([x₁ x₂ …], r)_

Shuffle the sequence _x_ in place using the Fisher–Yates algorithm,
given a random number generator _r_.
Answer _x_.
Sometimes also called the Knuth shuffle.

Shuffle a list of nine places:

```
>>> let r = Sfc32(31797);
>>> let x = [1 .. 9];
>>> x.fisherYatesShuffle(r)
[5 6 8 2 9 7 1 4 3]
```

Shuffle a list of seventeen places,
noting that the permutation contains three cycles:

```
>>> let r = Sfc32(31415);
>>> let x = [1 .. 17];
>>> x.fisherYatesShuffle(r);
>>> x.asPermutation
[
	1 9 3 15 6 16 13;
	2 17 8 4 11 5;
	7 12 10
].cycles
```

* * *

See also: randomPermutation, sattoloShuffle, shuffled

Guides: Permutation Functions, Random Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle)

Further Reading: Durstenfeld 1964, Knuth 1968

Categories: Shuffling
