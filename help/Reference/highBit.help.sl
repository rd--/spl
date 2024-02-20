# highBit

_highBit(anInteger)_

Answer the number of bits required to represent _anInteger_.

```
>>> 32.highBit
6
```

Radix two notation indicates this directly:

```
>>> 2r00100000
32

>>> 2r00100000.highBit
6
```

The state of lower bits does not affect the answer:

```
>>> 2r00101000
(8 + 32)

>>> 2r00101000.highBit
6
```

High bit is not defined for negative integers:

```
>>> { 2r00101000.negated.highBit }.ifError { true }
true
```

* * *

See also: Binary, highBitOfMagnitude, lowBit
