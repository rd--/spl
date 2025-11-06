# Numeric Types

Types:

- `Complex`
- `Decimal`
- `Fraction`
- `LargeInteger`
- `Quaternion`
- `Residue`
- `SmallFloat`

The primitive numeric types are `SmallFloat`:

```
>>> 3.141.isSmallFloat
true
```

and `LargeInteger`:

```
>>> 23L.isLargeInteger
true
```

The non-primitive numeric types are `Complex`:

```
>>> 1J1.isComplex
true
```

and `Fraction`:

```
>>> 3/4.isFraction
true
```

and `Decimal`:

```
>>> 3.14D.isDecimal
true
```

and `Residue`:

```
>>> 5Z12.isResidue
true
```

* * *

See also: Binary, Complex, Decimal, Fraction, Integer, isImmediate, LargeInteger, Number, Residue, SmallFloat

Guides: Number Syntax, Numerical Precision
