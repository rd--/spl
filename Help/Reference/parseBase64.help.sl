# parseBase64

- _parseBase64(s)_

Answer the `ByteArray` encoded in Base-64 at the string _s_.

```
>>> 'AQIDBAUGBwgJCgsMDQ4PEB'
>>> .parseBase64
[1 .. 16].asByteArray
```

This is another name for `base64Decode`.

* * *

See also: base64Decode, base64Encode, parseBase16

Guides: Parsing Functions

Categories: Converting
