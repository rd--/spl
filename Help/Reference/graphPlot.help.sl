# graphPlot

- _graphPlot(g)_

Answer a drawing of the graph _g_.
The layout is made using the graph visualization library _Graphviz_.

Plot a complete graph on eight vertices:

~~~spl svg=A
8.completeGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-A.svg)

Plot a random graph of twenty vertices.
The probablity of an edge occuring is 5%:

~~~spl svg=B
Sfc32(379714)
.randomBit(5 / 100, [20 20])
.adjacencyGraph
.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-B.svg)

A graph of 32 vertices,
edges indicate that one number can been derived from the other by the insertion of one bit:

~~~spl svg=C
(0 .. 2 ^ 5 - 1).collect { :j |
	let p = j.integerDigits(2);
	(1 .. p.size + 1).collect { :i |
		let q = p.copy;
		q.insertAt(1, i);
		j -> q.fromDigits(2)
	}
}.flatten.nub.asGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-C.svg)

Draw the [Herschel Graph](https://mathworld.wolfram.com/HerschelGraph.html):

~~~spl svg=D
'HerschelGraph'
.namedGraph
.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-D.svg)

Draw the 76-node [Owens graph](https://mathworld.wolfram.com/OwensGraphs.html):

~~~spl svg=E
'OwensGraph'
.namedGraph
.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-E.svg)

Plot a graph given by an edge re-writing rule,
the vertices are given by OEIS [A228853](https://oeis.org/A228853):

~~~spl svg=F
{ :t |
	t.collect { :e |
		let [x, y] = e;
		[
			[y, x + y],
			[y, x + (2 * y)]
		]
	}.++
}.nestList([[1, 2]], 6)
.catenate
.asGraph
.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-F.svg)

* * *

See also: discretePlot, functionPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

Guides: Graph Functions, Plotting Functions

References:
_AT&T_
[1](https://graphviz.org/),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GraphPlot.html),
_OEIS_
[1](https://oeis.org/A228853),
_W_
[1](https://en.wikipedia.org/wiki/Graph_drawing)

Categories: Plotting
