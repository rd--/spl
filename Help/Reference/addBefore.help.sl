# addBefore!

- _addBefore!([x₁ x₂ …], p, q)_

Add a new object _p_ as an element of the sequence _x_ in-place.
Put it in the sequence just preceding the old object _q_.
Answer _p_.

```
>>> let x = [1 2 4];
>>> let y = x.addBefore!(3, 4);
>>> (x, y)
([1 2 3 4], 3)
```

* * *

See also: add, addAfter, addBeforeIndex

References:
_Smalltalk_
5.7.18.4

Categories: Adding
