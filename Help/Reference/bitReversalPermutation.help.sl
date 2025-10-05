# bitReversalPermutation

- _bitReversalPermutation(k)_

Answer the _bit-reversal permutation_ for a sequence of size _2 ^ k_.

The first five bit-reversal permutations, OEIS A030109 (one-indexed):

```
>>> 0:4.collect(bitReversalPermutation:/1)
[
	1;
	1 2;
	1 3 2 4;
	1 5 3 7 2 6 4 8;
	1 9 5 13 3 11 7 15 2 10 6 14 4 12 8 16
]
```

Repeating the same permutation twice returns to the original ordering,
that is the bit reversal permutation is an involution:

```
>>> let p = [
>>> 	1  9  5 13  3 11  7 15  2 10
>>> 	6 14  4 12  8 16
>>> ];
>>> p.permute(p)
[1 .. 16]
```

* * *

See also: fromDigits, integerDigits, permute, Permutation

Guides: Bitwise Functions,Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A030109),
_W_
[1](https://en.wikipedia.org/wiki/Bit-reversal_permutation)

Categories: Permutation
