# binCounts

- _binCounts(d, b)_
- _binCounts(d, b₁, b₂)_

Answer a `List` of lists of the elements of the data list _d_ whose values lie in successive bins specified at _b_.
Bins are given as _(min, max, width)_ triples.
If data is two-dimensional, two bin specifications are required.

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

Count squares modulo three and five in two-dimensional unit bins:

```
>>> 1:100.collect { :i |
>>> 	(i ^ 2) % [3 5]
>>> }.binCounts([0 2 1], [0 5 1])
[
	 6 14  0  0 13;
	14 26  0  0 27
]
```

Count two-dimensional uniform noise in two bins at the first dimension and four at the second:

```
>>> Sfc32(673814)
>>> .randomReal([-1 1], [1000 2])
>>> .binCounts([-2 2 2], [-1 1 0.5])
[
	123 129 125 119;
	122 123 133 126
]
```

Visualize the density of two-dimensional uniform noise data in bins:

~~~spl svg=A
Sfc32(3678124)
.randomReal([-5 5], [1000 2])
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
let p = NormalDistribution(0, 1);
let q = NormalDistribution(5, 2);
let a = p.randomVariate(r, [1000]);
let b = q.randomVariate(r, [1000]);
(a ++ b)
.binCounts([-3 11 0.2])
.discretePlot
~~~

![](sw/spl/Help/Image/binCounts-C.svg)

* * *

See also: binLists, densityHistogramPlot, histogramList, histogramPlot

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinCounts.html),
_NumPy_
[1](https://numpy.org/doc/stable/reference/generated/numpy.histogram.html)
