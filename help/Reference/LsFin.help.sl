# LsFin

- _LsFin(α, β)_ ⟹ _β.take(α)_

Answer a stream that answers at most α elements of β and thereafter answers _nil_.

```
>>> LsFin(9, LsForever(1)).upToEnd
[1 1 1 1 1 1 1 1 1]
```

Equivalent to `take`:

```
>>> LsForever(1).take(9).upToEnd
[1 1 1 1 1 1 1 1 1]
```

* * *

See also: LsTake

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pfin.html)
