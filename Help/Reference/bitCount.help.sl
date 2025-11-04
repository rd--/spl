# bitCount

- _bitCount(n)_
- _bitCount([b₁ b₂ …])_

Answer the number of bits set to one in the integer _n_.

```
>>> 32.bitCount
1

>>> 31.bitCount
5
```

At `BitSet`:

```
>>> BitSet([0 4 7], 12).bitCount
3
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
