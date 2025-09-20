# circularGraphPlot

- _circularGraphPlot(g, p, r)_

Answer a drawing of the graph _g_,
where the vertices are placed on a circle of radius _r_,
ordered according to the permutation _p_.

Plot a complete graph on eight vertices:

~~~spl svg=A
13.completeGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/circularGraphPlot-A.svg)

Plot a random graph of fifteen vertices.
The probablity of an edge occuring is 5%:

~~~spl svg=B
Sfc32(379714)
.randomBit(5 / 100, [15 15])
.adjacencyGraph
.circularGraphPlot
~~~

![](sw/spl/Help/Image/circularGraphPlot-B.svg)

Draw the [Herschel Graph](https://mathworld.wolfram.com/HerschelGraph.html):

~~~spl svg=C
[
	1 3; 1 4; 1 5; 1 6;
	2 3; 2 4; 2 7; 2 8;
	3 11;
	4 10;
	5 9; 5 10;
	6 9; 6 11;
	7 9; 7 10;
	8 9; 8 11
].asGraph.circularGraphPlot
~~~

![](sw/spl/Help/Image/circularGraphPlot-C.svg)

* * *

See also: circlePoints, graphPlot, Graph

Guides: Graph Functions, Plotting Functions

Categories: Plotting
