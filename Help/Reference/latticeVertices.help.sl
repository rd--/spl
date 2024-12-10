# latticeVertices

- _latticeVertices(aTuning, primes)_

Answer a _matrix_,
where each entry tells the `latticeVector` of the corresponding entry in _aTuning_ in relation to _primes_.

```
>>> let r = [
>>> 	1/1 10/9 20/17 4/3
>>> 	3/2 5/3 30/17
>>> ];
>>> let t = r.asRatioTuning;
>>> let p = t.latticePrimes(false);
>>> t.latticeVertices(p)
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

See also: latticeEdges, latticePrimes, Tuning
