# gouldsSequence

- _gouldsSequence(k)_

Answer the first _k_ terms of Gould’s sequence.
The sequence counts how many odd numbers are in each row of Pascal’s triangle.

Gould’s sequence,
OEIS [A001316](https://oeis.org/A001316):

```
>>> 88.gouldsSequence
[
	 1  2  2  4  2  4  4  8  2  4
	 4  8  4  8  8 16  2  4  4  8
	 4  8  8 16  4  8  8 16  8 16
	16 32  2  4  4  8  4  8  8 16
	 4  8  8 16  8 16 16 32  4  8
	 8 16  8 16 16 32  8 16 16 32
	16 32 32 64  2  4  4  8  4  8
	 8 16  4  8  8 16  8 16 16 32
	 4  8  8 16  8 16 16 32
]
```

Gould’s sequence consists only of powers of two:

```
>>> 88.gouldsSequence
>>> .allSatisfy(isPowerOfTwo:/1)
true
```

The prefix sum of Gould’s sequence,
OEIS [A006046](https://oeis.org/A006046):

```
>>> 57.gouldsSequence.prefixSum
[
	  1   3   5   9  11
	 15  19  27  29  33
	 37  45  49  57  65
	 81  83  87  91  99
	103 111 119 135 139
	147 155 171 179 195
	211 243 245 249 253
	261 265 273 281 297
	301 309 317 333 341
	357 373 405 409 417
	425 441 449 465 481
	513 521
]
```

The binary logarithm of Gould’s sequence,
OEIS [A000120](https://oeis.org/A000120):

```
>>> 32.gouldsSequence.log(2)
[
	0 1 1 2 1 2 2 3 1 2
	2 3 2 3 3 4 1 2 2 3
	2 3 3 4 2 3 3 4 3 4
	4 5
]
```

Gould’s sequence,
log scale scatter plot,
OEIS [A001316](https://oeis.org/A001316):

~~~spl svg=A oeis=A001316
99.gouldsSequence
.scatterPlot.log
~~~

![](Help/Image/gouldsSequence-A.svg)

Partial sums of Gould’s sequence,
scatter plot,
OEIS [A006046](https://oeis.org/A006046):

~~~spl svg=B oeis=A006046
96.gouldsSequence
.prefixSum
.scatterPlot
~~~

![](Help/Image/gouldsSequence-B.svg)

First differences of Gould’s sequence,
OEIS [A151930](https://oeis.org/A151930):

~~~spl svg=C oeis=A151930
63.gouldsSequence
.differences
.discretePlot
~~~

![](Help/Image/gouldsSequence-C.svg)

* * *

See also: binomial, gouldsNumber, hammingWeight, pascalTriangle

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A001316)
[2](https://oeis.org/A006046)
[3](https://oeis.org/A000120),
_W_
[1](https://en.wikipedia.org/wiki/Gould%27s_sequence)
