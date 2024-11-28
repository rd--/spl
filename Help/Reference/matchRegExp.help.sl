# matchRegExp

- _matchRegExp(aString, aRegExp)_

Answer the part of _aString_ that matches _aRegExp.asRegExp_,
else `nil` if there is no match.

With `String` regular expression:

```
>>> 'caddar'.matchRegExp('c(a|d)+r')
'caddar'
```

With `RegExp` (compiled) regular expression:

```
>>> let r = RegExp('c(a|d)+r');
>>> '-caddar-'.matchRegExp(r)
'caddar'
```

Answer `nil` if no match:

```
>>> 'xyz'.matchRegExp('c(a|d)+r')
nil
```

Punctuation:

```
>>> '>>>'.matchRegExp('(-|>)+')
'>>>'

>>> '>- '.matchRegExp('(-|>)+')
'>-'
```

* * *

See also: asRegExp, match, matches, RegExp, search

Categories: Testing
