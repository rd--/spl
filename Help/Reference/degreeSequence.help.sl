# degreeSequence

- _degreeSequence(aGraph)_

Answer the degree sequence of _aGraph_.
The degree sequence of an undirected graph is a monotonic nonincreasing sequence of its vertex degrees (valencies).
A graph whose degree sequence contains only multiple copies of a single integer is called a regular graph.

It is possible for two topologically distinct graphs to have the same degree sequence:

```
>>> let g = 5.pathGraph;
>>> (g.degreeSequence, g.edgeList)
(
	[2 2 2 1 1],
	[1 2; 2 3; 3 4; 4 5]
)

>>> let g = [1 2; 2 3; 3 1; 4 5].asGraph;
>>> g.degreeSequence
[2 2 2 1 1]
```

* * *

See also: vertexDegree

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DegreeSequence.html)

Categories: Collection
