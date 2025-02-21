# isArithmeticSeriesBy

- _isArithmeticSeriesBy(aSequence, anInteger, aBlock:/2)_

Answer `true` if _aSequence_ is an arithmetic series by _anInteger_,
with distances considered equal according to _aBlock_.

At `List`:

```
>>> [1 3 5 7 9].isArithmeticSeriesBy(2, =)
true

>>> [1 3 5 7 9].isArithmeticSeriesBy(3, =)
false
```

At `Range`:

```
>>> (1, 3 .. 9).isArithmeticSeriesBy(2, =)
true

>>> (1, 3 .. 9).isArithmeticSeriesBy(3, =)
false
```

Taking into account small errors:

```
>>> (1, 1.1 .. 9).isArithmeticSeriesBy(0.1, =)
false

>>> (1, 1.1 .. 9).isArithmeticSeriesBy(0.1, ~)
true
```

* * *

See also: isArithmeticSeries, Range

Categories: Testing
