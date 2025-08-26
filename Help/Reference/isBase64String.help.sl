# isBase64String

- _isBase64String(aString)_

Answer `true` if _aString_ represents a Base-64 encoded value.
The alphabet consists of the digits _0-9_,
the letters _a-z_ and _A-Z_,
and the symbols _+_ and _/_.

```
>>> '0123456789'
>>> .isBase64String
true

>>> 'abcdefghijklmnopqrstuvwxyz'
>>> .isBase64String
true

>>> 'abcdefghijklmnopqrstuvwxyz'
>>> .asUpperCase
>>> .isBase64String
true

>>> '+/'
>>> .isBase64String
true

>>> 10 + 26 + 26 + 2
64
```

The empty string answers `false`:

```
>>> ''.isBase64String
false
```

No other punctation characters are in the alphabet:

```
>>> '~!#$%^&*()-=:;,<.>'
>>> .contents
>>> .anySatisfy(isBase64String:/1)
false
```

* * *

See also: asNumber, base64Decode, base64Encode, isBooleanString, isFloatString, isDecimalIntegerString

Guides: Parsing Functions

References:
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc4648),
_W_
[1](https://en.wikipedia.org/wiki/Base64)

Categories: Testing
