# notOr

- _notOr(b, f:/0)_

Not or,
often abbreviated _nor_,
answer `true` if _b_ and _f()_ are both `false`,
else `false`.

Truth table:

```
>>> { :a :b |
>>> 	a.notOr { b }
>>> }.table([true false], [true false])
[
	false false;
	false true
]
```

* * *

See also: and, not, notAnd, or

Guides: Boolean Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Logical_NOR)
