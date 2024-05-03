# latticeVertices

- _latticeVertices(aTuning, primes)_

Answer a _matrix_ where each entry tells the `latticeVector` of the corresponding entry in _aTuning_ in relation to _primes_.

```
>>> let ratios = [1/1 10/9 20/17 4/3 3/2 5/3 30/17];
>>> let tuning = ratios.asRatioTuning;
>>> let primes = tuning.latticePrimes;
>>> tuning.latticeVertices(primes)
[0 0 0; -2 1 0; 0 1 -1; -1 0 0; 1 0 0; -1 1 0; 1 1 -1]
```

* * *

See also: latticePrimes, Tuning
