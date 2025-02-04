# isFraction

- _isFraction(anObject)_

Answers if _anObject_ is a `Fraction` value.
This is a `Type` predicate,
`SmallFloat` values that represent fractions,
for instance _0.5_,
answer `false`.

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

* * *

See also: denominator, Fraction, isNumber, isRational, numerator

Categories: Testing, Arithmetic
