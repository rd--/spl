# replaceAllWith

- _replaceAllWith(aSequemce, old, new)_
- _replaceAllWith(aRegExp, aString, anotherString)_

In the `Sequence` case,
answer a copy of _aSequence_ where all instances of _old_ are replaced with _new_.

At `List`:

```
>>> [1 2 3 1 2 1].replaceAllWith(2, -2)
[1 -2 3 1 -2 1]
```

In the `RegExp` case,
answer a new `String` in which all occurences of a string matching _aRegExp_ in _aString_ are replaced with _anotherString_:

```
>>> RegExp('x|z', 'g')
>>> .replaceAllWith('x y z', '-')
'- y -'
```

Replace every substring that has one or more occurrences of "ab" with "X":

```
>>> RegExp('(ab)+', 'g')
>>> .replaceAllWith('ababbabbaaababa', 'X')
'XbXbaaXa'
```

* * *

See also: copyReplaceAllWith, replaceString, replaceStringAll, replaceWith

Categories: Replacing
