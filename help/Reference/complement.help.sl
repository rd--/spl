# complement

- _complement(aBitSet | aResidueSet | aGraph)_

The `complement` of a `BitSet` is a `BitSet` with each bit having the `bitNot` of the initial set:

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = l.asBitSet;
>>> (b.asList, b.complement.asList)
(l, [1 3 6 8 10])
```

At `ResidueSet`:

```
>>> [0 2 4 5 7 9 11].asResidueSet(12).complement.asList
[1 3 6 8 10]
```

At `cycleGraph`:

```
>>> 4.cycleGraph.complement.edgeList
[1 3; 2 4]

>>> 5.cycleGraph.complement.edgeList
[1 3; 1 4; 2 4; 2 5; 3 5]

>>> 6.cycleGraph.complement.edgeList
[1 3; 1 4; 1 5; 2 4; 2 5; 2 6; 3 5; 3 6; 4 6]
```

At directed cycle graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 4, 4 -> 1].asGraph.complement.edgeList
[1 -> 3, 1 -> 4, 2 -> 1, 2 -> 4, 3 -> 1, 3 -> 2, 4 -> 2, 4 -> 3]
```

The complement of a `completeGraph` is an edgeless graph:

```
>>> let g = 5.completeGraph.complement;
>>> (g.vertexList, g.isEmpty)
([1 .. 5], true)
```

For simple graphs, the complement of the complement is the original graph:

```
>>> let g = 6.cycleGraph;
>>> g.complement.complement.edgeList
[1 2; 1 6; 2 3; 3 4; 4 5; 5 6]
```

The complement of the line graph of _K(5) is a Petersen graph:

```
>>> 5.completeGraph.lineGraph.complement.adjacencyMatrix
[
	0 0 0 0 0 0 0 1 1 1;
	0 0 0 0 0 1 1 0 0 1;
	0 0 0 0 1 0 1 0 1 0;
	0 0 0 0 1 1 0 1 0 0;
	0 0 1 1 0 0 0 0 0 1;
	0 1 0 1 0 0 0 0 1 0;
	0 1 1 0 0 0 0 1 0 0;
	1 0 0 1 0 0 1 0 0 0;
	1 0 1 0 0 1 0 0 0 0;
	1 1 0 0 1 0 0 0 0 0
]
```

* * *

See also: BitSet, intersection, union, ResidueSet, symmetricDifference

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GraphComplement.html)
[1](https://reference.wolfram.com/language/ref/GraphComplement.html)
