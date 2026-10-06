# Number

- _Number(x)_

`Number` is a `Trait` for numerical values:

The `Number` function answers _x_ if it is a number, else error.
In the `Number` case answer `identity`:

```
>>> Number(23)
23

>>> Number(1.pi)
1.pi
```

To convert a `Boolean` use `boole`:

```
>>> false.boole
0

>>> true.boole
1
```

To convert a `String` use `parseNumber`:

```
>>> '23'.parseNumber
23

>>> '3.141'.parseNumber
3.141
```

Threads over lists:

```
>>> [1 2.3 4J5].Number
[1 2.3 4J5]
```

`Number` is a `Trait`:

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
>>> .sort!
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
