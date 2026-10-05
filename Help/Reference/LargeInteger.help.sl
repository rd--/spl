# LargeInteger

- _LargeInteger(x)_

A `Type` representing an arbitrary precision integral number.

At `SmallFloat`:

```
>>> let i = 2 ^ 23;
>>> let j = LargeInteger(i);
>>> (i, j, i = j, i == j, j.isLargeInteger)
(8388608, 8388608L, true, false, true)
```

It is an error if the value is not an integer:

```
>>> {
>>> 	LargeInteger(1.pi)
>>> }.hasError
true
```

At `LargeInteger`:

```
>>> LargeInteger(8388608L)
8388608L
```

At `Fraction`:

```
>>> LargeInteger(23/1)
23L

>>> {
>>> 	LargeInteger(22/7)
>>> }.hasError
true
```

At `Decimal`:

```
>>> LargeInteger(23D)
23L

>>> {
>>> 	LargeInteger(23.0D)
>>> }.hasError
true

>>> {
>>> 	LargeInteger(3.141D)
>>> }.hasError
true
```

At `ByteArray`:

```
>>> LargeInteger(ByteArray[1 3 5 7])
1L + (3 << 8) + (5 << 16) + (7 << 24)

>>> let n = 117768961L;
>>> 1:4.collect { :each |
>>> 	n.digitAt(each)
>>> }
[1L 3L 5L 7L]

>>> ByteArray[
>>> 	245 124 239 253 184
>>> 	104 49 179 174 168
>>> 	5 89 18
>>> ].LargeInteger
1453657932340170668622419557621L
```

Large integers have a distinct literal syntax indicated by an _L_ suffix.

```
>>> LargeInteger(23)
23L

>>> 23L.typeOf
'LargeInteger'
```

Equality with `SmallFloat`:

```
>>> 1L = 1
true
```

Non-identity with `SmallFloat`:

```
>>> 1 == 1L
false

>>> 1 == 1
true

>>> 1L == 1L
true
```

Equal values are also identical,
however `LargeInteger` values are not considered immediate because the do not compare identically with `SmallFloat` values:

```
>>> 23L == 23L
true

>>> 23L.isImmediate
false
```

Adapts left and right operands to `LargeIntegers`:

```
>>> 23L ^ 23
20880467999847912034355032910567L

>>> 23 ^ 23L
20880467999847912034355032910567L

>>> 23 ^ 23
2.088E31

>>> 23L ^ 0.5
23.sqrt

>>> 10L ^ [16 8 0]
[10000000000000000L 100000000L 1L]
```

Division by an integer answers either a `LargeInteger` or a `Fraction`:

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
```

Multiplication of `LargeInteger` and `SmallFloat` values:

```
>>> 23L * 5
115L

>>> 23 * 5L
115L

>>> 23L * 1.5
34.5
```

Division by `zero` signals an `error`:

```
>>> { 23L / 0 }.hasError
true
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

`negate` answers a `LargeInteger`:

```
>>> 23L.negate
-23L
```

Can be implicitly converted to a `SmallFloat`:

```
>>> 23L * 2.5
57.5

>>> 23L.asSmallFloat * 2.5
57.5
```

`floor` and `ceiling` are identity:

```
>>> 23L.floor
23L

>>> 23L.ceiling
23L
```

Multiplication of large integers:

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

>>> (23L ^ 23).asString
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

* * *

See also: Binary, ByteArray, Integer, Magnitude, Number, parseLargeInteger, SmallFloat

Guides: Integer Functions

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-bigint-objects)

Categories: Math, Type
