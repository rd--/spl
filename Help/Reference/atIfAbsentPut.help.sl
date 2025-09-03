# atIfAbsentPut

- _atIfAbsentPut(d, k, f:/0)_

Answer the element in the dictionary _d_ at key _k_.
If the key is absent,
add the result of evaluating the block _f_ to _d_ at _k_ and answer that value.

```
>>> let r = (x: 1, y: 2);
>>> let z = r.atIfAbsentPut('y') { nil };
>>> (r, z)
((x: 1, y: 2), 2)

>>> let r = (:);
>>> let z = r.atIfAbsentPut('x') { 1 };
>>> (r, z)
((x: 1), 1)
```

* * *

See also: at, atIfPresent

References:
_Smalltalk_
5.7.2.4

Categories: Accessing
