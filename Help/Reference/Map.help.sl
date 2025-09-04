# Map

- _Map([k₁ v₁; k₂ v₂; …])_

A `Map` is a `Dictionary` type where the keys are compared using the identical to (`==`) operator.
See `isImmediate` for deciding if a value is suitable as a key.

At a Map from a matrix:

```
>>> Map([1 2; 3 4; 5 6])
[1: 2, 3: 4, 5: 6]
```

Construct an empty `Map`:

```
>>> Map().isMap
true
```

`Map` treats negative zero as zero when used as a key:

```
>>> let m = Map();
>>> m[-0] := -0;
>>> (
>>> 	m.associations,
>>> 	m.keys.first.isNegativeZero,
>>> 	m.values.first.isNegativeZero
>>> )
([0 -> -0], false, true)
```

Note: `Map` is _IdentityDictionary_ in Smalltalk.

* * *

See also: asMap, Dictionary, isImmediate, Record

Guides: Dictionary Functions, Map Syntax

Categories: Collection, Type
