# base64Decoded

_base64Decoded(aString)_

Decode _aString_ from base 64.
The answer is a ByteArray.

```
>>> 'SGVsbG8gV29ybGQ='.base64Decoded.asciiString
'Hello World'

>>> 'AQIDBAUGBwgJCgsMDQ4PEBESExQ='.base64Decoded
[1 .. 20].asByteArray

>>> let encoded = 'ezEsIDIsIDMsIDQsIDV9';
>>> let decoded = encoded.base64Decoded;
>>> (decoded.asList, decoded.asciiString)
([123 49 44 32 50 44 32 51 44 32 52 44 32 53 125], '{1, 2, 3, 4, 5}')
```

Out of range values raise an error:

```
>>> { 'ABαCD'.base64Decoded }.ifError { true }
true
```

* * *

See also: base64Encoded

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseDecode.html)

Categories: Converting
