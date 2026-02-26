# nor

- _nor(a, b:/0)_

Answer `true` if _a_ and _b()_ are both `false`, else `false`.

Truth table:

```
>>> let i = [true, false];
>>> { :a :b |
>>> 	a.nor { b }
>>> }.table(i, i)
[
	false false;
	false true
]
```

* * *

See also: and, not, or

Guides: Boolean Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Logical_NOR)
