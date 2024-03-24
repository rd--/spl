# bitNot

- _bitNot(anInteger | aBitSet)_

Answer bitwise not, i.e. invert bits.

```
>>> 3.bitNot
-4
```

-1 corresponds to having all bits on:

```
>>> 0.bitNot
-1

>>> 7.bitNot
-8

>>> 1:10.collect(bitNot:/1)
[-2 .. -11]
```

At `BitSet`, mutates set:

```
>>> let b = '1001'.asBitSet;
>>> b.bitNot;
>>> b.asString
'0110'
```

* * *

See also: bitAnd, bitOr

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitNot.html)

Categories: Bit Manipulation, Binary
