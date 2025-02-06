# LargeInteger

A `Type` representing an arbitrary precision integral number.

Large integers have a distinct literal syntax indicated by an _n_ suffix.

```
>>> 23n.typeOf
'LargeInteger'
```

Equality with `SmallFloat`:

```
>>> 1n = 1
true
```

Non-identity with `SmallFloat`:

```
>>> 1 == 1n
false

>>> 1 == 1
true

>>> 1n == 1n
true
```

Adapts left and right operands to `LargeIntegers`:

```
>>> 23n ^ 23
20880467999847912034355032910567n

>>> 23 ^ 23n
20880467999847912034355032910567n

>>> 23 ^ 23
2.088E31
```

Division by an integer answers either a `LargeInteger` or a `Fraction`:

```
>>> 32n / 4
8n

>>> 23n / 5
23/5
```

Division by `zero` signals an `error`:

```
>>> { 23n / 0 }.ifError { true }
true
```

Math with a `Fraction` answers a `Fraction`:

```
>>> 23n - 2/3
67/3

>>> 23n + 2/3
71/3

>>> 23n * 2/3
46/3

>>> 23n / 2/3
69/2
```

`negated` answers a `LargeInteger`:

```
>>> 23n.negated
-23n
```

Cannot be implicitly converted to a `SmallFloat`:

```
>>> { 23n * 2.5 }.ifError { true }
true

>>> 23n.asSmallFloat * 2.5
57.5
```

`floor` and `ceiling` are identity:

```
>>> 23n.floor
23n

>>> 23n.ceiling
23n
```

Print `String`:

```
>>> (23n ^ 23).printString
'20880467999847912034355032910567'

>>> (23n ^ 23).asString
'20880467999847912034355032910567'
```

* * *

See also: asLargeInteger, Binary, Integer, Magnitude, Number, SmallFloat

References:
_Mozilla_
[1](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-bigint-objects)

Categories: Math, Type
