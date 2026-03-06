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

Replace any sequence of space or tab or newline characters with a single space:

```
>>> RegularExpression('[ \t\n]+', 'g')
>>> .replaceAllWith(
>>> 	'a  b\t\tc\n\nd\n\t e',
>>> 	' '
>>> )
'a b c d e'
```

Delete any white space after opening brackets or commas or semicolons:

```
>>> RegularExpression(
>>> 	'([\\[\\(\\{,;])\\s+',
>>> 	'g'
>>> ).replaceAllWith(
>>> 	'( a, [ b, { c, d}, e], f); ',
>>> 	'$1'
>>> )
'(a,[b,{c,d},e],f);'
```

Delete any white space before closing brackets or commas or semicolons:

```
>>> RegularExpression(
>>> 	'\\s+([\\]\\)\\},;])',
>>> 	'g'
>>> ).replaceAllWith(
>>> 	'(a ,[b ,{c ,d } ,e ],f ) ;',
>>> 	'$1'
>>> )
'(a,[b,{c,d},e],f);'
```

* * *

See also: copyReplaceAllWith, replaceString, replaceStringAll, replaceWith

Guides: Regular Expression Functions

Categories: Replacing
