# permutationGraph

- _permutationGraph(aPermutation)_

A permutation graph is a graph whose vertices represent the elements of a permutation,
and whose edges represent pairs of elements that are reversed by the permutation.

That is, the edges in the permutation graph indicate inversions in the permutation.

A permutation graph for a permutation in _S10_:

```
>>> [2 1 5 6 7 10 9 4 8 3]
>>> .permutationGraph
>>> .adjacencyMatrix
[
	0 1 0 0 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0 0 0;
	0 0 0 1 1 1 1 1 1 1;
	0 0 1 0 1 1 1 0 1 1;
	0 0 1 1 0 0 0 0 0 0;
	0 0 1 1 0 0 0 0 0 0;
	0 0 1 1 0 0 0 0 0 0;
	0 0 1 0 0 0 0 0 1 1;
	0 0 1 1 0 0 0 1 0 1;
	0 0 1 1 0 0 0 1 1 0
]
```

Draw graph:

~~~spl svg=A
[2 1 5 6 7 10 9 4 8 3]
.permutationGraph
.graphPlot
~~~

![](sw/spl/Help/Image/permutationGraph-A.svg)

* * *

See also: Graph, Permutation, permutationInversions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationGraph.html),
_W_
[1](https://en.wikipedia.org/wiki/Permutation_graph)
