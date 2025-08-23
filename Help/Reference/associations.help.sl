# associations

- _associations(d)_

Answer a `List` of the `Association` values held by the dictionary _d_.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]

>>> ().associations
[]
```

At `Map`:

```
>>> [1 -> 'x', 2 -> 'y', 3 -> 'z'].asMap
>>> .associations
[1 -> 'x', 2 -> 'y', 3 -> 'z']

>>> [].asMap.associations
[]
```

At `Bag`:

```
>>> 'abracadabra'
>>> .characters
>>> .asBag
>>> .associations
['a' -> 5, 'b' -> 2, 'r' -> 2, 'c' -> 1, 'd' -> 1]
```

* * *

See also: ->, associationsDo, Association, Dictionary, indexValueAssociations, keys, values

Guides: Dictionary Functions

Categories: Accessing
