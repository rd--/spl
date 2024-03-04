# removeIfAbsent

- _removeIfAbsent(aCollection, anObject, aBlock:/0)_

Remove the element _anObject_ from _aCollection_.
Answer the removed element.
If no such item exists answer _aBlock()_.

```
>>> [1 2 3].removeIfAbsent(5) { true }
true
```

* * *

See also: remove, removeAll

References:
_Smalltalk_
5.7.5.4

Categories: Removing
