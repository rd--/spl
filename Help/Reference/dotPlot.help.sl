# dotPlot

- _dotPlot(d)_

Answer a dot plot of the data set _d_,
also called a dot chart.

A dot plot of fifty random values from zero to nine:

~~~spl svg=A
Sfc32(367814)
.randomInteger([0 9], 50)
.dotPlot
~~~

![](Help/Image/dotPlot-A.svg)

A dot plot of one-hundred random values from one to twenty-five:

~~~spl svg=B
Sfc32(638174)
.randomInteger([1 25], 100)
.dotPlot
~~~

![](Help/Image/dotPlot-B.svg)

At `Multiset`,
plot a data set of thirty-three places:

~~~spl svg=C
[|
	1 -> 1,
	2 -> 2,
	3 -> 3,
	5 -> 5,
	6 -> 5,
	7 -> 3,
	8 -> 8,
	9 -> 2,
	10 -> 4
|].asMultiset.dotPlot
~~~

![](Help/Image/dotPlot-C.svg)

* * *

See also: barChart, bubbleChart, discretePlot, ferrersDiagram, histogram, scatterPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DotPlot.html),
_W_
[1](https://en.wikipedia.org/wiki/Dot_plot_(statistics))
