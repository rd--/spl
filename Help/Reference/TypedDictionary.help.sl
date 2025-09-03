# TypedDictionary

- _TypedDictionary(t)_

A `TypedDictionary` is a `Type` representing a `Dictionary` where the keys are all of type _t_.

If the keys are all of type `String`, the underlying dictionary is a `Record`:

```
>>> let l = ['x' -> 1, 'y' -> 2, 'z' -> 3];
>>> let d = l.asTypedDictionary;
>>> (d.keyType, d.contents.typeOf)
('String', 'Record')
```

If the keys are all of an _immediate_ type, the underlying dictionary is a `Map`:

```
>>> let l = [1 -> 'x', 2 -> 'y', 3 -> 'z'];
>>> let d = l.asTypedDictionary;
>>> (
>>> 	d.typeOf,
>>> 	d.keyType,
>>> 	d.keys,
>>> 	d.values,
>>> 	d.associations,
>>> 	d.keyType.isImmediateType,
>>> 	d.contents.typeOf
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

See also: asTypedDictionary, contents, Dictionary, Map, Record

Guides: Dictionary Functions
