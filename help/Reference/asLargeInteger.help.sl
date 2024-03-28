# asLargeInteger

- _asLargeInteger(aSmallFloat | aByteArray)_

Convert a `SmallFloat` or a `ByteArray` into a `LargeInteger`.

At `SmallFloat`:

```
>>> (2 ^ 23).asLargeInteger
8388608n
```

At `ByteArray`:

```
>>> [1 3 5 7].asByteArray.asLargeInteger
(1n + (3 << 8) + (5 << 16) + (7 << 24))

>>> let n = 117768961n;
>>> 1:4.collect { :each | n.digitAt(each) }
[1n 3n 5n 7n]

>>> [245 124 239 253 184 104 49 179 174 168 5 89 18].asByteArray.asLargeInteger
1453657932340170668622419557621n
```

* * *

See also: ByteArray, isSmallInteger, LargeInteger

Categories: Converting
