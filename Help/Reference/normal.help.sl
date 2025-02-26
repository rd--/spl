# normal

- _normal(aSparseArray)_

Converts an object to a normal form from a special form.

At `SparseArray` answers a normal dense list:

```
>>> SparseArray([[4] -> 'a', [9] -> 'b']).normal
[0 0 0 'a' 0 0 0 0 'b']
```

* * *

See also: List, SparseArray
