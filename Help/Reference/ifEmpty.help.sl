# ifEmpty

- _ifEmpty(c, f/0, g/0={c})_

Conditional evaluation.
If the collection _c_ has no elements answer the result of _f()_,
else answer _c_ or _g()_.

```
>>> [].ifEmpty { 1:9 }
1:9

>>> let c = 0L:8L;
>>> c.ifEmpty { } {
>>> 	c + 1L
>>> }
1L:9L
```

* * *

See also: if, ifFalse, ifNil, ifNotEmpty, ifNotNil, ifTrue, size

Guides: Collection Functions, Control Functions
