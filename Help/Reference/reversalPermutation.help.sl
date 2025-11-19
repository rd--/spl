# reversalPermutation

- _reversalPermutation(k, b)_

Answer the base _b_ reversal permutation for a sequence of size _2^k_.

The first five bit-reversal permutations,
OEIS [A049773](https://oeis.org/A049773):

```
>>> 0:4.collect { :n |
>>> 	n.reversalPermutation(2)
>>> }
[
	1;
	1 2;
	1 3 2 4;
	1 5 3 7 2 6 4 8;
	1 9 5 13 3 11 7 15 2 10 6 14 4 12 8 16
]
```

Base three:

```
>>> 0:4.collect { :n |
>>> 	n.reversalPermutation(3)
>>> }
[
	1
	;
	 1  2  3
	;
	 1  4  7  2  5  8  3  6  9;
	 1 10 19  4 13 22  7 16 25  2
	11 20  5 14 23  8 17 26  3 12
	21  6 15 24  9 18 27
	;
	 1 28 55 10 37 64 19 46 73  4
	31 58 13 40 67 22 49 76  7 34
	61 16 43 70 25 52 79  2 29 56
	11 38 65 20 47 74  5 32 59 14
	41 68 23 50 77  8 35 62 17 44
	71 26 53 80  3 30 57 12 39 66
	21 48 75  6 33 60 15 42 69 24
	51 78  9 36 63 18 45 72 27 54
	81
]
```

Plot first few terms for _b=3_:

~~~spl svg=A
0:5.collect { :n |
	n.reversalPermutation(3)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/reversalPermutation-A.svg)

* * *

See also: bitReversalPermutation, integerReverse

Guides: Bitwise Functions, Integer Sequence Functions, Permutation Functions

References:
_OEIS_
[1](https://oeis.org/A049773),
_W_
[1](https://en.wikipedia.org/wiki/Bit-reversal_permutation)

Categories: Permutation
