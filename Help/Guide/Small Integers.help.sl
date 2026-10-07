# Small Integers

Spl, at present, has no distinct small integer type.
There is a `SmallFloat` type,
an IEEE 754 64-bit double-precision floating-point number,
which allows for correct 53-bit small integer math.

The literal integer syntax answers small integers and performs bounds checking,
values that are not small integers _must_ be written as real numbers,
or as large integers:

```
>>> 2 ^ 53 - 1
9007199254740991

>>> 9007199254740991 + 1
9007199254740992.0

>>> 9007199254740991L + 1
9007199254740992L
```

Non-type predicates:

- `isInteger`
- `isSmallInteger`

* * *

See also: isInteger, isSmallInteger, LargeInteger, SmallFloat
