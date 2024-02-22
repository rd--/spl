# match

- _match(aRegExp, aString)_

Answer the part of _aString_ that matches _aRegExp_, else nil if there is no match.

```
>>> RegExp('c(a|d)+r').match('caddar')
'caddar'

>>> RegExp('c(a|d)+r').match('-caddar-')
'caddar'

>>> RegExp('c(a|d)+r').match('xyz')
nil
```

* * *

See also: matches, RegExp, search

Categories: Testing
