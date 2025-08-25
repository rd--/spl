# isInteger

- _isInteger(x, ε)_

Answers `true` if the number _x_ is an `Integer`, else `false`.

At `SmallFloat`:

```
>>> 23.isInteger
true

>>> 3.141.isInteger
false

>>> Infinity.isInteger
false

>>> 1.000001.isInteger(1E-6)
true
```

Note that numbers written using floating point literal notation,
where the fractional part is zero,
answer `true`:

```
>>> 23.0.isInteger
true
```

At `LargeInteger`:

```
>>> 23L.isInteger
true
```

At `Fraction`:

```
>>> 2/3.isInteger
false

>>> 2/2.isInteger
true

>>> (1/3 * 3).isInteger
true
```

At `Decimal` maye be `true` even if `scale` is non-`zero`:

```
>>> 3.141D.isInteger
false

>>> 3.000D.isInteger
true

>>> 3D.isInteger
true
```

At `Residue`:

```
>>> 5Z12.isInteger
true
```

At `Complex` answers `false`, see `isGaussianInteger`:

```
>>> 2J3.isInteger
false
```

Threads over lists:

```
>>> [1 2 3 1.pi].isInteger
[true true true false]
```

Test whether an array consists of all integers:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].deepAllSatisfy(isInteger:/1)
true
```

_Rationale_:
Note that this is not a `Type` predicate,
and is only implemeted for numeric values.
In this sense it is like `isEven` and `isOdd`.
`Fraction`, `SmallFloat` and `Decimal` values may each possibly represent an integer.
The type predicates are `isFraction`, `isSmallFloat`, `isDecimal`, `isLargeInteger`.

* * *

See also: asInteger, Integer, isFraction, isNumber, isGaussianInteger, isScalarInteger, isSmallFloat, isSmallInteger, isLargeInteger, Number, parseLargeInteger, parseSmallInteger

Guides: Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer)

Categories: Testing, Math
