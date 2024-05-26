# fisherYatesShuffle

- _fisherYatesShuffle(aSequence, random)_

Shuffle _aSequence_ in place using the Fisher–Yates algorithm.

Shuffle a list of nine places:

```
>>> let a = [1 .. 9];
>>> a.fisherYatesShuffle(Sfc32(31797))
[5 6 8 2 9 7 1 4 3]
```

Shuffle a list of seventeen places,
noting that the permutation contains three cycles:

```
>>> let a = [1 .. 17];
>>> a.fisherYatesShuffle(Sfc32(31415));
>>> a.asPermutation
[1 9 3 15 6 16 13; 2 17 8 4 11 5; 7 12 10].cycles
```

* * *

See also: sattoloShuffle, shuffled

References:
_W_
[1](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle)

Further Reading: Durstenfeld 1964, Knuth 1969

Categories: Shuffling
