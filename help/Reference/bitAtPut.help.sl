# bitAtPut

- _bitAtPut(n, k, b)_

Set the bit corresponding to the coefficient of _2 ^ (k - 1)_ in the integer _n_ to _b_.
_bitAtPut_ sets the bit _k - 1_ places from the right.

Display coefficients at powers of 2 in the integer 42:

```
>>> 42.integerDigits(2)
[1 0 1 0 1 0]
```

Set the bit corresponding to the coefficient at 2 ^ 0:

```
>>> 42.bitAtPut(1, 1)
43

>>> 43.integerDigits(2)
[1 0 1 0 1 1]
```

Automatically creates an integer of the necessary size:

``
```
>>> 42.bitAtPut(10, 1)
554

>>> 554.integerDigits(2)
[1 0 0 0 1 0 1 0 1 0]
```

Generate a number in which specified bits are set:

```
>>> let n = 0;
>>> [2 4 8].do { :each | n := n.bitAtPut(each, 1) };
>>> n
138
```

Show which bits have been set:

```
>>> 138.integerDigits(2)
[1 0 0 0 1 0 1 0]
```

* * *

See also: bitAt, bitClear, BitSet, highBit, integerDigits

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitSet.html),
_Smalltalk_
5.6.5.6
