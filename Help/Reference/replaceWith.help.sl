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

* * *

See also: replace, replaceString, replaceStringAll, replaceAllWith

Categories: Replacing
