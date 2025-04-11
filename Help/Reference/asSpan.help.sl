# asSpan

- _asSpan(aSequence)_

Answer a `Span` that is equivalent to _aSequence_,
or signal an error if _aSequence_ is not an arithmetic series.

At `List`:

```
>>> [1 2 3 4 5 6 7 8 9].asSpan
Span(1, 9, 1)

>>> [1 3 5 7 9].asSpan
Span(1, 9, 2)

>>> { [1 3 1 3 1].asSpan }.ifError { true }
true
```

At `Span` is identity:

```
>>> Span(1, 9, 1).asSpan
Span(1, 9, 1)
```

* * *

See also: asRange, isArithmeticSeries, Span

Categories: Converting
