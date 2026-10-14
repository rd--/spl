# encodeUri

- _encodeUri(s)_

Answer the Uri encoded form of the string _s_.

```
>>> 'x y'.encodeUri
'x%20y'

>>> 'шеллы'.encodeUri
'%D1%88%D0%B5%D0%BB%D0%BB%D1%8B'
```

The inverse is `decodeUri`:

```
>>> 'x y'.encodeUri.decodeUri
'x y'
```

* * *

See also: decodeUri

Guides: Network Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-encodeuri-uri)

Categories: Text, Encoding
