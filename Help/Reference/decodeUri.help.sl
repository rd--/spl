# decodeUri

- _decodeUri(s)_

Answer the Uri decoded form of the string _s_.

```
>>> 'x%20y'.decodeUri
'x y'

>>> [
>>> 	37 68 49 37 56 56 37 68 48 37
>>> 	66 53 37 68 48 37 66 66 37 68
>>> 	48 37 66 66 37 68 49 37 56 66
>>> ].asciiString.decodeUri
'шеллы'
```

The inverse is `encodeUri`:

```
>>> 'x%20y'.decodeUri.encodeUri
'x%20y'
```

* * *

See also: encodeUri

Guides: Network Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-decodeuri-encodeduri)

Categories: Text, Encoding
