# generalisedPentagonalNumbers

- _generalisedPentagonalNumbers(n)_

Answer the first _n_ generalised pentagonal numbers.

The first few terms,
OEIS [A001318](https://oeis.org/A001318):

```
>>> 60.generalisedPentagonalNumbers
[
	   0    1    2    5    7
	  12   15   22   26   35
	  40   51   57   70   77
	  92  100  117  126  145
	 155  176  187  210  222
	 247  260  287  301  330
	 345  376  392  425  442
	 477  495  532  551  590
	 610  651  672  715  737
	 782  805  852  876  925
	 950 1001 1027 1080 1107
	1162 1190 1247 1276 1335
]
```

First differences,
OEIS [A026741](https://oeis.org/A026741):

```
>>> 19.generalisedPentagonalNumbers
>>> .differences
[1 1 3 2 5 3 7 4 9 5 11 6 13 7 15 8 17 9]

>>> [1:17:2 1:9].interleave
[1 1 3 2 5 3 7 4 9 5 11 6 13 7 15 8 17 9]

>>> Fraction(1:18, 2).numerator
[1 1 3 2 5 3 7 4 9 5 11 6 13 7 15 8 17 9]
```

Plot:

~~~spl svg=A
100.generalisedPentagonalNumbers
.stepPlot
~~~

![](sw/spl/Help/Image/generalisedPentagonalNumbers-A.svg)

* * *

See also: pentagonalNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PentagonalNumber.html),
_OEIS_
[1](https://oeis.org/A001318),
_W_
[1](https://en.wikipedia.org/wiki/Pentagonal_number)
