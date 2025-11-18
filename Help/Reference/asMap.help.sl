# asMap

- _asMap(c)_

Construct a `Map` from the collection _c_.

At a `List` of `Association` values:

```
>>> ['x' -> 1, 'y' -> 2].asMap
['x': 1, 'y': 2]

>>> [].asMap
[:]

>>> ['x' -> 1, 'y' -> 2]
>>> .associationListToMap
['x': 1, 'y': 2]
```

At `Record`:

```
>>> (x: 1, y: 2).asMap
['x': 1, 'y': 2]
```

At `IdentityMultiset`:

```
>>> [1 2 2 3 3 3]
>>> .asIdentityMultiset
>>> .asMap
[1: 1, 2: 2, 3: 3]
```

At a two column matrix,
here a 3×2 matrix:

```
>>> [1 2; 3 4; 5 6].asMap
[1: 2, 3: 4, 5: 6]

>>> [1 2; 3 4; 5 6]
>>> .matrixToMap
[1: 2, 3: 4, 5: 6]
```

It is an `error` if there are not two columns:

```
>>> {
>>> 	[1 2 3; 4 5 6].asMap
>>> }.hasError
true
```

* * *

See also: ->, asDictionary, asRecord, Association, Dictionary, IdentityMultiset, List, Map, Record

Guides: Dictionary Functions

Categories: Converting
