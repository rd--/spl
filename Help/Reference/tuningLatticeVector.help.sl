# tuningLatticeVector

- _tuningLatticeVector(n/d, p)_

Answer a `List` of the tuning lattice vector of the fraction _n/d_ for each entry in primes list _p_.
Entries indicate the multiplicity of the prime,
in either the numerator (positive),
or denominator (negative).

```
>>> 9/7.tuningLatticeVector(
>>> 	[2 3 5 7]
>>> )
[0 2 0 -1]
```

Ordinarily the two (an octave) column is elided,
and the first column is three (a perfect fifth):

```
>>> 9/7.tuningLatticeVector(
>>> 	[3 5 7 11 13]
>>> )
[2 0 -1 0 0]

>>> 11/5.tuningLatticeVector(
>>> 	[3 5 7 11 13]
>>> )
[0 -1 0 1 0]
```

If _p_ does not contain all of the factors for _n/d_ signal an `error`:

```
>>> {
>>> 	17/13.tuningLatticeVector(
>>> 		[3 5 7 11 13]
>>> 	)
>>> }.hasError
true

>>> 17/13.tuningLatticePrimes(true)
[13 17]

>>> 17/13.tuningLatticeVector(
>>> 	[13 17]
>>> )
[-1 1]
```

* * *

See also: tuningLatticeEdges, tuningLatticePrimes, tuningLatticeVectorString, tuningLatticeVertices, Tuning

Guides: Tuning Functions

Categories: Tuning
