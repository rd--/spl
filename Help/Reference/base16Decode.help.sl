# base16Decode

- _base16Decode(s)_

Answer the `ByteArray` encoded in Base-16 at the string _s_.

```
>>> '0102030405060708090A0B0C0D0E0F'
>>> .base16Decode
ByteArray([1 .. 15])
```

_Note_:
This is aliased with `parseBase16`.

* * *

See also: base64Decode, base16Encode, isBase16String

Guides: Parsing Functions

References:
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc4648),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseDecode.html),
_W_
[1](https://en.wikipedia.org/wiki/Hexadecimal)

Categories: Converting
