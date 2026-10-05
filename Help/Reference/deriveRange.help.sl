# deriveRange

- _deriveRange([x₁ x₂ …])_

Answer a `Range` that is equivalent to the sequence _x_,
or signal an error if _x_ is not an arithmetic series.

At `List`:

```
>>> [1 2 3 4 5 6 7 8 9].deriveRange
1:9

>>> [1 3 5 7 9].deriveRange
1:9:2

>>> {
>>> 	[1 3 1 3 1].deriveRange
>>> }.hasError
true
```

* * *

See also: deriveRangeList, isArithmeticProgression, Range

Guides: List Functions

Categories: Converting
