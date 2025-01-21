# unsigned32BitWordList

- _unsigned32BitWordList(aSmallFloat)_

Answer the two unsigned 32-bit words of the byte representation of _aSmallFloat_.
The words are in machine order.

```
>>> 0.unsigned32BitWordList
[0 0]

>>> 1.unsigned32BitWordList
[0 16r3FF00000]

>>> 2.pi.unsigned32BitWordList
[1413754136 1075388923]
```

* * *

See also: byteOrdering
