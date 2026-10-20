# WeakMap

A `WeakMap` is a `Type` representing a collection of _(key, value)_ associations
which does not create strong references to its keys.

The presence as an object as a key in a `WeakMap` does not prevent it from being garbage collected.

Once an object used as a key has been collected,
its corresponding values in any `WeakMap` become candidates for garbage collection as well,
as long as they are not strongly referred to elsewhere.

`WeakMap` is a `Type`:

```
>>> system.typeLookup('WeakMap')
>>> .isType
true
```

Traits implemented by `WeakMap`:

```
>>> system.typeLookup('WeakMap')
>>> .traitNameList
>>> .sort!
[
	'At'
	'Object'
	'PrimitiveMap'
	'Put'
]
```

* * *

See also: Map

Categories: Collection, Type
