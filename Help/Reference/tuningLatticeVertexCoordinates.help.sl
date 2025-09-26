# tuningLatticeVertexCoordinates

- _tuningLatticeVertexCoordinates(t, p)_

Answer a matrix,
where each entry tells the `tuningLatticeVector` of the corresponding entry in the tuning _t_,
in relation to the primes list _p_.

```
>>> let r = [
>>> 	1/1 10/9 20/17 4/3
>>> 	3/2 5/3 30/17
>>> ];
>>> let t = r.asRatioTuning;
>>> let p = t.tuningLatticePrimes(false);
>>> t.tuningLatticeVertexCoordinates(p)
[
	0 0 0;
	-2 1 0;
	0 1 -1;
	-1 0 0;
	1 0 0;
	-1 1 0;
	1 1 -1
]
```

* * *

See also: tuningLatticeEdges, tuningLatticePrimes, Tuning

Guides: Tuning Functions
