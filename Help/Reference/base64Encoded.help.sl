# base64Encoded

- _base64Encoded(aByteArray)_

Answer _aByteArray_ encoded as a Base64 `String`.

Encode plain text:

```
>>> 'Hello World'.asciiByteArray.base64Encoded
'SGVsbG8gV29ybGQ='
```

Encode bytes:

```
>>> [1 .. 20].asByteArray.base64Encoded
'AQIDBAUGBwgJCgsMDQ4PEBESExQ='
```

Encode Json:

```
>>> '{1, 2, 3, 4, 5}'.asciiByteArray.base64Encoded
'ezEsIDIsIDMsIDQsIDV9'
```

* * *

See also: base64Decoded

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseEncode.html)

Categories: Converting
