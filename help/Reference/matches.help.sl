# matches

- _matches(aRegExp, aString)_

Answers true if _aString_ exactly matches _aRegExp_, else false.

```
>>> RegExp('c(a|d)+r').matches('caddar')
true

>>> RegExp('c(a|d)+r').matches('-caddar-')
false
```

* * *

See also: RegExp, search

Categories: Testing
