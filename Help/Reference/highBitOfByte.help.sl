# highBitOfByte

- _highBitOfByte(n)_

Answer the high bit of the integer _n_ in the range (0, 255).

At `Float`:

```
>>> 32.highBitOfByte
6L
```

At `Integer`:

```
>>> 128L.highBitOfByte
8L
```

Consults a lookup table:

```
>>> system.highBitPerByteTable
>>> .first(16)
[
	0 1 2 2 3 3 3 3
	4 4 4 4 4 4 4 4
]
```

* * *

See also: highBit, highBitOfInteger

Guides: Bitwise Functions
