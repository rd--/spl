# withIndexDo

- _withIndexDo(c, f:/2)_

Like `withDo` except that the iteration index for the collection _c_ supplies the second argument to the block _f_.

At `Range`, iterate over indices and values:

```
>>> let l = [];
>>> (3 .. 1).withIndexDo { :each :index |
>>> 	l.add(each -> index)
>>> };
>>> l
[3 -> 1, 2 -> 2, 1 -> 3]
```

* * *

See also: do, indices, indicesDo, keysAndValuesDo, withDo, withIndexCollect, withIndexReplace

Guides: Iteration Functions

Categories: Enumerating
