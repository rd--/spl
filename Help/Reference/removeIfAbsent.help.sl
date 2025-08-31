# removeIfAbsent

- _removeIfAbsent(c, x, f:/0)_

Remove the element _x_ from the collection _c_.
Answer the removed element.
If no such item exists answer _f()_.

```
>>> let c = [1 2 3];
>>> let x = c.removeIfAbsent(3) { nil };
>>> (c, x)
([1 2], 3)

>>> let c = [1 2 3];
>>> let x = c.removeIfAbsent(5) { nil };
>>> (c, x)
([1 2 3], nil)
```

* * *

See also: Removable, remove, removeAll

References:
_Smalltalk_
5.7.5.4

Categories: Removing
