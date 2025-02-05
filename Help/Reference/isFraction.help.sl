# isFraction

- _isFraction(anObject)_

Answers if _anObject_ is a `Fraction` value.

At `Fraction`:

```
>>> 2/3.isFraction
true
```

At `LargeInteger`:

```
>>> 23n.isFraction
false
```

At `SmallFloat`:

```
>>> 23.isFraction
false

>>> 3.141.isFraction
false
```

_Rationale_:
`isFraction` is a `Type` predicate,
`SmallFloat` values that represent fractions or integers,
for instance _0.5_ and _1.0_,
answer `false`,
as do `LargeInteger` values.
The predicate `isRational` will answer `true` for integer values.

* * *

See also: denominator, Fraction, isExact, isInteger, isNumber, isRational, numerator

Categories: Testing, Arithmetic
