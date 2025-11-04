# asBitSet

- _asBitSet(x)_

At `List` requires a bit vector:

```
>>> [1 0 1 0 1 1 0 1 0 1 0 1]
>>> .asBitSet
BitSet([0 2 4 5 7 9 11], 12)
```

At `String`:

```
>>> '101011010101'.asBitSet
BitSet([0 2 4 5 7 9 11], 12)
```

In the particular case of `ByteArray`,
create a `BitSet` that utilises the given array as its backing store,
deriving the `capacity` and the `tally` from the size and contents of the array.
Print the 32-bit twos-complement encodings of five and negative five:

```
>>> 5.encodeInt32(true)
>>> .asBitSet
>>> .asString
'10100000000000000000000000000000'

>>> -5.encodeInt32(true)
>>> .asBitSet
>>> .asString
'11011111111111111111111111111111'
```

* * *

See also: BitSet

Guides: Bitwise Functions

Categories: Converting
