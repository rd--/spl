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
```

_Rationale_:
The `isInteger` predicate is only defined for numbers.

* * *

See also: isInteger, isNumber, isScalar, isSmallInteger

Guides: Integer Functions
