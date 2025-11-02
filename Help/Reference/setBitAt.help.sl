# setBitAt

- _setBitAt(b, n)_

Set the value at the BitSet _b_ corresponding to the integer _n_ to 1.
Answer `true` if the value was not already 1, else false.

```
>>> let b = [1 3 9].asBitSet;
>>> (b.setBitAt(6), b.asList)
(true, [1 3 6 9])
```

* * *

See also: bitAt, bitAtPut, BitSet

Guides: Bitwise Functions
