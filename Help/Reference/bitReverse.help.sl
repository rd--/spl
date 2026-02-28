# bitReverse

- _bitReverse(n, k)_

Answer the bit reversal of _n_ to _k_ places.

Bit reverse in blocks,
OEIS [A030109](https://oeis.org/A030109):

```
>>> 0:4.collect { :n |
>>> 	let m = 2 ^ n - 1;
>>> 	0:m.bitReverse(n)
>>> }
[
	0;
	0 1;
	0 2 1 3;
	0 4 2 6 1 5 3 7;
	0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15
]
```

The first five bit-reversal permutations,
OEIS [A049773](https://oeis.org/A049773):

```
>>> 0:4.collect { :n |
>>> 	let m = 2 ^ n - 1;
>>> 	0:m.bitReverse(n) + 1
>>> }
[
	1;
	1 2;
	1 3 2 4;
	1 5 3 7 2 6 4 8;
	1 9 5 13 3 11 7 15 2 10 6 14 4 12 8 16
]
```

* * *

See also: bitReversalPermutation
