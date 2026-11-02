# afterIfAbsent

- _afterIfAbsent(c, x, f/0)_

Answer the element after _x_ in the collection _c_,
or the result of _f()_ if _x_ is not present or if there are no elements after it.

```
>>> 1:9.afterIfAbsent(9) { true }
true
```

* * *

See also: after

Guides: Sequence Functions

References:
_Smalltalk_
5.7.8.3
