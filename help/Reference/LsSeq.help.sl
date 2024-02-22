# LsSeq

- _LsSeq(α, β)_ ⟹ _LsN(LsCat(α), β)_

Repeat the _LsCat_ of α β times.

```
>>> LsSeq([LsGeom(1, 3, 3), -1, LsSeries(1, 3, 3)], 2).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

* * *

See also: LsCat, LsN, LsSer
