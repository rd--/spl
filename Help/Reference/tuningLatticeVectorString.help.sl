# tuningLatticeVectorString

- _tuningLatticeVectorString(n/d, p)_

Answer a `String` describing the tuning `tuningLatticeVector` of the fraction _n/d_ for each entry in the primes list _p_.
Entries indicate the multiplicity of the prime,
in either the numerator (positive),
or denominator (negative).
Ordinarily the two (octave) column is elided,
and the first column is three (perfect fifth).

```
>>> 9/7.tuningLatticeVectorString(
>>> 	[3 5 7 11 13]
>>> )
' 2  0 -1  0  0'

>>> 11/5.tuningLatticeVectorString(
>>> 	[3 5 7 11 13]
>>> )
' 0 -1  0  1  0'
```

If _p_ does not contain all of the factors for _n/d_, answer '*':

```
>>> 17/13.tuningLatticeVectorString(
>>> 	[3 5 7 11 13]
>>> )
'*'

>>> 17/13.tuningLatticePrimes(true)
[13 17]

>>> 17/13.tuningLatticeVectorString(
>>> 	[13 17]
>>> )
'-1  1'
```

* * *

See also: tuningLatticePrimes, tuningLatticeVector, Tuning

Guides: Tuning Functions

Categories: Tuning
