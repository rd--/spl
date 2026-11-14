# isSmallInteger

- _isSmallInteger(x)_

Answers `true` if the `Float` _x_ is an integer that can be accurately represented as an IEEE-754 double precision number,
and whose IEEE-754 representation cannot be the result of rounding any other integer to fit the IEEE-754 representation.

```
>>> 23.0.isSmallInteger
true

>>> 3.141.isSmallInteger
false
```

The largest small integer:

```
>>> (2L ^ 53L) - 1L
9_007_199_254_740_991L

>>> let x = (2L ^ 53L) - 1L;
>>> let y = Float(x + 1L);
>>> (y, y.isSmallInteger, y + 1.0 = y)
(9_007_199_254_740_992.0, false, true)
```

The least negative small integer:

```
>>> (-2L ^ 53L) + 1L
-9_007_199_254_740_991L

>>> let x = (-2L ^ 53L) + 1L;
>>> let y = Float(x - 1L);
>>> (y, y.isSmallInteger, y - 1.0 = y)
(-9_007_199_254_740_992.0, false, true)
```

A `Float` that is an integer,
according to `isIntegerValuedNumber`,
must also be a small integer:

_2^54_ and _20!_ are integers:

```
>>> (2.0 ** 54.0).isIeeeInteger
true

>>> 20L.!.isInteger
true
```

_2^54_ and _20!_ are not small integers:

```
>>> (2.0 ** 54.0).isSmallInteger
false

>>> 20L.!.isSmallIntegerValuedNumber
false
```

_2^54_ is accurately represented:

```
>>> let a = 2L ^ 54L;
>>> let b = 2.0 ** 54.0;
>>> (a = b, a == b)
(true, false)

>>> let a = 20L.!;
>>> let b = Float(a);
>>> (a = b, a == b)
(true, false)
```

_2^54_ and _20!_ are not uniquely represented:

```
>>> let a = Float(2L ^ 54L);
>>> a = (a - 1.0)
true

>>> let a = (2L ^ 54L);
>>> a = (a - 1L)
false

>>> let a = Float(20L.!);
>>> a = (a - 1.0)
true

>>> let a = 20L.!;
>>> a = (a - 1L)
false
```

For other numeric types,
see `isSmallIntegerValuedNumber`.
At `Integer`,
answers `true` the value can be accurately represented as a small integer:

```
>>> 23L.isSmallIntegerValuedNumber
true

>>> let x = (2L ^ 54L);
>>> (
>>> 	x.isInteger,
>>> 	x.isSmallIntegerValuedNumber
>>> )
(true, false)
```

At `Decimal`:

```
>>> 3.000D.isSmallIntegerValuedNumber
true

>>> 3.141D.isSmallIntegerValuedNumber
false

>>> 9904578032905937D
>>> .isSmallIntegerValuedNumber
false
```

At `Fraction`:

```
>>> let x = 23/1;
>>> (
>>> 	x.isIntegerValuedNumber,
>>> 	x.isSmallIntegerValuedNumber
>>> )
(true, true)

>>> let x = 9904578032905937/1;
>>> (
>>> 	x.isIntegerValuedNumber,
>>> 	x.isSmallIntegerValuedNumber
>>> )
(true, false)

>>> let x = 23/7;
>>> (
>>> 	x.isIntegerValuedNumber,
>>> 	x.isSmallIntegerValuedNumber
>>> )
(false, false)
```

A `List` is not a small integer:

```
>>> {
>>> 	[1 2 3].isSmallInteger
>>> }.hasError
true

>>> [1 2 3].allTrue(isSmallInteger/1)
true
```

Not-a-number and infinities are not small integers:

```
>>> NaN.isSmallInteger
false

>>> Infinity.isSmallInteger
false

>>> -Infinity.isSmallInteger
false
```

* * *

See also: Float, isFloat, isGaussianInteger, isInteger, isNumber

Guides: Integer Functions

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isSafeInteger),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-number.issafeinteger)

Categories: Testing
