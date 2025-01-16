# LsCollect

- _LsCollect(α, β)_ ⟹ _α.collect(β)_

Answer a stream that applies β at each element of α.

```
>>> LsSeries(1, 1, 5).collect { :each |
>>> 	each * each
>>> }.upToEnd
[1 4 9 16 25]
```

* * *

See also: LsReject, LsSelect, LsWithCollect

Guides: Patterns and Streams

Categories: Stream
