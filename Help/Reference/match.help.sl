# match

- _match(aRegExp, aString)_

Answer the part of _aString_ that matches _aRegExp_, else `nil` if there is no match.

```
>>> RegExp('c(a|d)+r').match('caddar')
'caddar'

>>> RegExp('c(a|d)+r').match('-caddar-')
'caddar'

>>> RegExp('c(a|d)+r').match('xyz')
nil

>>> RegExp('(-|>)+').match('>>> ')
'>>>'

>>> RegExp('(-|>)+').match('>- ')
'>-'
```

* * *

See also: matches, matchRegExp, RegExp, search

Categories: Testing
