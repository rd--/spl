# binCounts

- _binCounts(data, bins)_
- _binCounts(data, bins, bins)_

Answer a `List` of lists of the elements of _data_ whose values lie in successive specified _bins_.
_bins_ are given as a _(min, max, width)_ triples.
If data is two-dimensional, two _bins_ values are required.

Count elements in specified bins:

```
>>> [1 3 2 1 4 5 6 2].binCounts([0 8 2])
[2 3 2 1]
```

Count elements in bins of width 1 from 0 to 10:

```
>>> [1 3 2 1 4 5 6 2].binCounts([0 10 1])
[0 2 2 1 1 1 1 0 0 0]
```

Count squares mod 3 and 5 in two-dimensional unit bins:

```
>>> 1:100.collect { :i |
>>> 	(i ^ 2) % [3 5]
>>> }.binCounts([0 2 1], [0 5 1])
[
	 6 14  0  0 13;
	14 26  0  0 27
]
```

Visualize the density of two-dimensional uniform noise data in bins:

~~~spl svg=A
Sfc32(3678124)
.randomReal(-5, 5, [1000 2])
.binCounts([-5 5 1], [-5 5 1])
.matrixPlot
~~~

![](sw/spl/Help/Image/binCounts-A.svg)

Visualize the density of two-dimensional normal noise data in bins:

~~~spl svg=B
let r = Sfc32(918041);
NormalDistribution(0, 2)
.randomVariate(r, [2000 2])
.binCounts([-5 5 1], [-5 5 1])
.matrixPlot
~~~

![](sw/spl/Help/Image/binCounts-B.svg)

Bin count of two peak random data with two thousand points:

~~~spl svg=C
let r = Sfc32(918041);
[
	NormalDistribution(0, 1)
	.randomVariate(r, [1000]),
	NormalDistribution(5, 2)
	.randomVariate(r, [1000])
]
.concatenation
.binCounts([-3 11 0.2])
.discretePlot
~~~

![](sw/spl/Help/Image/binCounts-C.svg)

* * *

See also: binLists, histogramList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinCounts.html),
_NumPy_
[1](https://numpy.org/doc/stable/reference/generated/numpy.histogram.html)
