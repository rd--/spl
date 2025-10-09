# gouldsSequence

- _gouldsSequence(k)_

Answer the first _k_ terms of Gould’s sequence.
The sequence counts how many odd numbers are in each row of Pascal’s triangle.

The first few terms,
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

It consists only of powers of two:

```
>>> 88.gouldsSequence
>>> .allSatisfy(isPowerOfTwo:/1)
true
```

The prefix sum,
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

The binary logarithm,
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

Log scatter plot of first few terms:

~~~spl svg=A
99.gouldsSequence
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/gouldsSequence-A.svg)

Scatter plot of first few terms of prefix sum:

~~~spl svg=B
96.gouldsSequence
.prefixSum
.scatterPlot
~~~

![](sw/spl/Help/Image/gouldsSequence-B.svg)

* * *

See also: binomial, gouldsNumber, hammingWeight, pascalTriangle

Guides: Integer Sequence Functions

References:
OEIS
[1](https://oeis.org/A001316)
[2](https://oeis.org/A006046),
_W_
[1](https://en.wikipedia.org/wiki/Gould%27s_sequence)
