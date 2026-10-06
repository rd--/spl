# SmallInteger

- _SmallInteger(x)_

Answer the `SmallFloat` that is equal to the number _x_,
which must be an integer value.

At `SmallFloat`:

```
>>> SmallInteger(23)
23
```

It is an error if the value is not an integer:

```
>>> {
>>> 	SmallInteger(1.pi)
>>> }.hasError
true
```

At `LargeInteger`:

```
>>> SmallInteger(8388608L)
8388608
```

It is an error if the value is cannot be represented as a small integer:

```
>>> {
>>> 	SmallInteger(2L ^ 53L)
>>> }.hasError
true
```

At `Fraction`, must be an integer:

```
>>> SmallInteger(23/1)
23

>>> {
>>> 	SmallInteger(22/7)
>>> }.hasError
true
```

At `Decimal`, must be an integer:

```
>>> SmallInteger(23D)
23

>>> {
>>> 	SmallInteger(23.0D)
>>> }.hasError
true

>>> {
>>> 	SmallInteger(3.141D)
>>> }.hasError
true
```

* * *

See also: Fraction, SmallFloat, LargeInteger, Integer, isSmallInteger

Guides: Bitwise Functions, Integer Functions, Number Functions

Categories: Converting
