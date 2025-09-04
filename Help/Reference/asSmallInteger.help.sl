# asSmallInteger

- _asSmallInteger(x)_

Answer the `SmallFloat` that is equal to the number _x_,
which must be an integer value.

At `SmallFloat`:

```
>>> 23.asSmallInteger
>>> 23
```

It is an error if the value is not an integer:

```
>>> {
>>> 	1.pi.asSmallInteger
>>> }.ifError { true }
true
```

At `LargeInteger`:

```
>>> 8388608L.asSmallInteger
8388608
```

It is an error if the value is cannot be represented as a small integer:

```
>>> {
>>> 	(2L ^ 53L).asSmallInteger
>>> }.ifError { true }
true
```

At `Fraction`:

```
>>> 23/1.asSmallInteger
>>> 23
```

At `Decimal`:

```
>>> 23.0D.asSmallInteger
>>> 23
```

* * *

See also: asInteger, asLargeInteger, isSmallInteger, Fraction, SmallFloat, LargeInteger

Guides: Bitwise Functions, Integer Functions

Categories: Converting
