# latticeEdges

- _latticeEdges(aTuning, vertices)_

Answer a two column _matrix_ telling the edges that _aTuning_ describes between its _vertices_.

```
>>> let ratios = [1/1 10/9 20/17 4/3 3/2 5/3 30/17];
>>> let tuning = ratios.asRatioTuning;
>>> let primes = tuning.latticePrimes;
>>> let vertices = tuning.latticeVertices(primes);
>>> tuning.latticeEdges(vertices)
[1 4; 1 5; 2 6; 3 7; 4 6]
```

* * *

See also: latticePrimes, latticeVertices

Categories: Tuning
