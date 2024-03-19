# geometricSeries

- _geometricSeries(count, start, multiplier)_

Answer a `List` holding a geometric series:

```
>>> 7.geometricSeries(1, 3)
[1 3 9 27 81 243 729]

>>> 7.geometricSeries(729, 1 / 3)
[729 243 81 27 9 3 1]
```

The `powerRange` method gives the same sequence, requiring a _stop_ value rather than a _count_:

```
>>> 1.powerRange(10 ^ 6, 10)
[1 10 100 1000 10000 100000 1000000]

>>> 7.geometricSeries(1, 10)
[1 10 100 1000 10000 100000 1000000]
```

* * *

See also: arithemeticSeries, powerRange, Range, ratios

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GeometricSeries.html),
[2](https://mathworld.wolfram.com/GeometricSequence.html)
[3](https://mathworld.wolfram.com/CommonRatio.html)

Categories: Arithmetic
