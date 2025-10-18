# isAscii

- _isAscii(s)_

Answer if the character _s_ in the Ascii character set,
or if all characters of the string _s_ are.

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

Guides: String Functions

Categories: Testing, Text
