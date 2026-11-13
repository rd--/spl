# Integer

- _Integer(x)_

`Integer` is a both a type representing an arbitrary precision integral number,
and a trait for integral numberic types.

At `Float`:

```
>>> let x = 23;
>>> let y = Integer(x);
>>> (y, x = y, x == y)
(23L, true, false)

>>> let i = 2 ^ 23;
>>> let j = Integer(i);
>>> (i, j, i = j, i == j, j.isInteger)
(8388608, 8388608L, true, false, true)
```

At `NaN`:

```
>> Integer(NaN)
NaN

>> 3L + NaN
NaN

>> NaN + 3L
NaN
```

At a small `Integer` value:

```
>>> let x = 23L;
>>> let y = Integer(x);
>>> (y, x = y, x == y)
(23L, true, true)
```

At a large `Integer` value:

```
>>> let x = 23L ^ 13;
>>> let y = Integer(x);
>>> (y, x = y, x == y)
(504036361936467383L, true, true)
```

At `Fraction`:

```
>>> Integer(23/1)
23L

>>> {
>>> 	Integer(22/7)
>>> }.hasError
true
```

At `Decimal`:

```
>>> Integer(23D)
23L

>>> Integer(23.000D)
23L

>>> {
>>> 	Integer(3.141D)
>>> }.hasError
true
```

At `Float` and `Decimal`,
it is an error if the value is not an integer:

```
>>> {
>>> 	Integer(1.pi)
>>> }.hasError
true

>>> let a = 2L ^ 56;
>>> let b = Float(a);
>>> {
>>> 	Integer(b)
>>> }.hasError
true

>>> {
>>> 	Integer(3.142D)
>>> }.hasError
true
```

At `Decimal` there may be decimal places if they are `zero`:

```
>>> Integer(3.000D)
3
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

Threads over list:

```
>>> Integer[1 3D 5L 7/1 9.0]
[1L 3L 5L 7L 9L]
```

Integers have a distinct literal syntax indicated by an _L_ suffix:

```
>>> Integer(23)
23L

>>> 23L.typeName
'Integer'
```

Equality with `Float`:

```
>>> 1L = 1
true
```

Non-identity with `Float`:

```
>>> 1 == 1L
false

>>> 1 == 1
true

>>> 1L == 1L
true
```

Equal values are also identical,
and while `Integer` values are considered immediate,
they do not compare identically with `Float` values:

```
>>> 23L == 23L
true

>>> 23L == 23.0
false

>>> 23L.isImmediate
true
```

Adapts left and right operands to `Integers`:

```
>>> 23L ^ 23
20880467999847912034355032910567L

>>> 23 ^ 23L
20880467999847912034355032910567L

>>> 23L ^ 0.5
23.sqrt

>>> 10L ^ [16 8 0]
[10000000000000000L 100000000L 1L]
```

Division by an integer answers either a `Integer` or a `Fraction`:

```
>>> 32L / 4
8L

>>> 23L / 5
23/5

>>> 23L / 1/2
46

>>> 23L / 0.5
46

>>> 0.5 / 23L
1/46

>>> (1L / 1, 1L / 1L, 1L / 1/1)
(1L, 1L, 1/1)
```

Multiplication of `Integer` and `Float` values:

```
>>> 23L * 5
115L

>>> 23 * 5L
115L

>>> 23L * 1.5
34.5
```

Division by `zero` answers `Infinity`:

```
>>> 23L / 0
Infinity
```

Math with a `Fraction` answers a `Fraction`:

```
>>> 23L - 2/3
67/3

>>> 23L + 2/3
71/3

>>> 23L * 2/3
46/3

>>> 23L / 2/3
69/2
```

`negate` answers a `Integer`:

```
>>> 23L.negate
-23L
```

Integer powers:

```
>>> 3L ^ [-3 .. 3]
[1/27 1/9 1/3 1 3 9 27]
```

Can be implicitly converted to a `Float`:

```
>>> 23L * 2.5
57.5

>>> Float(23L) * 2.5
57.5
```

`floor` and `ceiling` are identity:

```
>>> 23L.floor
23L

>>> 23L.ceiling
23L
```

Multiplication of integers:

```
>>> 7612058254738945
>>> *
>>> 9263591128439081L
70514995317761165008628990709545L
```

Print & store `String`:

```
>>> (23L ^ 23).printString
'20880467999847912034355032910567L'

>>> (23L ^ 23).storeString
'20880467999847912034355032910567L'
```

Zero:

```
>>> 0L.isZero
true

>>> 1L.zero
0L
```

One:

```
>>> 1L.isOne
true

>>> 0L.one
1L
```

`Integer` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Integer']
>>> .isTrait
true
```

Types implementing `Integer`:

```
>>> system
>>> .traitTypes('@Integer')
>>> .sort!
[
	'Float'
	'Integer'
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

See also: Binary, ByteArray, Float, Float, Fraction, Integer, Number, SmallInteger, parseInteger

Guides: Integer Functions, Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Integer.html),
_Smalltalk_
5.6.2.16,
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-bigint-objects),
_W_
[1](https://en.wikipedia.org/wiki/Integer)
[2](https://en.wikipedia.org/wiki/Integer_(computer_science))
