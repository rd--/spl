# encodeUri

- _encodeUri(aString)_

Answer the Uri encoded form of _aString_.

```
>>> 'x y'.encodeUri
'x%20y'
```

The inverse is `decodeUri`:

```
>>> 'x y'.encodeUri.decodeUri
'x y'
```

* * *

See also: encodeUri

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-encodeuri-uri)
