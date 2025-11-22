# scatterPlot

- _scatterPlot(l)_

Plot a sequence of numbers, each drawn as a point.

Plot seven integers:

~~~spl svg=A
[1 1 2 2 3 4 4].scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-A.svg)

Plot the catenation of three `Range` values:

~~~spl svg=B
(1:20 ++ 20:1:-1 ++ 1:30).scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-B.svg)

Plot the first few terms of the Stern-Brocot sequence:

~~~spl svg=C
1:256.collect(
	sternBrocotNumber:/1
).scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-C.svg)

Plot a table:

~~~spl svg=D
(0, 0.05 .. 1).collect { :x |
	x - (x ^ 2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-D.svg)

Plot values of iterative map:

~~~spl svg=E
let f = { :a :b :c :d :p |
	let [x, y] = p;
	[
		(x ^ 2) - (y ^ 2) + (a * x) + (b * y),
		(2 * x * y) + (c * x) + (d * y)
	]
};
{ :p |
	f(0.9, -0.6013, 2.0, 0.5, p)
}.nestList([0.1 0], 256).scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-E.svg)

Plot a list of _y_ values:

~~~spl svg=F
1:25.prime.scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-F.svg)

Plot a list of _(x, y)_  pairs:

~~~spl svg=G
let r = Sfc32(567314);
BinormalDistribution([4 4], [1 1], 0.5)
.randomVariate(r, [150])
.scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-G.svg)

Plot several data sets:

~~~spl svg=H
[
	1:40.sqrt,
	40:90.log
].scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-H.svg)

Plot the decimal expansion of the limit of the ratio of consecutive terms in the tetranacci sequence,
OEIS [A086088](https://oeis.org/A086088):

~~~spl svg=I
[
	1 9 2 7 5 6 1 9 7 5 4 8 2 9 2 5 3 0 4 2
	6 1 9 0 5 8 6 1 7 3 6 6 2 2 1 6 8 6 9 8
	5 5 4 2 5 5 1 6 3 3 8 4 7 2 7 1 4 6 6 4
	7 0 3 8 0 0 9 6 6 6 0 6 2 2 9 7 8 1 5 5
	5 9 1 4 9 8 1 8 2 5 3 4 6 1 8 9 0 6 5 3
	2 5
].scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-I.svg)

* * *

See also: discretePlot, functionPlot, graphPlot, linePlot, matrixPlot, parametricPlot, runSequencePlot, surfacePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScatterDiagram.html)
[2](https://reference.wolfram.com/language/ref/ListPlot.html),
_NIST_
[1](https://www.itl.nist.gov/div898/handbook/eda/section3/scatterp.htm),
_W_
[1](https://en.wikipedia.org/wiki/Scatter_plot)

Categories: Plotting
