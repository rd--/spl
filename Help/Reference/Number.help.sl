# Number

`Number` is a `Trait` for numerical values:

```
>>> system
>>> .traitDictionary['Number']
>>> .isTrait
true
```

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

Methods for arithmetic:

- `+`
- `-`
- `*`
- `/`
- `%`
- `quotient`
- `remainder`
- `abs`
- `negate`
- `reciprocal`

Methods implementing mathematical functions:

- `exp`
- `log`
- `floorLog`
- `^`
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

* * *

See also: Integer

Guides: Mathematical Functions, Number Functions

References:
_Smalltalk_
5.6.2

Categories: Numeric, Trait
