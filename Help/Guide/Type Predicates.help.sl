# Type Predicates

Each type definition generates an associated type predicate.
The predicate name is the type name with an _is_ prefix.

The type predicate is the ordinary way to test if a value is of a particular type.

At `Integer`:

```
>>> 23L.isInteger
true

>>> 23L.typeName
'Integer'
```

At `Float`:

```
>>> 3.141.isFloat
true

>>> 3.141.typeName
'Float'
```

At `Fraction`:

```
>>> 1/3.isFraction
true

>>> 1/3.typeName
'Fraction'
```

At `Complex`:

```
>>> 1I.isComplex
true

>>> 1I.typeName
'Complex'
```

* * *

See also: typeName

Guides: Reflection Functions
