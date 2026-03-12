# keysAndValues

- _keysAndValues(d)_

Answer a two column table of the keys and values of the `Dictionary` _d_.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).keysAndValues
['x' 1; 'y' 2; 'z' 3]

>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At `Map`:

```
>>> ['x': 1, 'y': 2, 'z': 3]
>>> .keysAndValues
['x' 1; 'y' 2; 'z' 3]

>>> ['x': 1, 'y': 2, 'z': 3]
>>> .associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At a `List` of `Association`s:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3].keysAndValues
['x' 1; 'y' 2; 'z' 3]
```

* * *

See also: associations, Dictionary, indices, keys, values

Guides: Dictionary Functions

Categories: Accessing
