# yellowstonePermutation

- _yellowstonePermutation(n)_

Answer the first _n_ terms of the Yellowstone permutation.

First few terms,
OEIS [A098550](https://oeis.org/A098550):

```
>>> 71.yellowstonePermutation
[
	 1  2   3  4  9  8 15 14  5   6
	25 12  35 16  7 10 21 20 27  22
	39 11  13 33 26 45 28 51 32  17
	18 85  24 55 34 65 36 91 30  49
	38 63  19 42 95 44 57 40 69  50
	23 48 115 52 75 46 81 56 87  62
	29 31  58 93 64 99 68 77 54 119
	60
]
```

Plot first few terms:

~~~spl svg=A
125.yellowstonePermutation.scatterPlot
~~~

![](sw/spl/Help/Image/yellowstonePermutation-A.svg)

* * *

See also: ekgSequence, gcd

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A098550)
