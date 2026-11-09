# isSmallInteger

- _isSmallInteger(x)_

Answers `true` if the object _x_ is an integer that can be accurately represented as an IEEE-754 double precision number,
and whose IEEE-754 representation cannot be the result of rounding any other integer to fit the IEEE-754 representation.

At `Float`:

```
>>> 23.isSmallInteger
true

>>> 3.141.isSmallInteger
false
```

The largest small integer:

```
>>> (2 ^ 53) - 1
9_007_199_254_740_991L

>>> let x = (2 ^ 53) - 1;
>>> let y = Float(x + 1);
>>> (y, y.isSmallInteger, y + 1 = y)
(9_007_199_254_740_992.0, false, true)
```

The least negative small integer:

```
>>> (-2 ^ 53) + 1
-9_007_199_254_740_991L

>>> let x = (-2 ^ 53) + 1;
>>> let y = Float(x - 1);
>>> (y, y.isSmallInteger, y - 1 = y)
(-9_007_199_254_740_992.0, false, true)
```

A `Float` that is an integer,
according to `isInteger`,
must also be a small integer:

_2^54_ and _20!_ are integers:

```
>>> (2 ** 54).isIeeeInteger
true

>>> 20.!.isInteger
true
```

_2^54_ and _20!_ are not small integers:

```
>>> (2 ** 54).isSmallInteger
false

>>> 20.!.isSmallInteger
false
```

_2^54_ is accurately represented:

```
>>> let a = 2 ^ 54;
>>> let b = 2 ** 54;
>>> (a = b, a == b)
(true, false)

>>> let a = 20.!;
>>> let b = Float(a);
>>> (a = b, a == b)
(true, false)
```

_2^54_ and _20!_ are not uniquely represented:

```
>>> let a = Float(2 ^ 54);
>>> a = (a - 1)
true

>>> let a = (2 ^ 54);
>>> a = (a - 1)
false

>>> let a = Float(20.!);
>>> a = (a - 1)
true

>>> let a = 20.!;
>>> a = (a - 1)
false
```

At `Integer`,
answers `true` is the value is an integer and if that integer is a safe integer:

```
>>> 23L.isSmallInteger
true

>>> let x = (2 ^ 54);
>>> (x.isInteger, x.isSmallInteger)
(true, false)

>>> 2/1.isSmallInteger
true

>>> let x = 3/2;
>>> (x.isInteger, x.isSmallInteger)
(false, false)

>>> 3.000D.isSmallInteger
true

>>> 3.141D.isSmallInteger
false
```

At `Fraction`:

```
>>> let x = 23/1;
>>> (x.isInteger, x.isSmallInteger)
(true, true)

>>> let x = 9904578032905937/1;
>>> (x.isInteger, x.isSmallInteger)
(true, false)

>>> let x = 23/7;
>>> (x.isInteger, x.isSmallInteger)
(false, false)
```

A `List` is not a small integer:

```
>>> { [1 2 3].isSmallInteger }.hasError
true

>>> [1 2 3].allTrue(isSmallInteger/1)
true
```

Not-a-number is not a small integer:

```
>>> NaN.isSmallInteger
false
```

* * *

See also: Float, isGaussianInteger, isInteger, isInteger, isNumber, isFloat

Guides: Integer Functions

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isSafeInteger),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-number.issafeinteger)

Categories: Testing
