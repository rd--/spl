# latticeEdges

- _latticeEdges(aTuning, vertices)_

Answer a two column _matrix_ telling the edges that _aTuning_ describes between its _vertices_.
Edges connect vertices whose coordinates have a `manhattanDistance` of `one`.

```
>>> let r = [
>>> 	1/1 10/9 20/17 4/3
>>> 	3/2 5/3 30/17
>>> ];
>>> let t = r.asRatioTuning;
>>> let p = t.latticePrimes(false);
>>> let v = t.latticeVertexCoordinates(p);
>>> t.latticeEdges(v)
[
	1 4;
	1 5;
	2 6;
	3 7;
	4 6
]
```

* * *

See also: latticePrimes, latticeVertexCoordinates, manhattanDistance

Categories: Tuning
