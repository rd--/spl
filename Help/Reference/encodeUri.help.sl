# encodeUri

- _encodeUri(s)_

Answer the Uri encoded form of the string _s_.

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

See also: decodeUri

Guides: Network Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-encodeuri-uri)

Categories: Text, Encoding
