# tuningLatticeEdges

- _tuningLatticeEdges(t, v)_

Answer a two column matrix telling the edges that the tuning _t_ describes between its vertices _v_.
Edges connect vertices whose coordinates have a `manhattanDistance` of `one`.

```
>>> let r = [
>>> 	1/1 10/9 20/17 4/3
>>> 	3/2 5/3 30/17
>>> ];
>>> let t = r.asRatioTuning;
>>> let p = t.tuningLatticePrimes(false);
>>> let v = t.tuningLatticeVertexCoordinates(p);
>>> t.tuningLatticeEdges(v)
[
	1 4;
	1 5;
	2 6;
	3 7;
	4 6
]
```

* * *

See also: tuningLatticePrimes, tuningLatticeVertexCoordinates, manhattanDistance

Guides: Tuning Functions

Categories: Tuning
