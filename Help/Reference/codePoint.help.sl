# codePoint

- _codePoint(aString | aCharacter)_

Answer the Unicode code point of a character.

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

References:
_Python_
[1](https://docs.python.org/3/library/functions.html#ord),
_Smalltalk_
5.3.4.5,
_Unicode_
[1](https://unicode.org/ucd/)

Categories: Accessing
