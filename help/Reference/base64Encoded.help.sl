# base64Encoded

- _base64Encoded(aByteArray)_

Encode _aByteArray_ as a Base64 string.
The answer is a String.

```
>>> 'Hello World'.ascii.base64Encoded
'SGVsbG8gV29ybGQ='

>>> [1 .. 20].asByteArray.base64Encoded
'AQIDBAUGBwgJCgsMDQ4PEBESExQ='

>>> '{1, 2, 3, 4, 5}'.ascii.base64Encoded
'ezEsIDIsIDMsIDQsIDV9'
```

* * *

See also: base64Decoded

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseEncode.html)

Categories: Converting
