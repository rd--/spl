# key

- _key(anAssociation)_

Answer the _key_ of _anAssociation_.

```
>>> ('x' -> 1).key
'x'

>>> (x: 1, y: 2, z: 3).associations.collect(key:/1)
['x' 'y' 'z']
```

* * *

See also: Association, associations, keys, value

Categories: Accessing
