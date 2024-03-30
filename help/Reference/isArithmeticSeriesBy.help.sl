# isArithmeticSeriesBy

- _isArithmeticSeriesBy(aSequence, anInteger)_

Answer `true` if _aSequence_ is an arithmetic series by _anInteger_.

At `List`:

```
>>> [1 3 5 7 9].isArithmeticSeriesBy(2)
true

>>> [1 3 5 7 9].isArithmeticSeriesBy(3)
false
```

At `Range`:

```
>>> (1, 3 .. 9).isArithmeticSeriesBy(2)
true

>>> (1, 3 .. 9).isArithmeticSeriesBy(3)
false
```

* * *

See also: isArithmeticSeries, Range
