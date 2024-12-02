# removeAt

- _removeAt(aCollection, anInteger)_

Remove the element at the index _anInteger_ from _aCollection_.
Answers the removed element.

Remove first item of a `List`, see also `removeFirst`:

```
>>> let l = [1 2 3 4 5];
>>> (l.removeAt(1), l)
(1, [2 3 4 5])
```

Remove third item:

```
>>> let l = [1 2 3 4 5];
>>> (l.removeAt(3), l)
(3, [1 2 4 5])
```

At `Record`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAt('y'), r)
(2, (x: 1, z: 3))
```

* * *

See also: at, insertAt, removeFirst, removeLast

Categories: Removing
