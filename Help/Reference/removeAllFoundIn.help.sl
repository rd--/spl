# removeAllFoundIn

- _removeAllFoundIn(c₁, c₂)_

Remove each element of the collection _c₂_ which is present in the collection _c₁_.
Answer _c₂_.
No error is raised if an element isn’t found.

```
>>> let c = [1 2 2 3 3 3 4 4 4 4];
>>> let r = c.removeAllFoundIn([2 3]);
>>> (r, c)
([2 3], [1 2 3 3 4 4 4 4])
```

* * *

See also: remove, removeAll without

Guides: Dictionary Functions, List Functions
