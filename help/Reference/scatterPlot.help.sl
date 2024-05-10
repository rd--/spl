# scatterPlot

- _scatterPlot(aSequence)_

Plot a sequence of numbers.

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

* * *

See also: discretePlot, plot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScatterDiagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Scatter_plot)
