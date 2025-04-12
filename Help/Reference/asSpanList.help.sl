# asSpanList

- _asSpanList(aSequence)_

Answer a `List` of `Span` values that, when concatenated, is equivalent to _aSequence_.

At empty `List`:

```
>>> [].asSpanList
[]
```

At one element `List`:

```
>>> [1].asSpanList
[Span(1, 1, 1)]
```

Any two element numerical sequence is a `Span`:

```
>>> [1 2].asSpanList
[Span(1, 2, 1)]

>>> [1 3].asSpanList
[Span(1, 3, 2)]
```

* * *

See also: asSpan, asRangeList

Categories: Converting
