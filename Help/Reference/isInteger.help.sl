# isInteger

- _isInteger(anObject)_

Answers `true` if _anObject_ is a `Number` and is an `Integer`, else `false`.

At `SmallFloat`:

```
>>> 23.isInteger
true

>>> 3.141.isInteger
false

>>> Infinity.isInteger
false
```

Note that numbers written using floating point literal notation,
where the fractional part is zero,
answers `true`:

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

At `Decimal`:

```
>>> 3.141D.isInteger
false

>>> 3.000D.isInteger
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

At non-number types answers `false`:

```
>>> '23'.isInteger
false

>>> nil.isInteger
false

>>> false.isInteger
false

>>> [1 2 3].isInteger
false
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
Note that this is not a `Type` predicate.
`Fraction`, `SmallFloat` and `Decimal` values may each possibly represent an integer.
The type predicates are `isFraction`, `isSmallFloat`, `isDecimal`, `isLargeInteger`.

* * *

See also: asInteger, Integer, isFraction, isNumber, isGaussianInteger, isSmallFloat, isSmallInteger, isLargeInteger, Number, parseLargeInteger, parseSmallInteger

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer)

Categories: Testing, Math
