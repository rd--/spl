# key

- _key(k → v)_

Answer the key _k_ of the association _k→v_.

```
>>> ('x' -> 1).key
'x'

>>> (x: 1, y: 2, z: 3)
>>> .associations
>>> .collect(key:/1)
['x' 'y' 'z']
```

* * *

See also: Association, associations, keys, value

Guides: Dictionary Functions

Categories: Accessing
