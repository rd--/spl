# isNumber

- _isNumber(x)_

Answers `true` if the object _x_ implements the trait `Number`,
else `false`.

At `Float`,
where the value is a fraction:

```
>>> 3.141.isNumber & {
>>> 	3.141.isFloat
>>> }
true
```

At `Float`,
where the value is an integer:

```
>>> 23.0.isNumber & {
>>> 	23.0.isFloat & {
>>> 		23.0.isIntegerValuedNumber
>>> 	}
>>> }
true
```

At `Infinity`:

```
>>> Infinity.isNumber & {
>>> 	Infinity.isFloat & {
>>> 		Infinity.isFinite.not
>>> 	}
>>> }
true
```

At `NaN`:

```
>>> NaN.isNumber & {
>>> 	NaN.isFloat
>>> }
true
```

At `Integer`:

```
>>> 23L.isNumber & {
>>> 	23L.isInteger
>>> }
true
```

At `Fraction`:

```
>>> 2/3.isNumber & {
>>> 	2/3.isFraction
>>> }
true
```

At `Complex`:

```
>>> 2J3.isNumber & {
>>> 	2J3.isComplex
>>> }
true
```

At `Decimal`:

```
>>> 3.141D.isNumber & {
>>> 	3.141D.isDecimal
>>> }
true
```

At `Residue`:

```
>>> 5Z12.isNumber & {
>>> 	5Z12.isResidue
>>> }
true
```

At `Interval`:

```
>>> (-2 -- 5).isNumber
true
```

A `String` is not a number:

```
>>> ('23'.isNumber, '23'.isString)
(false, true)
```

A `List` is not a number:

```
>>> ([1 2 3].isNumber, [1 2 3].isList)
(false, true)

>>> [1 2 3].allTrue(isNumber/1)
true
```

A `Ugen` is a kind of number:

```
>>> sinOsc(440, 0).isNumber & {
>>> 	sinOsc(440, 0).isUgen
>>> }
true
```

* * *

See also: Number, isAtom, isFinite, isFloat, isFraction, isInteger

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberQ.html)
[2](https://reference.wolfram.com/language/ref/NumericQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Number)

Categories: Testing, Math
