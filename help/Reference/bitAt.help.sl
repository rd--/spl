# bitAt

- _bitAt(n, k)_

Answer the bit corresponding to the coefficient of _2 ^ (k - 1)_ in the integer _n_.
_bitAt_ gets the bit _k - 1_ places from the right.
_bitAt_ represents the bits it retrieves as 0 or 1.

Display coefficients at powers of 2 in the integer 42:

```
>>> 42.integerDigits(2)
[1 0 1 0 1 0]
```

Get the bit corresponding to the coefficient at 2 ^ 0:

```
>>> 42.bitAt(1)
0
```

Get the bit corresponding to the coefficient at 2 ^ 3:

```
>>> 42.bitAt(4)
1
```

* * *

See also: bitAtPut, bitClear, BitSet, highBit, integerDigits

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitGet.html)
