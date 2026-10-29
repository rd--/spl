# lsCollect

- _lsCollect(α, β)_ ⟹ _α.collect(β)_

Answer a stream that applies β at each element of α.

```
>>> lsSeries(1, 1, 5).collect { :each |
>>> 	each * each
>>> }.upToEnd
[1 4 9 16 25]
```

* * *

See also: lsReject, lsSelect, lsWithCollect

Guides: Patterns and Streams

Categories: Stream
