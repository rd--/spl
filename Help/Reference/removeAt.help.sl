# removeAt!

- _removeAt!(c, i)_

Remove the element at the index _i_ from the collection _c_ in-place.
Answers the removed element.

Remove first item of a `List`, see also `removeFirst`:

```
>>> let l = [1 2 3 4 5];
>>> (l.removeAt!(1), l)
(1, [2 3 4 5])
```

Remove third item:

```
>>> let l = [1 2 3 4 5];
>>> (l.removeAt!(3), l)
(3, [1 2 4 5])
```

If is an error if the index is not valid:

```
>>> let l = [1 2 3 4 5];
>>> { l.removeAt!(7) }.hasError
true
```

At `Record`, alias for `removeKey`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> (r.removeAt!('y'), r)
(2, (x: 1, z: 3))
```

Copying form:

```
>>> let a = [1 2 -3 4];
>>> let b = a.removeAt(3);
>>> (a, b)
([1 2 -3 4], [1 2 4])

>>> let a = (a: 1, b: 2, c: 3);
>>> let b = a.removeAt('c');
>>> (a, b)
((a: 1, b: 2, c: 3), (a: 1, b: 2))
```

* * *

See also: at, insertAt, removeAtAll, removeFirst, removeKey, removeLast

Categories: Removing
