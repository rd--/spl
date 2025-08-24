# asRegularExpression

- _asRegularExpression(x)_

At `String`,
compiles _x_ to a regular expression.

```
>>> 'a|b'.asRegularExpression
RegularExpression('a|b', 'd')

>>> 'caddr'.matchesRegularExpression(
>>> 	'c(a|d)+r'.asRegularExpression
>>> )
true
```

At `RegularExpression` answers _x_.

* * *

See also: matches, matchesRegularExpression, RegularExpression, String

Guides: Regular Expression Functions

Categories: Converting
