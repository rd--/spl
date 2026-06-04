# linearGraphPlot

- _linearGraphPlot(g)_

Answer a drawing of the graph _g_.
where the vertices are placed in sequence on a line.

Plot a chord diagram where _n=3_:

~~~spl svg=A
Graph[1 3; 2 6; 4 5]
.linearGraphPlot
~~~

![](Help/Image/linearGraphPlot-A.svg)

Plot a chord diagram where _n=7_:

~~~spl svg=B
Graph[
	1  6; 2 12; 3 11;
	4  9; 5 10; 7 13;
	8 14
].linearGraphPlot
~~~

![](Help/Image/linearGraphPlot-B.svg)

The first of Sherlaw-Johnson’s contour inversion symmetries in _Mode de valeurs et d’intensités_:

~~~spl svg=C
Graph[
	1 12; 2 11; 3 10;
	4 9; 5 8; 6 7
].linearGraphPlot
~~~

![](Help/Image/linearGraphPlot-C.svg)

The third of Sherlaw-Johnson’s contour inversion symmetries in _Mode de valeurs et d’intensités_:

~~~spl svg=D
Graph[
	1 11; 3 9; 5 7;
	2 12; 4 10; 6 8
].linearGraphPlot
~~~

![](Help/Image/linearGraphPlot-D.svg)

The fifth of Sherlaw-Johnson’s contour inversion symmetries in _Mode de valeurs et d’intensités_:

~~~spl svg=E
Graph[
	1 7; 2 8; 3 9;
	4 10; 5 11; 6 12
].linearGraphPlot
~~~

![](Help/Image/linearGraphPlot-E.svg)

* * *

See also: circularGraphPlot, graphPlot, Graph

Guides: Graph Functions, Plotting Functions

Categories: Plotting
