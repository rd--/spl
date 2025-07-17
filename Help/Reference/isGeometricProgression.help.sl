# isGeometricProgression

- _isGeometricProgression(p)_

Answer `true` if the sequence _p_ is a geometric series.

```
>>> [1 3 9 27 81 243 729]
>>> .isGeometricProgression
true

>>> [12 24 48 96]
>>> .isGeometricProgression
true
```

The `ratios` of a geometic series are all equal:

```
>>> [1 3 9 27 81 243 729].ratios
[3 3 3 3 3 3]
```

* * *

See also: isArithmeticProgression, geometricProgression, ratios

Categories: Testing
