# addAfter!

- _addAfter!([x₁ x₂ …], p, q)_

Add the new object _p_ as an element of the sequence _x_ in-place.
Put it in the sequence just succeeding the existing object _q_.
Answer _p_.

```
>>> let x = [1 2 4];
>>> let y = x.addAfter!(3, 2);
>>> (x, y)
([1 2 3 4], 3)
```

* * *

See also: add, addAfterIndex, addBefore, insertAt

Guides: List Functions

References:
_Smalltalk_
5.7.18.2

Categories: Adding
