# Integer

- _Integer(x)_

`Integer` both a `Trait` for numbers,
and a generalised constructor for both small and large integers.

Answers the value _x_ as the either a small or large integer as required.
In the `Integer` case this will answer a value that is equal to _x_,
however it may change the type of the value:

```
>>> let x = 23L;
>>> let y = x.Integer;
>>> (y, x = y, x == y)
(23, true, false)
```

At `Fraction`:

```
>>> let x = 23/1;
>>> let y = x.Integer;
>>> (y, x = y, x == y)
(23, true, false)
```

At `Decimal`:

```
>>> 3D.Integer
3
```

At `LargeInteger`,
answers a `SmallFloat` if the value would answer `true` for `isSmallInteger`:

```
>>> let x = 23L.Integer;
>>> (x, x.isLargeInteger)
(23, false)

>>> let x = (2L ^ 54).Integer;
>>> (x, x.isLargeInteger)
(18014398509481984L, true)
```

At `SmallFloat`, `Fraction` and `Decimal` it is an error if the value is not an integer:

```
>>> { 1.pi.Integer }.hasError
true

>>> { 22/7.Integer }.hasError
true

>>> { 3.142D.Integer }.hasError
true
```

At `Decimal` there must be no decimal places:

```
>>> { 3.0D.Integer }.hasError
true
```

To convert a non-integer to an integer use `round` or `ceiling` or `floor` or `truncate`:

```
>>> let x = 1.pi;
>>> (x.round, x.floor, x.ceiling, x.truncate)
(3, 3, 4, 3)
```

To convert a `Boolean` to an integer use `boole`:

```
>>> false.boole
0

>>> true.boole
1
```

Not defined at `String`:

```
>>> {
>>> 	'1'.Integer
>>> }.hasError
true
```

To get the code point of a character use `codePoint`:

```
>>> '~'.codePoint
126
```

To parse a `String` as an integer use `parseDecimalInteger`:

```
>>> '23'.parseDecimalInteger
23
```

Threads over lists:

```
>>> [23 23.0 23L].Integer
[23 23 23]
```

`Integer` is a `Trait`:

```
>>> system
>>> .traitDictionary['Integer']
>>> .isTrait
true
```

Types implementing `Integer`:

```
>>> system
>>> .traitTypes('@Integer')
>>> .sort!
[
	'LargeInteger'
	'SmallFloat'
	'Symbol'
]
```

Methods for arithmetic:

- `isPowerOfTwo`
- `factorial`
- `gcd`
- `lcm`
- `take`

* * *

See also: Binary, Float, Fraction, Number, SmallFloat, SmallInteger, LargeInteger

Guides: Integer Functions, Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Integer.html),
_Smalltalk_
5.6.2.16

Categories: Converting, Numeric, Trait
