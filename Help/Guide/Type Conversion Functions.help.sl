# Type Conversion Functions

In Sᴘʟ type constructors are ordinary methods, capitalized by convention.

As a rule, unary type constructors are used to convert values to the required type,
there are no separate _as_ or _to_ prefixed forms.

For instance, the `LargeInteger` constructor will convert appropriate instances of
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
>>> LargeInteger[3 3L 3/1 3D]
[3L 3L 3L 3L]
```

`SmallFloat` behaves similarly:

```
>>> SmallFloat(3L)
3.0

>>> SmallFloat(3.141D)
3.141

>>> SmallFloat(3/4)
0.75

>>> SmallFloat(23.0)
23.0

>>> SmallFloat[3L 3D 3/1 3]
[3 3 3 3]
```

`Complex` and `Fraction` have binary constructors:

```
>>> Complex(3, 4)
3J4

>>> Fraction(3, 4)
3/4
```

These binary constructors likewise thread over lists:

```
>>> Complex([1 2], 3)
[1J3 2J3]

>>> Fraction([1 2 3], [4 5 6])
[1/4 2/5 3/6]
```

The ordinary way to convert a real number to a complex number,
or a fraction,
is to use the binary constructor,
setting the `imaginary` part to `zero`,
or the `denominator` to `one`:

```
>>> Complex(2, 0)
2J0

>>> [2 3 4].J(0)
2J0

>>> Fraction(2, 1)
2/1

>>> 2.R(1)
2R1
```

`Complex` also has an `I` constructor:

```
>>> 1.I
1I
```

* * *

Guides: Parsing Functions
