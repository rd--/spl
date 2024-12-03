# scatterPlot

- _scatterPlot(aSequence)_

Plot a sequence of numbers, each drawn as a point.

Plot seven integers:

~~~spl svg=A
[1 1 2 2 3 4 4].scatterPlot
~~~

![](sw/spl/Help/Image/scatterPlot-A.svg)

Plot the cocatenation of three Ranges:

~~~spl svg=B
(1:20 ++ 20:1 ++ 1:30).scatterPlot
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

* * *

See also: discretePlot, functionPlot, linePlot, matrixPlot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScatterDiagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Scatter_plot)

Categories: Plotting
