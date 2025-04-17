# LargeInteger

A `Type` representing an arbitrary precision integral number.

Large integers have a distinct literal syntax indicated by an _n_ suffix.

```
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

Adapts left and right operands to `LargeIntegers`:

```
>>> 23L ^ 23
20880467999847912034355032910567L

>>> 23 ^ 23L
20880467999847912034355032910567L

>>> 23 ^ 23
2.088E31
```

Division by an integer answers either a `LargeInteger` or a `Fraction`:

```
>>> 32L / 4
8L

>>> 23L / 5
23/5
```

Division by `zero` signals an `error`:

```
>>> { 23L / 0 }.ifError { true }
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

`negated` answers a `LargeInteger`:

```
>>> 23L.negated
-23L
```

Cannot be implicitly converted to a `SmallFloat`:

```
>>> { 23L * 2.5 }.ifError { true }
true

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
>>> 7612058254738945 * 9263591128439081L
70514995317761165008628990709545L

>>> 9263591128439081 = 9263591128439080
7.051499531776115E+31
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

* * *

See also: asLargeInteger, Binary, Integer, Magnitude, Number, parseLargeInteger, SmallFloat

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-bigint-objects)

Categories: Math, Type
