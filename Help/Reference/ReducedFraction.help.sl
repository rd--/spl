# ReducedFraction

- _ReducedFraction(numerator, denominator)_

Answer a `Fraction` where it is known that _numerator/denominator_ is already a reduced (simplified) fraction.

This method is used to avoid the cost of simplifying Fractions that are know to be in a reduced form.

It can be used to make `Fraction` values that do not conform to the required invariants,
and which may result in undefined behaviour.

To simplify a fraction in place see `simplify`, to answer a new simplified fraction use `simplified`.

```
>>> ReducedFraction(2, 4).simplify
1/2
```

* * *

See also: Fraction, simplified, simplify
