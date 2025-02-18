# treePlot

- _treePlot(aTree)_

Answer a tree plot of _aTree_.

A tree with two leaves:

~~~spl svg=A
('a' -> ['b' 'c']).rulesTree.treePlot
~~~

![](sw/spl/Help/Image/treePlot-A.svg)

A tree with multiple levels:

~~~spl svg=B
('a' -> ['b' -> ['c', 'd'], 'e', 'f'])
.rulesTree
.treePlot
~~~

![](sw/spl/Help/Image/treePlot-B.svg)

A tree with data only in the leaves:

~~~spl svg=C
[[1, 2], [3, 4]]
.expressionTree(nil)
.treePlot
~~~

![](sw/spl/Help/Image/treePlot-C.svg)

A tree with only `nil` data:

~~~spl svg=D
[[nil, nil], [nil, nil]]
.expressionTree(nil)
.treePlot
~~~

![](sw/spl/Help/Image/treePlot-D.svg)

* * *

See also: graphPlot, Tree

Guides: Graph Functions, Plotting Functions, Tree Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TreePlot.html)
