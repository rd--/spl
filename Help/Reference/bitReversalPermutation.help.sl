# bitReversalPermutation

- _bitReversalPermutation(k)_

Answer the _bit-reversal permutation_ for a sequence of size _2 ^ k_.

The first five bit-reversal permutations,
OEIS [A049773](https://oeis.org/A049773):

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

Subtracting one,
OEIS [A030109](https://oeis.org/A030109):

```
>>> 0:4.collect(
>>> 	bitReversalPermutation:/1
>>> ) - 1
[
	0;
	0 1;
	0 2 1 3;
	0 4 2 6 1 5 3 7;
	0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15
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
16.iota
```

Plot first few terms

~~~spl svg=A
0:7.collect(bitReversalPermutation:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/bitReversalPermutation-A.svg)

* * *

See also: fromDigits, integerDigits, permute, Permutation, reversalPermutation

Guides: Bitwise Functions, Integer Sequence Functions, Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A030109)
[2](https://oeis.org/A049773),
_W_
[1](https://en.wikipedia.org/wiki/Bit-reversal_permutation)

Categories: Permutation
