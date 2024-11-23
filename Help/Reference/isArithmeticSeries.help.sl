# isArithmeticSeries

- _isArithmeticSeries(aSequence)_

Answer `true` if _aSequence_ is an arithmetic series.

Ascending arithmetic series with step size of one:

```
>>> [1 2 3 4 5].isArithmeticSeries
true
```

Descending arithmetic series with step size of one:

```
>>> [7 6 5 4 3].isArithmeticSeries
true
```

The `differences` of an arithmetic series are all equal:

```
>>> let l = [1 3 5 7 9];
>>> (l.isArithmeticSeries, l.differences)
(true, [2 2 2 2])
```

* * *

See also: arithmeticSeries, asRange, isArithmeticSeriesBy, isGeometricSeries, Range

Categories: Testing
