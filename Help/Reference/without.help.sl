# without

- _without(c, x)_

Remove every element of the collection _c_ that compares equal to the object _x_,
and answer _c_.

```
>>> let c = [1 2 2 3 3 3];
>>> (c.without(3), c)
([1 2 2], [1 2 2])
```

If no item matches, the collection is unchanged:

```
>>> let c = [1 2 3];
>>> (c.without(4) == c, c)
(true, [1 2 3])

>>> let c = [1 2 3].Set;
>>> (c.without(4) == c, c.asList)
(true, [1 2 3])
```

* * *

See also: remove, removeAllEqualTo, withoutAll

Guides: Dictionary Functions, List Functions

Categories: Removing
