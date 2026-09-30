# isScalarInteger

- _isScalarInteger(x)_

Answer `true` if the object _x_ is a `Number` and is an `Integer`, else `false`.

At `SmallFloat`:

```
>>> 3.isScalarInteger
true
```

At `Fraction`:

```
>>> 3/1.isScalarInteger
true
```

At `Complex`:

```
>>> 3J2.isScalarInteger
false
```

At `List`:

```
>>> [1 3 5].isScalarInteger
false

>>> [1 3 5].isInteger
[true true true]
```

_Rationale_:
The `isInteger` predicate is only defined for numbers,
and threads over lists.

* * *

See also: isInteger, isNumber, isScalar, isSmallInteger

Guides: Integer Functions
