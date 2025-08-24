# search

- _search(r, s)_

Answers `true` if the string _s_ contains a match for the regular expression _r_,
else `false`.

```
>>> RegularExpression('b')
>>> .search('abcd')
true

>>> RegularExpression('c.*t')
>>> .search('bcde')
false

>>> RegularExpression('b.*e')
>>> .search('bcde')
true

>>> RegularExpression('c(a|d)+r')
>>> .search('caddar')
true

>>> RegularExpression('c(a|d)+r')
>>> .search('-caddar-')
true
```

* * *

See also: RegularExpression, searchRegularExpression

Guides: Regular Expression Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringContainsQ.html)

Categories: Testing
