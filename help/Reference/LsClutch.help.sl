# LsClutch

- _LsClutch(input, latch, initialValue)_

Step through _input_ according to _latch_.
_latch_ should be a stream that answers a series of items that answer `asBoolean`.
If true the _input_ steps to the next item, if false the previous item is retained.
If _latch_ is initially false then _initialValue_ is consulted.

```
>>> LsClutch(LsSeries(1, 3, 5), LsSeq([true false true true false], inf), -1).upToEnd
[1 1 4 7 7 10 10 13]

>>> LsClutch(LsSeries(1, 3, 5), LsSeq([1 0 1 1 0], inf), -1).upToEnd
[1 1 4 7 7 10 10 13]
```

* * *

See also: LsDupEach

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pclutch.html)
