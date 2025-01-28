# isNumber

- _isNumber(anObject)_

Answers `true` if _anObject_ is a `Number`, else `false`.

At `SmallFloat`:

```
>>> 3.141.isNumber & {
>>> 	3.141.isSmallFloat
>>> }
true

>>> 23.isNumber & {
>>> 	23.isSmallFloat & {
>>> 		23.isInteger
>>> 	}
>>> }
true

>>> Infinity.isNumber & {
>>> 	Infinity.isSmallFloat & {
>>> 		Infinity.isFinite.not
>>> 	}
>>> }
true
```

At `LargeInteger`:

```
>>> 23n.isNumber & { 23n.isLargeInteger }
true
```

At `Fraction`:

```
>>> 2/3.isNumber & { 2/3.isFraction }
true
```

At `Complex`:

```
>>> 2J3.isNumber & { 2J3.isComplex }
true
```

A `String` is not a number:

```
>>> '23'.isNumber
false
```

A `Ugen` is a number:

```
>>> SinOsc(440, 0).isNumber
true
```

* * *

See also: isFinite, isFraction, isInteger, isLargeInteger, isSmallFloat, Number

Categories: Testing, Math
