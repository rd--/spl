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

Adapts left and right operands to `LargeIntegers`:

```
>>> 23n ^ 23
20880467999847912034355032910567n

>>> 23 ^ 23n
20880467999847912034355032910567n

>>> 23 ^ 23
2.088E31
```

* * *

See also: asLargeInteger, Binary, Integer, Magnitude, Number, SmallFloat

Categories: Math, Type
