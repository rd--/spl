# isSmallInteger

- _isSmallInteger(anObject)_

Answers `true` if _anObject_ is an integer that can be accurately represented as an IEEE-754 double precision number,
and whose IEEE-754 representation cannot be the result of rounding any other integer to fit the IEEE-754 representation.

```
>>> 23.isSmallInteger
true

>>> 3.141.isSmallInteger
false
```

The largest small integer:

```
>>> (2L ^ 53L) - 1L
9007199254740991L

>>> let x = 9007199254740991;
>>> let y = x + 1;
>>> ([x, x + 1].isSmallInteger, y + 1 = y)
(
	[true false],
	true
)
```

A `SmallFloat` that is an integer,
according to `isInteger`,
need not be a small integer.

_2 ^ 54_ is an integer:

```
>>> (2 ^ 54).isInteger
true
```

_2 ^ 54_ is an not a small integer:

```
>>> (2 ^ 54).isSmallInteger
false
```

_2 ^ 54_ is accurately represented:

```
>>> (2 ^ 54) = (2L ^ 54)
true
```

_2 ^ 54_ is not uniquely represented:

```
>>> (2 ^ 54) = (2 ^ 54 - 1)
true

>>> (2L ^ 54) = (2L ^ 54 - 1)
false
```

At `LargeInteger` and `Fraction` answers `true` is the value is an integer and if that integer is a safe integer:

```
>>> 23L.isSmallInteger
true

>>> let x = (2L ^ 54);
>>> (x.isInteger, x.isSmallInteger)
(true, false)

>>> 2/1.isSmallInteger
true

>>> let x = 3/2.isSmallInteger;
>>> (x.isInteger, x.isSmallInteger)
(false, false)

>>> let x = Fraction(2L ^ 54, 1);
>>> (x.isInteger, x.isSmallInteger)
(true, false)
```

* * *

See also: isGaussianInteger, isInteger, isLargeInteger, isNumber, isSmallFloat, SmallFloat

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isSafeInteger),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-number.issafeinteger)

Categories: Testing
