# TypedDictionary

- _TypedDictionary([k → v, …], t)_

A `TypedDictionary` is a `Type` representing a `Dictionary` where the keys _k_ are all of type _t_.
_t_ may be inferred if dictionary is not initially empty.

Create an empty dictionary where the keys must be of type `String`:

```
>>> let d = TypedDictionary([], 'String');
>>> d['x'] := 3.141;
>>> (d.keyType, d.size, d['x'])
('String', 1, 3.141)
```

If the keys are of type `String`, the underlying dictionary is a `Record`:

```
>>> let d = TypedDictionary[
>>> 	'x' -> 1, 'y' -> 2, 'z' -> 3
>>> ];
>>> (d.keyType, d.untypedDictionary.typeName)
('String', 'Record')
```

If the keys are of an _immediate_ type, the underlying dictionary is a `Map`:

```
>>> let d = TypedDictionary[
>>> 	1 -> 'x', 2 -> 'y', 3 -> 'z'
>>> ];
>>> (
>>> 	d.typeName,
>>> 	d.keyType,
>>> 	d.keys,
>>> 	d.values,
>>> 	d.associations,
>>> 	d.keyType.isImmediateTypeName,
>>> 	d.untypedDictionary.typeName
>>> )
(
	'TypedDictionary',
	'SmallFloat',
	[1 2 3],
	['x' 'y' 'z'],
	[1 -> 'x', 2 -> 'y', 3 -> 'z'],
	true,
	'Map'
)
```

* * *

See also: Dictionary, Map, Record

Guides: Dictionary Functions
