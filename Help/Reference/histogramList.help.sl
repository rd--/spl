# histogramList

- _histogramList(x, b)_
- _histogramList(x)_

Answer a list of bins boundaries and histogram heights of the values in _x_,
given the bin specification _b_.
If _b_ is elided,
the number of bins is derived from the square root of the number of data points.
Bins include the left endpoint, but not the right.

Histogram of the first thirteen integers:

```
>>> 1:13.histogramList
[
	0 2.5 5 7.5 10 12.5 15;
	2 2 3 2 3 1
]
```

Specify bins as _(left, right, step)_:

```
>>> 1:13.histogramList([0 14 2])
[
	0 2 4 6 8 10 12 14;
	1 2 2 2 2 2 2
]
```

Histogram of the first seventeen integers:

```
>>> 1:17.histogramList
[
	0 2.5 5 7.5 10 12.5 15 17.5;
	2 2 3 2 3 2 3
]

>>> 1:17.histogramList([0 20 5])
[
	0 5 10 15 20;
	4 5 5 3
]
```

Histogram of the first ninety-nine integers:

```
>>> 1:99.histogramList
[
	0 10 20 30 40 50 60 70 80 90 100;
	9 10 10 10 10 10 10 10 10 10
]

>>> 1:99.histogramList([0 100 20])
[0 20 40 60 80 100; 19 20 20 20 20]
```

Histogram of numbers between `zero` and `one`:

```
>>> (0, 0.02 .. 1).histogramList
[
	0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1;
	5 6 5 4 5 5 5 5 5 6
]

>>> (0, 0.02 .. 1).histogramList([0 1 0.25])
[0 0.25 0.5 0.75 1; 13 12 13 13]
```

Histogram of a small list of small integers,
note that the last item is counted,
despite being at the right edge of the last bin,
since the last bin is treated especially:

```
>>> [1 3 2 1 4 5 6 2].histogramList
[
	1 2 3 4 5 6;
	2 2 1 1 2
]

>>> [1 3 2 1 4 5 6 2].histogramList([0 10 2])
[
	0 2 4 6 8 10;
	2 3 2 1 0
]
```

Plot histogram of random numbers with normal distribution:

~~~spl svg=A
let r = Sfc32(890141);
NormalDistribution(0, 1)
.randomVariate(r, 500)
.histogramList
.second
.discretePlot
~~~

![](sw/spl/Help/Image/histogramList-A.svg)

* * *

See also: binCounts, binLists, findDivisions, niceNumberAbove, niceNumberNear

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HistogramList.html)
