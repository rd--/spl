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
non-integer values signal errors.
`L` is an alias for `LargeInteger` that mirrors the literal syntax:

```
>>> { LargeInteger(3.141) }.hasError
true

>>> 3.141.truncate.L
3L

>>> { LargeInteger(13/5) }.hasError
true

>>> 13/5.round.L
3L

>>> { LargeInteger(3.141D) }.hasError
true

>>> 3.141D.ceiling.L
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

Using `List Constructor Syntax`:

```
>>> LargeInteger[3 3L 3/1 3D]
[3L 3L 3L 3L]

>>> LargeInteger[3 3L; 3/1 3D]
[3L 3L; 3L 3L]
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

>>> SmallFloat[3L 3D; 3/1 3]
[3 3; 3 3]
```

`Complex`, `Fraction` and `Decimal` have binary constructors:

```
>>> Complex(3, 4)
3J4

>>> Fraction(3, 4)
3/4

>>> Decimal(1/3, 2)
0.33D
```

These binary constructors likewise thread over lists:

```
>>> Complex([1 2], 3)
[1J3 2J3]

>>> Fraction([1 2 3], [4 5 6])
[1/4 2/5 3/6]

>>> Decimal(1/3, [1 2 3])
[0.3D 0.33D 0.333D]
```

The ordinary way to convert a real number to a complex number,
or a fraction,
is to use the binary constructor,
setting the `imaginary` part to `zero`,
or the `denominator` to `one`.
`J` is an alias for `Complex` that mirrors the literal syntax,
likewise `R` for `Fraction`.

```
>>> Complex(2, 0)
2J0

>>> [2 3 4].J(0)
[2J0 3J0 4J0]

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

The unary forms of binary constructors operate on appropriately shaped arrays.

`Complex` at `List`:

```
>>> Complex[1 2]
1J2

>>> Complex[1 2; 3 4]
[1J2 3J4]

>>> Complex[1 2; 3 4:; 5 6; 7 8]
[1J2 3J4; 5J6 7J8]
```

`Fraction` at `List`:

```
>>> Fraction[1 2]
1/2

>>> Fraction[1 2; 3 4]
[1/2 3/4]

>>> Fraction[1 2; 3 4:; 5 6; 7 8]
[1/2 3/4; 5/6 7/8]
```

* * *

Guides: Parsing Functions
