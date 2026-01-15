# bitSet

- _bitSet(n, k)_

Set the bit corresponding to the coefficient of _2^k_ in the integer _n_ to `one`.
`bitSet` sets the bit _k_ places from the right,
counting from `zero`.

Display coefficients at powers of 2 in the integer 42:

```
>>> 42.integerDigits(2)
[1 0 1 0 1 0]
```

Set the bit corresponding to the coefficient at _2^0_:

```
>>> 42.bitSet(0)
43

>>> 43.integerDigits(2)
[1 0 1 0 1 1]
```

Set the bit corresponding to the coefficient at _2^4_:

```
>>> 42.bitSet(4)
58

>>> 58.integerDigits(2)
[1 1 1 0 1 0]
```

Automatically creates an integer of the necessary size:

```
>>> 42.bitSet(9)
554

>>> 554.integerDigits(2)
[1 0 0 0 1 0 1 0 1 0]
```

Generate a number in which specified bits are set:

```
>>> [1 3 7].injectInto(0, bitSet:/2)
138
```

Compare to `bitAtPut`:

```
>>> 42.bitSet(7)
170

>>> 42.bitAtPut(8, 1)
170
```

* * *

See also: bitAt, bitAtPut, BitSet, highBit, integerDigits, setBitAt

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitSet.html)
