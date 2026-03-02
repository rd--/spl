# nor

- _nor(b, f:/0)_

An alias for `notOr`.

Truth table:

```
>>> { :a :b |
>>> 	a.nor { b }
>>> }.table([true false], [true false])
[
	false false;
	false true
]
```

* * *

See also: notOr

Guides: Boolean Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Logical_NOR)
