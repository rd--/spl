# TypedDictionary

- _TypedDictionary([k → v, …], t)_

A `TypedDictionary` is a `Type` representing a `Dictionary` where the keys _k_ are all of type _t_.
_t_ may be inferred if the dictionary is not initially empty.

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
>>> 	1L -> 'x', 2L -> 'y', 3L -> 'z'
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
	'Integer',
	[1L 2L 3L],
	['x' 'y' 'z'],
	[1L -> 'x', 2L -> 'y', 3L -> 'z'],
	true,
	'Map'
)
```

* * *

See also: Dictionary, Map, Record

Guides: Dictionary Functions
