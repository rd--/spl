# isColossallyAbundantNumber

- _isColossallyAbundantNumber(n)_

Determine if the integer _n_ is a colossally abundant number.

First few terms:

```
>>> 1:5040.select(isColossallyAbundantNumber:/1)
[2 6 12 60 120 360 2520 5040]

>>> 160626866400.isColossallyAbundantNumber
true

>>> 160626866400.isSuperiorHighlyCompositeNumber
false
```

* * *

See also: isAbundantNumber, isHighlyCompositeNumber, isSuperiorHighlyCompositeNumber

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ColossallyAbundantNumber.html),
_OEIS_
[1](https://oeis.org/A004490),
_W_
[1](https://en.wikipedia.org/wiki/Colossally_abundant_number)
