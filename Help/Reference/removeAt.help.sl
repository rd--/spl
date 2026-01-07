# removeAt

- _removeAt(c, i)_

Remove the element at the index _i_ from the collection _c_.
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

If is an error if the index is not valid:

```
>>> let l = [1 2 3 4 5];
>>> { l.removeAt(7) }.hasError
true
```

At `Record`, alias for `removeKey`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAt('y'), r)
(2, (x: 1, z: 3))
```

* * *

See also: at, insertAt, removeAtAll, removeFirst, removeKey, removeLast

Categories: Removing
