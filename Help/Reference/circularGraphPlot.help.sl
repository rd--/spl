# circularGraphPlot

- _circularGraphPlot(g)_

Answer a drawing of the graph _g_.
where the vertices are placed in sequence on a circle.

Plot a complete graph on eight vertices:

~~~spl svg=A
13.completeGraph.circularGraphPlot
~~~

![](Help/Image/circularGraphPlot-A.svg)

Plot a random graph of fifteen vertices.
The probablity of an edge occuring is 5%:

~~~spl svg=B
Sfc32(379714)
.randomBit(5 / 100, [15 15])
.adjacencyGraph
.circularGraphPlot
~~~

![](Help/Image/circularGraphPlot-B.svg)

Draw the Herschel graph:

~~~spl svg=C
'HerschelGraph'
.namedGraph
.circularGraphPlot
~~~

![](Help/Image/circularGraphPlot-C.svg)

* * *

See also: graphPlot, linearGraphPlot, Graph

Guides: Graph Functions, Plotting Functions

Categories: Plotting
