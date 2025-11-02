# codePoint

- _codePoint(c)_

Answer the Unicode code point of the character _c_.

```
>>> ' '.codePoint
32

>>> 32.asCharacter.codePoint
16r0020

>>> 'π'.codePoint
16r03C0

>>> 'a'.codePoint
97

>>> '€'.codePoint
8364
```

The inverse is `asCharacter`:

```
>>> 8364.asCharacter
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
