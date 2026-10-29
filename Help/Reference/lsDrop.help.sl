# lsDrop

- _lsDrop(α, β)_ ⟹ _α.drop(β)_

Answer a stream that skips the first β elements of α.

```
>>> lsDrop(lsSeries(1, 1, 9), 3).upToEnd
[4 .. 9]
```

This is equivalent to `drop`:

```
>>> lsSeries(1, 1, 9).drop(3).upToEnd
[4 .. 9]
```

* * *

See also: lsTake, drop

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pdrop.html)

Categories: Stream
