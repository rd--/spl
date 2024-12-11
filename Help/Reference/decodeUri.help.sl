# decodeUri

- _decodeUri(aString)_

Answer the Uri decoded form of _aString_.

```
>>> 'x%20y'.decodeUri
'x y'

>>> '%D1%88%D0%B5%D0%BB%D0%BB%D1%8B'
>>> .decodeUri
'шеллы'
```

The inverse is `encodeUri`:

```
>>> 'x%20y'.decodeUri.encodeUri
'x%20y'
```

* * *

See also: encodeUri

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/global-object.html#sec-decodeuri-encodeduri)
