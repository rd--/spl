# latticeGraph

- _latticeGraph(aRatioTuning)_

Answer a `Graph` of _aRatioTuning_.

The vertices of the graph are labelled with their coordinates,
allowing the graph to be drawn using `lineDrawing`.

A 7-note 7-limit tuning:

~~~
[1/1 8/7 6/5 21/16 3/2 8/5 7/4]
.asRatioTuning
.latticeGraph
.lineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-A.svg)

A 22-note 11-limit tuning:

~~~
[
	1/1 33/32 16/15 11/10 25/22
	7/6 40/33 5/4 9/7 4/3
	11/8 99/70 16/11 3/2 14/9
	8/5 33/20 12/7 44/25 20/11
	15/8 64/33
]
.asRatioTuning
.latticeGraph
.lineDrawing
~~~

![](sw/spl/Help/Image/latticeGraph-B.svg)

* * *

See also: asRatioTuning, Graph, lineDrawing
