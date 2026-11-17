# Small Integers

Sᴘʟ has no distinct small integer type.
The `Float` type,
an IEEE 754 64-bit double-precision floating-point number,
allows for correct 53-bit small integer math.

The literal small integer syntax answers `Float` values:

```
>>> 23.isSmallInteger
true

>>> 23.isFloat
true
```

The syntax performs bounds checking,
it is an error to write an integer literal that is not a valid small integer.
`Float` values that are not small integers must be written as real numbers,
with a trailing `.0` suffix,
or as large integers:

```
>>> 2L ^ 53L - 1L
9007199254740991L

>>> SmallInteger(2L ^ 53L - 1L)
9007199254740991.0

>>> 9007199254740992L + 1L
9007199254740993L

>>> 9007199254740992.0 + 1.0
9007199254740992.0
```


Both positive and negative signs are allowed:

```
>>> 2 - -2
4

>>> -2 - +2
-4
```

Non-type predicates:

- `isIeeeInteger`
- `isIntegerValuedNumber`
- `isRealValuedNumber`
- `isSmallIntegerValuedNumber`
- `isSmallInteger`

* * *

See also: Float, Integer, isInteger, isSmallInteger

Guides: Number Syntax
