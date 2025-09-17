# crc16

- _crc16(b)_

Compute a 16 bit cyclic redundancy check of the `ByteArray` _b_.
Implements _CRC-16/ARC_, see <https://reveng.sourceforge.io/crc-catalogue/16.htm>

At `ByteArray`:

```
>>> [115 116 114 105 110 103]
>>> .asByteArray
>>> .crc16
58909
```

In the `String` case the check is made of the `utf8ByteArray` of the string:

```
>>> 'string'.crc16
58909

>>> 'string'.utf8ByteArray.crc16
58909
```

* * *

See also: ByteArray, hash, fnv1aHash, String, utf8ByteArray

Guides: String Functions

Categories: Comparing
