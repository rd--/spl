# matches

- _matches(r, s)_

Answers `true` if the string _s_ exactly matches the regular expression _r_, else `false`.

```
>>> RegularExpression('c(a|d)+r')
>>> .matches('caddar')
true

>>> RegularExpression('c(a|d)+r')
>>> .matches('-caddar-')
false
```

* * *

See also: matchesRegularExpression, RegularExpression, search

Categories: Regular Expression, Testing
