# search

- _search(aRegExp, aString)_

Answers true if _aString_ contains a match for a _aRegExp_, else false.

```
>>> RegExp('c(a|d)+r').search('caddar')
true

>>> RegExp('c(a|d)+r').search('-caddar-')
true
```

* * *

See also: RegExp, search

Categories: Testing
