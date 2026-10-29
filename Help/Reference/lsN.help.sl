# lsN

- _lsN(α, β)_ ⟹ _α.repeat(β)_

Repeat α β times.

```
>>> lsN(lsSeries(1, 3, 3), 2).upToEnd
[1 4 7 1 4 7]
```

Equivalent to `repeat`:

```
>>> lsSeries(1, 3, 3).repeat(2).upToEnd
[1 4 7 1 4 7]
```

* * *

See also: lsForever, lsSeries

Guides: Patterns and Streams

References:
_Python_
[1](https://docs.python.org/3/library/itertools.html#itertools.repeat),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pn.html)

Categories: Stream
