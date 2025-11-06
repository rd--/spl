# linearGraphPlot

- _linearGraphPlot(g)_

Answer a drawing of the graph _g_.
where the vertices are placed in sequence on a line.

Plot a chord diagram where _n=3_:

~~~spl svg=A
Graph(
	[1 .. 6],
	[1 3; 2 6; 4 5]
).linearGraphPlot
~~~

![](sw/spl/Help/Image/linearGraphPlot-A.svg)

Plot a chord diagram where _n=7_:

~~~spl svg=B
Graph(
	[1 .. 14],
	[
		1  6; 2 12; 3 11;
		4  9; 5 10; 7 13;
		8 14
	]
).linearGraphPlot
~~~

![](sw/spl/Help/Image/linearGraphPlot-B.svg)

* * *

See also: circularGraphPlot, graphPlot, Graph

Guides: Graph Functions, Plotting Functions

Categories: Plotting
