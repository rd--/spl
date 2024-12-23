# graphPlot

- _graphPlot(aGraph)_

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
}.flatten.nub.sizeasGraph.graphPlot
~~~

![](sw/spl/Help/Image/graphPlot-C.svg)

* * *

See also: discretePlot, functionPlot, linePlot, matrixPlot, parametricPlot, scatterPlot, surfacePlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GraphPlot.html)

Categories: Plotting
