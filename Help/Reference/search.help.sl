# search

- _search(r, s)_

Answers true if the string _s_ contains a match for a the regular expression _r_, else false.

```
>>> RegularExpression('c(a|d)+r')
>>> .search('caddar')
true

>>> RegularExpression('c(a|d)+r')
>>> .search('-caddar-')
true
```

* * *

See also: RegularExpression, searchRegularExpression

Categories: Testing
