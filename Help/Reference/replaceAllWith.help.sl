# replaceAllWith

- _replaceAllWith(aRegExp, aString, anotherString)_

Replace all occurences of a string matching _aRegExp_ in _aString_ with _anotherString_:

```
>>> RegExp('x|z', 'g').replaceAllWith('x y z', '-')
'- y -'
```

Replace every substring that has one or more occurrences of "ab" with "X":

```
>>> RegExp('(ab)+', 'g').replaceAllWith('ababbabbaaababa', 'X')
'XbXbaaXa'
```

* * *

See also: replaceString, replaceStringAll, replaceAllWith

Categories: Replacing
