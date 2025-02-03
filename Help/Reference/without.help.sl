# without

- _without(aCollection, anObject)_

Remove every element of _aCollection_ that compares equal to _anObject_,
and answer _aCollection_.

```
>>> let l = [1 2 2 3 3 3];
>>> (l.without(3), l)
([1 2 2], [1 2 2])
```

If no item matches, the collection is unchanged:

```
>>> let r = [1 2 3];
>>> (r.without(4) == r, r)
(true, [1 2 3])

>>> let r = [1 2 3].asSet(=);
>>> (r.without(4) == r, r.asList)
(true, [1 2 3])
```

* * *

See also: remove, removeAllEqualTo, withoutAll

Categories: Removing
