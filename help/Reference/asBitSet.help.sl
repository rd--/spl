# asBitSet

- _asBitSet(aCollection | aString, capacity)_

In the `Collection` case,
answer a `BitSet` with the indices at _aCollection_ set to `one`.
Valid indices start from `zero`.
If the _capacity_ is omitted it is set to one more than the largest index.

```
>>> let l = [0 2 4 5 7 9 11];
>>> let b = l.asBitSet;
>>> (b.capacity, b.size, b.asString)
(12, 7, '101011010101')
```

In the `String` case,
answers a `BitSet` with indices set at places where the corresponding character is `one`.
If the _capacity_ is omitted it is set to the `size` of the string.

```
>>> let s = '101011010101';
>>> let b = s.asBitSet;
>>> let l = b.asList;
>>> (b.capacity, b.size, l)
(12, 7, [0 2 4 5 7 9 11])
```

In the particular case of `ByteArray`,
create a `BitSet` that utilises the given array as its backing store,
deriving the `capacity` and the `tally` from the size and contents of the array.
Print the 32-bit twos-complement encodings of five and negative five:

```
>>> 5.encodeInt32(true).asBitSet.asString
'10100000000000000000000000000000'

>>> -5.encodeInt32(true).asBitSet.asString
'11011111111111111111111111111111'
```

* * *

See also: BitSet

Categories: Converting
