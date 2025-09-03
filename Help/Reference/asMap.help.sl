# asMap

- _asMap(c)_

Construct a `Map` from the collection _c_.

At a `List` of `Association` values:

```
>>> ['x' -> 1, 'y' -> 2].asMap
['x': 1, 'y': 2]
```

At `Record`:

```
>>> (x: 1, y: 2).asMap
['x': 1, 'y': 2]
```

At `IdentityBag`:

```
>>> [1 2 2 3 3 3].asIdentityBag.asMap
[1: 1, 2: 2, 3: 3]
```

At a 3×2 matrix:

```
>>> [1 2; 3 4; 5 6].asMap
[1: 2, 3: 4, 5: 6]
```

It is an `error` if there are not two columns:

```
>>> {
>>> 	[1 2 3; 4 5 6].asMap
>>> }.ifError { true }
true
```

* * *

See also: ->, asEqualityDictionary, asRecord, Association, Dictionary, IdentityBag, List, Map, Record

Guides: Dictionary Functions

Categories: Converting
