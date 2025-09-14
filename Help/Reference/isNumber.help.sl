# isNumber

- _isNumber(x)_

Answers `true` if the object _x_ implements the trait `Number`,
else `false`.

At `SmallFloat`, where the value is a fraction:

```
>>> 3.141.isNumber & {
>>> 	3.141.isSmallFloat
>>> }
true
```

At `SmallFloat`, where the value is an integer:

```
>>> 23.isNumber & {
>>> 	23.isSmallFloat & {
>>> 		23.isInteger
>>> 	}
>>> }
true
```

At `Infinity`:

```
>>> Infinity.isNumber & {
>>> 	Infinity.isSmallFloat & {
>>> 		Infinity.isFinite.not
>>> 	}
>>> }
true
```

At `LargeInteger`:

```
>>> 23L.isNumber & {
>>> 	23L.isLargeInteger
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

A `String` is not a number:

```
>>> ('23'.isNumber, '23'.isString)
(false, true)
```

A `List` is not a number:

```
>>> ([1 2 3].isNumber, [1 2 3].isList)
(false, true)
```

A `Ugen` is a kind of number:

```
>>> SinOsc(440, 0).isNumber & {
>>> 	SinOsc(440, 0).isUgen
>>> }
true
```

* * *

See also: isAtom, isFinite, isFraction, isInteger, isLargeInteger, isSmallFloat, Number



References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberQ.html)
[2](https://reference.wolfram.com/language/ref/NumericQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Number)

Categories: Testing, Math
