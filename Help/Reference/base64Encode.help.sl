# base64Encode

- _base64Encode(b)_

Answer the byte array _b_ encoded as a Base-64 `String`.

Encode plain text:

```
>>> 'Hello World'.asciiByteArray
>>> .base64Encode
'SGVsbG8gV29ybGQ='
```

Encode bytes:

```
>>> [1 .. 20].asByteArray
>>> .base64Encode
'AQIDBAUGBwgJCgsMDQ4PEBESExQ='
```

Encode Json:

```
>>> '{1, 2, 3, 4, 5}'.asciiByteArray
>>> .base64Encode
'ezEsIDIsIDMsIDQsIDV9'
```

* * *

See also: base16Encode, base64Decode

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseEncode.html)

Categories: Converting
