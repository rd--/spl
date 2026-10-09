# withIndexDo

- _withIndexDo(c, f/2)_

Like `withDo` except that the iteration index for the collection _c_ supplies the second argument to the block _f_.
Answers `nil`.

At `Range`, iterate over indices and values:

```
>>> let a = [];
>>> (4, 3 .. 1).withIndexDo { :x :i |
>>> 	a.add!(i -> x)
>>> };
>>> a
[1 -> 4, 2 -> 3, 3 -> 2, 4 -> 1]
```

At `Record`:

>>> let a = [];
>>> (x: 1, y: 2, z: 3).withIndexDo { :x :i |
>>> 	a.add!(i -> x)
>>> };
>>> a
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

* * *

See also: do, indices, indicesDo, keysAndValuesDo, withDo, withIndexCollect, withIndexReplace

Guides: Iteration Functions

Categories: Enumerating
