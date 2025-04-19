# bitAt

- _bitAt(anInteger | aBitSet, k)_

Answer the bit corresponding to the coefficient of _2 ^ (k - 1)_ in _anInteger_ or _aBitSet_.
`bitAt` gets the bit _k - 1_ places from the right.
`bitAt` represents the bits it retrieves as 0 or 1.

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

See also: Binary, bitAtPut, bitClear, BitSet, highBit, integerDigits

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitGet.html),
_Smalltalk_
5.6.5.5

Categories: Accessing, Bit Manipulation
