# isFraction

- _isFraction(x)_

Answers if the object _x_ is a `Fraction` value.

At `Fraction`:

```
>>> 2/3.isFraction
true
```

At `Integer`:

```
>>> 23L.isFraction
false
```

At `Float`:

```
>>> 23.isFraction
false

>>> 3.141.isFraction
false
```

A `List` is not a fraction:

```
>>> [1/2 3/4].isFraction
false

>>> [1/2 3/4].allTrue(isFraction/1)
true
```

_Rationale_:
`isFraction` is a `Type` predicate,
`Float` values that represent fractions or integers,
for instance _0.5_ and _1_,
answer `false`,
as do `Integer` values.
The predicate `isRational` will answer `true` for integer values.

* * *

See also: Fraction, denominator, isExact, isInteger, isNumber, isRational, numerator

Guides: Predicate Functions

Categories: Testing, Arithmetic
