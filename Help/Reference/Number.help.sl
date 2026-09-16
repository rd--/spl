# Number

`Number` is a `Trait` for numerical values:

```
>>> system
>>> .traitDictionary['Number']
>>> .isTrait
true
```

Methods for arithmetic:

- `abs`
- `divide`, `/`
- `mod`, `%`
- `negate`, `negate`
- `plus`, `+`
- `quotient`, `//`
- `reciprocal`, `/`
- `remainder`, `\\`
- `subtract`, `-`
- `times`, `*`

Methods implementing mathematical functions:

- `power`, `^`
- `exp`
- `floorLog`
- `log`
- `raisedToInteger`
- `sqrt`
- `square`

Methods for testing:

- `isEven`
- `isOdd`
- `isNegative`
- `isNonNegative`
- `isPositive`
- `isZero`
- `sign`

Methods for truncating and rounding:

- `ceiling`
- `floor`
- `truncate`
- `round`
- `roundUp`

Methods for trigonometry:

- `sin`
- `cos`
- `tan`
- `sinDegrees`
- `cosDegrees`
- `arcSin`
- `arcCos`
- `arcTan`
- `degreesToRadians`
- `radiansToDegrees`

Types implementing `Number`:

```
>>> system
>>> .traitTypes('@Number')
>>> .sort
[
	'Complex'
	'Decimal'
	'Fraction'
	'Interval'
	'LargeInteger'
	'Quaternion'
	'Residue'
	'SmallFloat'
	'Symbol'
	'SymbolicExpression'
	'Ugen'
]
```

* * *

See also: Integer

Guides: Mathematical Functions, Number Functions

References:
_Smalltalk_
5.6.2

Categories: Numeric, Trait
