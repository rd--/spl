# atModify

_atModify(aCollection, index, aBlock:/1)_

Replace the element of the collection with itself transformed by the block.

```
>>> let l = [1 2 3];
>>> l.atModify(2, squared:/1) = 4 & { l = [1 4 3] }
true
```

* * *

See also: at, atPut

Categories: Accessing
