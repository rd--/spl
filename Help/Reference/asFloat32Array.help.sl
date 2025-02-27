# asFloat32Array

- _asFloat32Array(aList)_

Answer a `Float32Array` with the values of _aList_,
which must have element type `SmallFloat`.

```
>>> let l = [1 2 3 4 5];
>>> let a = l.asFloat32Array;
>>> (
>>> 	l.elementType,
>>> 	a.isFloat32Array,
>>> 	a.size,
>>> 	a.asList
>>> )
(
	'SmallFloat',
	true,
	5,
	[1 2 3 4 5]
)
```

* * *

See also: asList, Float32Array, List

Categories: Converting
