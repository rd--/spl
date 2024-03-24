# setBitAt

- _setBitAt(aBitSet, anInteger)_

Set the value corresponding to _anInteger_ to 1.
Answer `true` if the value was not already 1, else false.

```
>>> let b = [1 3 9].asBitSet;
>>> (b.setBitAt(6), b.asList)
(true, [1 3 6 9])
```

* * *

See also: bitAt, bitAtPut, BitSet
