# asLargeInteger

- _asLargeInteger(x)_

Convert a `SmallFloat` or a `ByteArray` into a `LargeInteger`.

At `SmallFloat`:

```
>>> let i = 2 ^ 23;
>>> let j = i.asLargeInteger;
>>> (i, j, i = j, i == j, j.isLargeInteger)
(8388608, 8388608L, true, false, true)
```

At `LargeInteger`:

```
>>> 8388608L.asLargeInteger
8388608L
```

At `ByteArray`:

```
>>> [1 3 5 7].asByteArray.asLargeInteger
(1L + (3 << 8) + (5 << 16) + (7 << 24))

>>> let n = 117768961L;
>>> 1:4.collect { :each |
>>> 	n.digitAt(each)
>>> }
[1L 3L 5L 7L]

>>> [
>>> 	245 124 239 253 184
>>> 	104 49 179 174 168
>>> 	5 89 18
>>> ].asByteArray.asLargeInteger
1453657932340170668622419557621L
```

* * *

See also: ByteArray, isSmallInteger, LargeInteger

Categories: Converting
