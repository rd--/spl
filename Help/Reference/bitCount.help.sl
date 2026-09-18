# bitCount

- _bitCount(n)_
- _bitCount([b₁ b₂ …])_

Answer the number of bits set to one in the integer _n_,
sometimes called the population count.

```
>>> 32.bitCount
1

>>> 31.bitCount
5

>>> 16rFF.bitCount
8
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

Threads over lists,
powers of two have one bit set:

```
>>> (2 ^ 3:9).bitCount
[1 1 1 1 1 1 1]
```

Plot sequence:

~~~spl svg=A
0:255.functionPlot(bitCount/1)
~~~

![](Help/Image/bitCount-A.svg)

* * *

See also: Binary, highBit
