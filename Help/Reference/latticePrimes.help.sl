# latticePrimes

- _latticePrimes(aFraction | aTuning, includeOctave)_

Answer a `List` of the prime factors of _aFraction_ or _aTuning_,
without sign,
and without the octave entry.

At `Fraction`:

```
>>> 35/26.latticePrimes(true)
[2 5 7 13]

>>> 185/98.latticePrimes(false)
[5 7 37]
```

At `Tuning`:

```
>>> [1/1 10/9 20/17 4/3 3/2 5/3 30/17]
>>> .asRatioTuning
>>> .latticePrimes(true)
[2 3 5 17]
```

`latticePrimes` at `Fraction` answers a subset of the answer of `factorInteger`:

```
>>> 35/26.factorInteger
[2 -> -1, 5 -> 1, 7 -> 1, 13 -> -1]

>>> 185/98.factorInteger
[2 -> -1, 5 -> 1, 7 -> -2, 37 -> 1]
```

* * *

See also: factorInteger, latticeEdges, latticeVector, latticeVertices, primeFactors

Categories: Tuning
