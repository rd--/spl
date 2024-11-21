# asRange

- _asRange(aSequence)_

Answer a `Range` that is equivalent to _aSequence_,
or signal an error if _aSequence_ is not an arithmetic series.

At `List`:

```
>>> [1 2 3 4 5 6 7 8 9].asRange
1:9

>>> [1 3 5 7 9].asRange
(1, 3 .. 9)

>>> { [1 3 1 3 1].asRange }.ifError { true }
true
```

At `Range` is identity:

```
>>> 1:9.asRange
1:9
```

* * *

See also: isArithmeticSeries, Range

Categories: Converting
