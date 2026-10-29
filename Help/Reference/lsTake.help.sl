# lsTake

- _lsTake(α, β)_ ⟹ _α.take(β)_

Answer a stream that answers at most β elements of α and thereafter answers _nil_.

```
>>> lsTake(lsForever(1), 9).upToEnd
[1 1 1 1 1 1 1 1 1]

>>> lsForever(1).take(9).upToEnd
[1 1 1 1 1 1 1 1 1]
```

* * *

See also: lsFin, take

Guides: Patterns and Streams

Categories: Stream
