# match

- _match(aRegExp, aString)_

Answer the part of _aString_ that matches _aRegExp_,
else `nil` if there is no match.

Match entire string:

```
>>> RegExp('c(a|d)+r').match('caddar')
'caddar'
```

Match interior string:

```
>>> RegExp('c(a|d)+r').match('-caddar-')
'caddar'
```

No match:

```
>>> RegExp('c(a|d)+r').match('xyz')
nil
```

Match prefix:

```
>>> RegExp('(-|>)+').match('>>> ')
'>>>'
```

Match prefix:

```
>>> RegExp('(-|>)+').match('>- ')
'>-'
```

* * *

See also: matches, matchRegExp, RegExp, search

Categories: Testing
