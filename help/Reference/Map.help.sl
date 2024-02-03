# Map -- collection type

_Map_ is a dictionary type where the keys are compared using the identity (==) operator.

- _Map()_

Construct an empty _Map_.

```
Map().isMap
```

- _asMap(anAssociationArray)_
- _asMap(aRecord)_

Construct a _Map_ from an Array of associations, or from a Record.

```
['x' -> 1, 'y' -> 2].asMap.isMap
(x: 1, y: 2).asMap.isMap
```

* * *

See also: Dictionary, Record

Smalltalk: _IdentityDictionary_
