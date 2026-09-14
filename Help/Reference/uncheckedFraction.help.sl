# uncheckedFraction

- _uncheckedFraction(n, d)_

Answer a `Fraction` that will have a `numerator` of _n_ and a `denominator` of _d_ without checking that _n/d_ is in reduced form.

This method can avoid the cost of simplifying Fractions that are known to be in a reduced form.

However it can also be used to make `Fraction` values that do not conform to the required invariants,
and which may result in undefined behaviour.

To simplify a fraction in place see `simplify`.
To answer a new simplified fraction use `simplified`.

```
>>> uncheckedFraction(2, 4).components
[2 4]

>>> uncheckedFraction(2, 4).simplify
1/2
```

* * *

See also: Fraction, simplified, simplify
