# declareFrom

- _declareFrom(d₁, k, d₂)_

Add the key _k_ to the dictionary _d₁_.
If the key already exists, do nothing.
If _d₂_ includes key,
then remove it from _d₂_ and use its association as the element of _d₁_.

```
>>> let p = (x: 1);
>>> let q = (y: 2);
>>> p.declareFrom('y', q);
>>> [p, q]
[(x: 1, y: 2), (:)]
```

* * *

See also: add, Dictionary

Guides: Dictionary Functions

Categories: Adding
