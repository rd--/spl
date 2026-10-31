# removeAllFoundIn

- _removeAllFoundIn!(c₁, c₂)_

Remove each element of the collection _c₂_ which is present in the collection _c₁_ in-place.
Answer _c₂_.

```
>>> let c = [1 2 2 3 3 3 4 4 4 4];
>>> (c, c.removeAllFoundIn!([2 3]))
([1 2 3 3 4 4 4 4], [2 3])
```

No error is raised if an element isn’t found:

```
>>> let c = [1 2 3];
>>> (c, c.removeAllFoundIn!([4]))
([1 2 3], [4])
```

* * *

See also: remove, removeAll, without

Guides: Dictionary Functions, List Functions
