# scatterPlot

- _scatterPlot(aSequence)_

Plot a sequence of numbers, each drawn as a point.

Plot seven integers:

~~~
[1 1 2 2 3 4 4].scatterPlot
~~~

Plot the cocatenation of three Ranges:

~~~
(1:20 ++ 20:1 ++ 1:30).scatterPlot
~~~

Plot the first 4096 terms of the Stern-Brocot sequence:

~~~
1:4096.collect(sternBrocotNumber:/1).scatterPlot
~~~

Plot a table:

~~~
(0, 0.01 .. 1).collect { :x |
	x - (x ^ 2)
}.scatterPlot
~~~

Plot values of iterative map:

~~~
let f = { :a :b :c :d :p |
	let [x, y] = p;
	[
		(x ^ 2) - (y ^ 2) + (a * x) + (b * y),
		(2 * x * y) + (c * x) + (d * y)
	]
};
{ :p |
	f(0.9, -0.6013, 2.0, 0.5, p)
}.nestList([0.1 0], 5000).scatterPlot
~~~

* * *

See also: discretePlot, functionPlot, linePlot, plot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScatterDiagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Scatter_plot)

Categories: Plotting
