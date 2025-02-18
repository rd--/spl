# kirchhoffMatrix

- _kirchhoffMatrix(aGraph)_

Answer the Kirchhoff matrix of the graph _aGraph_.

The Kirchhoff matrix of an undirected graph:

```
>>> [1 2; 2 3; 3 1]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1 -1;
	-1  2 -1;
	-1 -1  2
]
```

The Kirchhoff matrix of an undirected graph:

```
>>> [1 -> 2, 2 -> 3, 3 -> 1]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1  0;
	 0  2 -1;
	-1  0  2
]
```

The Kirchhoff matrix of an undirected graph is symmetric:

```
>>> [1 2; 1 3; 2 3; 2 4; 3 4]
>>> .asGraph
>>> .kirchhoffMatrix
[
	 2 -1 -1  0;
	-1  3 -1 -1;
	-1 -1  3 -1;
	 0 -1 -1  2
]
```

* * *

See also: Graph

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KirchhoffMatrix.html)
