# fareyApproximants

- _fareyApproximants(x, n)_

Answer the first _n_ terms of the sequence of Farey fraction approximations to _x_.

Farey approximants to π:

```
>>> 1.pi.fareyApproximants(11)
[
	3/1 4/1 7/2 10/3 13/4
	16/5 19/6 22/7 25/8 47/15
	69/22
]
```

Farey approximants to _log₂(3)_:

```
>>> 3.log2.fareyApproximants(11)
[
	1/1 2/1 3/2 5/3 8/5
	11/7 19/12 27/17 46/29 65/41
	84/53
]
```

Farey approximants to _0.43_:

```
>>> 0.43.fareyApproximants(10)
[
	0/1 1/1 1/2 1/3 2/5
	3/7 4/9 7/16 10/23 13/30
]
```

Numerators of Farey fraction approximations to π,
OEIS [A097545](https://oeis.org/A097545):

```
>>> 1.pi.fareyApproximants(48)
>>> .numerator
[
	3 4 7 10 13
	16 19 22 25 47
	69 91 113 135 157
	179 201 223 245 267
	289 311 333 355 688
	1043 1398 1753 2108 2463
	2818 3173 3528 3883 4238
	4593 4948 5303 5658 6013
	6368 6723 7078 7433 7788
	8143 8498 8853
]
```

Denominators of Farey fraction approximations to π,
OEIS [A097546](https://oeis.org/A097546):

```
>>> 1.pi.fareyApproximants(52)
>>> .denominator
[
	1 1 2 3 4
	5 6 7 8 15
	22 29 36 43 50
	57 64 71 78 85
	92 99 106 113 219
	332 445 558 671 784
	897 1010 1123 1236 1349
	1462 1575 1688 1801 1914
	2027 2140 2253 2366 2479
	2592 2705 2818 2931 3044
	3157 3270
]
```

Numerators of Farey fraction approximations to √2,
OEIS [A119016](https://oeis.org/A119016):

```
>>> 2.sqrt.fareyApproximants(17)
>>> .numerator
[
	1 2 3 4 7
	10 17 24 41 58
	99 140 239 338 577
	816 1393
]
```

Denominators of Farey fraction approximations to √2,
OEIS [A002965](https://oeis.org/A002965):

```
>>> 2.sqrt.fareyApproximants(17)
>>> .denominator
[
	1 1 2 3 5
	7 12 17 29 41
	70 99 169 239 408
	577 985
]
```

Farey fraction approximations to _e_,
OEIS [A119014](https://oeis.org/A119014)
and
OEIS [A119015](https://oeis.org/A119015):

```
>>> 1.e.fareyApproximants(13)
[
	2/1 3/1 5/2 8/3 11/4
	19/7 30/11 49/18 68/25 87/32
	106/39 193/71 299/110
]
```

Numerators of Farey fraction approximations to π,
OEIS [A097545](https://oeis.org/A097545):

~~~spl svg=A oeis=A097545
1.pi.fareyApproximants(48)
.numerator
.scatterPlot.log
~~~

![](Help/Image/fareyApproximants-A.svg)

Denominators of Farey fraction approximations to π,
OEIS [A097546](https://oeis.org/A097546):

~~~spl svg=B oeis=A097546
1.pi.fareyApproximants(52)
.denominator
.scatterPlot.log
~~~

![](Help/Image/fareyApproximants-B.svg)

* * *

See also: fareyConvergence, fareySequence, Fraction, mediant

Guides: Number Functions

References:
_OEIS_
[1](https://oeis.org/A097545)
