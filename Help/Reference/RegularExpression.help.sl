# RegularExpression

- _RegularExpression(source, flags='d')_

A `Type` holding a _regular expression_.

`flags` answers the _flags_ `String` for the expression,
which is set when the expression is defined.

`hasIndices` answers `true` if the 'd' flag is set, else `false`.

`isGlobal` answers `true` if the 'g' flag is set, else `false`.

`source` answer the _source_ text `String` for the expression,
which is set when the expression is defined.

At `String`,
compiles _x_ to a regular expression:

```
>>> RegularExpression'a|b'
RegularExpression('a|b', 'd')

>>> 'caddr'.matchesRegularExpression(
>>> 	RegularExpression'c(a|d)+r'
>>> )
true
```

At `RegularExpression` answers _x_:

```
>>> let r = RegularExpression'a|b';
>>> RegularExpression(r) == r
true
```

* * *

See also: String, flags, hasIndices, isGlobal, matches, matchesRegularExpression, source

Guides: Regular Expression Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegularExpression.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/text-processing.html#sec-regexp-regular-expression-objects)
