# Type Predicates

Each type definition generates an associated type predicate.
The predicate name is the type name with an _is_ prefix.

The type predicate is the ordinary way to test if a value is of a particular type.

```
>>> 23L.isLargeInteger
true

>>> 23L.typeOf = 'LargeInteger'
true

>>> 1I.isComplex
true

>>> 1I.typeOf = 'Complex'
true
```

* * *

See also: typeOf

Guides: Reflection Functions
