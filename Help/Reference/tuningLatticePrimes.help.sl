# tuningLatticePrimes

- _tuningLatticePrimes(x, includeOctave)_

Answer a `List` of the prime factors of _x_,
which may be a `Fraction` or a `Tuning`,
without sign,
and without the octave entry.

At `Fraction`:

```
>>> 35/26.tuningLatticePrimes(true)
[2 5 7 13]

>>> 185/98.tuningLatticePrimes(false)
[5 7 37]
```

At `Tuning`:

```
>>> [1/1 10/9 20/17 4/3 3/2 5/3 30/17]
>>> .asRatioTuning
>>> .tuningLatticePrimes(true)
[2 3 5 17]
```

`tuningLatticePrimes` at `Fraction` answers a subset of the answer of `factorInteger`:

```
>>> 35/26.factorInteger
[2 -> -1, 5 -> 1, 7 -> 1, 13 -> -1]

>>> 185/98.factorInteger
[2 -> -1, 5 -> 1, 7 -> -2, 37 -> 1]
```

* * *

See also: factorInteger, tuningLatticeEdges, tuningLatticeVector, tuningLatticeVertices, primeFactors

Guides: Tuning Functions

Categories: Tuning
