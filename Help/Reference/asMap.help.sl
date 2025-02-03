# asMap

- _asMap(aCollection)_

Construct a `Map` from _aCollection_.

At `Association` `List`:

```
>>> ['x' -> 1, 'y' -> 2].asMap.isMap
true
```

At `Record`:

```
>>> (x: 1, y: 2).asMap.isMap
true
```

At `IdentityBag`:

```
>>> [1 2 2 3 3 3].asIdentityBag.asMap
[1 -> 1, 2 -> 2, 3 -> 3].asMap
```

At a 3×2 matrix:

```
>>> [1 2; 3 4; 5 6].asMap
[1 -> 2, 3 -> 4, 5 -> 6].asMap
```

* * *

See also: ->, Association, IdentityBag, List, Map, Record

Categories: Converting
