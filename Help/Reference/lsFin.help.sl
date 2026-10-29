# lsFin

- _lsFin(α, β)_ ⟹ _β.take(α)_

Answer a stream that answers at most α elements of β and thereafter answers _nil_.

```
>>> lsFin(9, lsForever(1)).upToEnd
[1 1 1 1 1 1 1 1 1]
```

Equivalent to `take`:

```
>>> lsForever(1).take(9).upToEnd
[1 1 1 1 1 1 1 1 1]
```

* * *

See also: lsForever, lsTake

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pfin.html)

Categories: Stream
