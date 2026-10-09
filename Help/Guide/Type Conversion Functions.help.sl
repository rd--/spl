# Type Conversion Functions

In Spl type constructors are ordinary methods, capitalized by convention.

As a rule, unary type constructors are used to convert values to the required type,
there are no separate _as_ or _to_ prefixed forms.

For instance, the `LargeInteger` constructor will convert
a `SmallFloat`,
a `Fraction` and
a `Decimal` to a large integer:

```
>>> LargeInteger(3.0)
3L

>>> LargeInteger(3/1)
3L

>>> LargeInteger(3.0D)
3L
```

These each have an,
undocumented,
type specific alias:

```
>>> smallFloatToLargeInteger(3.0)
3L

>>> fractionToLargeInteger(3/1)
3L

>>> decimalToLargeInteger(3.0D)
3L
```

The conversion must,
however,
be correct,
non-integer values signal errors:

```
>>> { LargeInteger(3.141) }.hasError
true

>>> 3.141.truncate.LargeInteger
3L

>>> { LargeInteger(13/5) }.hasError
true

>>> 13/5.round.LargeInteger
3L

>>> { LargeInteger(3.141D) }.hasError
true

>>> 3.141D.ceiling.LargeInteger
4L
```

`LargeInteger` is also defined as `identity` at `LargeInteger`:

```
>>> LargeInteger(3L)
3L
```

It also threads over lists:

```
>>> LargeInteger([3, 3L, 3/1, 3D])
[3L, 3L, 3L, 3L]
```

* * *

Guides: Parsing Functions
