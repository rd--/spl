# bitCount

- _bitCount(anInteger | aByteArray)_

Answer the number of bits set to 1 in _anInteger_.

```
>>> 32.bitCount
1

>>> 31.bitCount
5
```

At `ByteArray`, sum `bitCount` of each byte:

```
>>> 5.encodeInt32(true).bitCount
2

>>> -5.encodeInt32(true).bitCount
31
```

Plot sequence:

~~~spl svg=A
0:255.functionPlot(bitCount:/1)
~~~

![](sw/spl/Help/Image/bitCount-A.svg)

* * *

See also: Binary, highBit
