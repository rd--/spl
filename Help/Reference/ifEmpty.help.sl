# ifEmpty

- _ifEmpty(c, f:/0, g:/1)_

Conditional evaluation.
If the collection _c_ has no elements answer the result of  _f_,
else answer _c_ or _g.cull(c)_.

```
>>> [].ifEmpty { 1:9 }
1:9

>>> 0:8.ifEmpty { } { :x |
>>> 	x + 1
>>> }
1:9
```

* * *

See also: if, ifFalse, ifNil, ifNotNil, ifTrue, size

Guides: Control Functions

Categories: Evaluating
