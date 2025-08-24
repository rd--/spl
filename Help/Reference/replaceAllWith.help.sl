# replaceAllWith

- _replaceAllWith(x, a, b)_

At `List`,
answer a copy of _x_ where all instances of _a_ are replaced with _b_:

```
>>> [1 2 3 1 2 1].replaceAllWith(2, -2)
[1 -2 3 1 -2 1]
```

At `RegularExpression`,
answer a new `String` in which all occurences of a string matching _x_ in _a_ are replaced with _b_:

```
>>> RegularExpression('x|z', 'g')
>>> .replaceAllWith('x y z', '-')
'- y -'
```

Replace every substring that has one or more occurrences of "ab" with "X":

```
>>> RegularExpression('(ab)+', 'g')
>>> .replaceAllWith(
>>> 	'ababbabbaaababa',
>>> 	'X'
>>> )
'XbXbaaXa'
```

* * *

See also: copyReplaceAllWith, replaceString, replaceStringAll, replaceWith

Guides: Regular Expression Functions

Categories: Replacing
