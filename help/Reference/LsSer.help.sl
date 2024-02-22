# LsSer

- _LsSer(α, β)_ ⟹ _LsTake(LsCyc(α), β)_

Take the first β items of the _LsCyc_ of α.

```
>>> LsSer([LsGeom(1, 3, 3), -1, LsSeries(1, 3, 3)], 14).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

* * *

See also: LsCat, LsN, LsSeq, LsTake
