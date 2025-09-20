# fillFrom

- _fillFrom(c₁, c₂)_

Use the element of the collection _c₂_ to fill the collection _c₁_.
Answer _c₁_.
It is an `error` if the collections are not of equal size.

```
>>> let p = [1 .. 9];
>>> let q = List(9);
>>> let r = q.fillFrom(p);
>>> (q, p !== q, q == r)
(p, true, true)
```

* * *

See also: fillFromWith

Guides: List Functions
