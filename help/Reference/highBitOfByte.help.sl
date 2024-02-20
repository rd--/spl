# highBitOfByte

_highBitOfByte(anInteger)_

Answer the high bit of _anInteger_ in the range (0, 255).

```
>>> 32.highBitOfByte
6

>>> 128.highBitOfByte
8
```

Consults a lookup table:

```
>>> system.highBitPerByteTable.first(16)
[0 1 2 2 3 3 3 3 4 4 4 4 4 4 4 4].asByteArray
```

* * *

See also: highBit
