# addAfter

- _addAfter([x₁ x₂ …], p, q)_

Add the new object _p_ as an element of the sequence _x_.
Put it in the sequence just succeeding the existing object _q_.
Answer _p_.

```
>>> let l = [1 2 4];
>>> let r = l.addAfter(3, 2);
>>> (r, l)
(3, [1 2 3 4])
```

* * *

See also: add, addAfterIndex, addBefore, insertAt

Guides: List Functions

References:
_Smalltalk_
5.7.18.2

Categories: Adding
