# LsSeq

- _LsSeq(α, β)_ ⟹ _LsN(LsCat(α), β)_

Repeat the `LsCat` of α β times.

```
>>> LsSeq([LsGeom(1, 3, 3), -1, LsSeries(1, 3, 3)], 2).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

Equivalent to `LsN`, or `repeat`, of `LsCat`:

```
>>> LsCat([LsGeom(1, 3, 3), -1, LsSeries(1, 3, 3)]).repeat(2).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

* * *

See also: LsCat, LsN, LsSer

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pseq.html)

Categories: Stream
