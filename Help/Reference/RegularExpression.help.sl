# RegularExpression

- _RegularExpression(source, flags)_

A `Type` holding a _regular expression_.

`flags` answers the _flags_ `String` for the expression,
which is set when the expression is defined.

`hasIndices` answers `true` if the 'd' flag is set, else `false`.

`isGlobal` answers `true` if the 'g' flag is set, else `false`.

`source` answer the _source_ text `String` for the expression,
which is set when the expression is defined.

* * *

See also: asRegularExpression, flags, hasIndices, isGlobal, matches, source

Guides: Regular Expression Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegularExpression.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/text-processing.html#sec-regexp-regular-expression-objects)
