# LsN

- _LsN(α, β)_ ⟹ _α.repeat(β)_

Repeat α β times.

```
>>> LsN(LsSeries(1, 3, 3), 2).upToEnd
[1 4 7 1 4 7]
```

Equivalent to `repeat`:

```
>>> LsSeries(1, 3, 3).repeat(2).upToEnd
[1 4 7 1 4 7]
```

* * *

See also: LsForever

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pn.html)

Categories: Stream
