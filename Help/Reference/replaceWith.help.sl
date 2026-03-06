# replaceWith

- _replaceWith(r, a, b)_

Replace first occurence of a string matching the regular expression _r_ in the string _a_ with _b_:

```
>>> RegularExpression('x|z')
>>> .replaceWith(
>>> 	'x y z',
>>> 	'-'
>>> )
'- y z'
```

Rewrite words _a b_ as _b, a_:

```
>>> RegularExpression(
>>> 	'(\\w+)\\s(\\w+)'
>>> ).replaceWith(
>>> 	'Emily Bronte',
>>> 	'$2, $1'
>>> )
'Bronte, Emily'
```

* * *

See also: replace, replaceString, replaceStringAll, replaceAllWith

Guides: Regular Expression Functions

Categories: Replacing
