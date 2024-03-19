# latticeVectorString

- _latticeVectorString(aFraction, primes)_

Print string for tuning lattice vector for _aFraction_ for each entry in _primes_.
Entries indicate the multiplicity of the prime in either the numerator (positive) or denominator (negative).
Ordinarily the two (octave) column is elided, and the first column is three (perfect fifth).

```
>>> 9/7.latticeVectorString([3 5 7 11 13])
' 2  0 -1  0  0'

>>> 11/5.latticeVectorString([3 5 7 11 13])
' 0 -1  0  1  0'
```

If _primes_ does not contain all of the factors for _aFraction_ answers '*':

>>> 17/13.latticeVectorString([3 5 7 11 13])
'*'

>>> 17/13.latticePrimes
[13 17]

>>> 17/13.latticeVectorString([13 17])
'-1 1'
```

* * *

See also: latticePrimes, Tuning

Categories: Tuning
