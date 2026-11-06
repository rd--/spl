# isIntegerRange

- _isIntegerRange(aRange)_

Answers `true` if _aRange_ has integral `start`, `end` and `step` values.

```
>>> (1 .. 9)
>>> .isIntegerRange
true

>>> (1.5 .. 17.5)
>>> .isIntegerRange
false

>>> (1 .. 9; 0.5)
>>> .isIntegerRange
false
```

* * *

See also: Range, isInteger

Categories: Testing
