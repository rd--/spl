# pentagonalNumber

- _pentagonalNumber(n)_

Answer the _n_-th pentagonal number.

```
>>> 23.pentagonalNumber
782
```

Pentagonal numbers,
threads over lists,
OEIS [A000326](https://oeis.org/A000326):

```
>>> 0:23.pentagonalNumber
[
	                  0
	  1   5  12  22  35
	 51  70  92 117 145
	176 210 247 287 330
	376 425 477 532 590
	651 715 782
]
```

A linear recurrence:

```
>>> linearRecurrence([3 -3 1], [0 1 5], 23)
0:22.pentagonalNumber
```

One formulation:

```
>>> 0:22.collect { :z |
>>> 	1/2 * z * (3 * z - 1)
>>> }
0:22.pentagonalNumber
```

The second pentagonal numbers,
also called the card house numbers,
OEIS [A005449](https://oeis.org/A005449):

```
>>> 0:22.collect { :z |
>>> 	1/2 * z * (3 * z + 1)
>>> }
[
	  0   2   7  15  26
	 40  57  77 100 126
	155 187 222 260 301
	345 392 442 495 551
	610 672 737
]
```

First differences of the second pentagonal numbers,
OEIS [A016789](https://oeis.org/A016789):

```
>>> 0:15.collect { :z |
>>> 	1/2 * z * (3 * z + 1)
>>> }.differences
[2 5 8 11 14 17 20 23 26 29 32 35 38 41 44]
```

Partial sums of the second pentagonal numbers,
OEIS [A006002](https://oeis.org/A006002):

```
>>> 0:17.collect { :z |
>>> 	1/2 * z * (3 * z + 1)
>>> }.prefixSum
[
	0 2 9 24 50 90 147 224 324 450 605
	792 1014 1274 1575 1920 2312 2754
]
```

C.f. `polygonalNumber`:

```
>>> 1:23.pentagonalNumber
5.polygonalNumber(1:23)
```

Pentagonal numbers,
OEIS [A000326](https://oeis.org/A000326):

~~~spl svg=A oeis=A000326
1:85.pentagonalNumber.discretePlot
~~~

![](Help/Image/pentagonalNumber-A.svg)

* * *

See also: binomial, cube, hexagonalNumber, pascalTriangle, polygonalNumber, square, tetrahedralNumber, triangularNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PentagonalNumber.html),
_OEIS_
[1](https://oeis.org/A000326),
_W_
[1](https://en.wikipedia.org/wiki/Pentagonal_number)
