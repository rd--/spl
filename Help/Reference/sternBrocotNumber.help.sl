# sternBrocotNumber

- _sternBrocotNumber(anInteger)_

Answer the _n_-th entry in the Stern-Brocot sequence.
Sometimes known as the _fusc_ function.

The first one hundred entries:

```
>>> 0:99.collect(sternBrocotNumber:/1)
[
	 0  1  1  2  1  3  2  3  1  4
	 3  5  2  5  3  4  1  5  4  7
	 3  8  5  7  2  7  5  8  3  7
	 4  5  1  6  5  9  4 11  7 10
	 3 11  8 13  5 12  7  9  2  9
	 7 12  5 13  8 11  3 10  7 11
	 4  9  5  6  1  7  6 11  5 14
	 9 13  4 15 11 18  7 17 10 13
	 3 14 11 19  8 21 13 18  5 17
	12 19  7 16  9 11  2 11  9 16
]
```

At specific values:

```
>>> [1173 35499 699051 19573419]
>>> .collect(sternBrocotNumber:/1)
[108 1076 10946 103682]
```

Plot the first few terms:

~~~spl svg=A
1:256
.collect(sternBrocotNumber:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotNumber-A.svg)

* * *

See also: sternBrocotSequence, sternBrocotTree

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SternsDiatomicSeries.html),
_OEIS_
[1](https://oeis.org/A002487)
