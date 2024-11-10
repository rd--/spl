# isAscii

- _isAscii(aCharacter | aString)_

Answer if _aCharacter_ in the Ascii character set,
or if all characters of _aString_ are.

```
>>> 'x'.isAscii
true

>>> 'ü'.isAscii
false

>>> 'ascii'.isAscii
true
```

Ascii does not include diacritics:

```
>>> 'Mačiūnas'.isAscii
false
```

The empty string is an ascii string:

```
>>> ''.isAscii
true
```

* * *

See also: Character

Categories: Testing, Text
