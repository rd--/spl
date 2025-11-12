# codePoint

- _codePoint(c)_

Answer the Unicode code point of the character _c_.

At `String`:

```
>>> ' '.codePoint
32

>>> 'π'.codePoint
16r03C0

>>> 'a'.codePoint
97

>>> '€'.codePoint
8364
```

It is an error if the string has more than one place:

```
>>> { 'xy'.codePoint }.hasError
true
```

At `Character`:

```
>>> Character(32).codePoint
16r0020
```

The inverse is `fromCodePoint`:

```
>>> 8364.fromCodePoint
'€'
```

* * *

See also: asCharacter, asciiValue, Character, String

Guides: String Functions

References:
_Python_
[1](https://docs.python.org/3/library/functions.html#ord),
_Smalltalk_
5.3.4.5,
_Tc39_
[1](https://tc39.es/ecma262/multipage/text-processing.html#sec-string.prototype.codepointat)
_Unicode_
[1](https://unicode.org/ucd/)

Categories: Accessing
