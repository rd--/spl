# asMap

- _asMap(aCollection)_

Construct a `Map` from _aCollection_.

At a `List` of `Association` values:

```
>>> ['x' -> 1, 'y' -> 2].asMap.isMap
true
```

At `Record`:

```
>>> (x: 1, y: 2).asMap
['x' -> 1, 'y' -> 2].asMap
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

It is an `error` if there are not two columns:

```
>>> {
>>> 	[1 2 3; 4 5 6].asMap
>>> }.ifError { true }
true
```

* * *

See also: ->, asDictionary, asRecord, Association, Dictionary, IdentityBag, List, Map, Record

Categories: Converting
