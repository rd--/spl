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
answers a `BitSet` of with indices at character set to `one`.
If the _capacity_ is omitted it is set to the `size` of the string.

```
>>> let s = '101011010101';
>>> let b = s.asBitSet;
>>> let l = b.asList;
>>> (b.capacity, b.size, l)
(12, 7, [0 2 4 5 7 9 11])
```

* * *

See also: BitSet

Categories: Converting
