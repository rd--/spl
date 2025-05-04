# isRadixIntegerString

- _isRadixIntegerString(aString, radix)_

Answer `true` if _aString_ consists only of the decimal digits _0_ through _9_,
perhaps prefixed by a negation sign.

This does not allow a zero fractional part,
i.e. one must write _23_ not _23.0_.

```
>>> '01'.isRadixIntegerString(2)
true

>>> '0123'.isRadixIntegerString(4)
true

>>> '01234567'.isRadixIntegerString(8)
true

>>> '0123456789'
>>> .isRadixIntegerString(10)
true

>>> '0123456789ABCDEFabcdef'
>>> .isRadixIntegerString(16)
true
```

An initial sign is allowed:

```
>>> '-0101'.isRadixIntegerString(2)
true

>>> '-0312'.isRadixIntegerString(4)
true

>>> '-35'.isRadixIntegerString(8)
true

>>> '-23'.isRadixIntegerString(10)
true

>>> '+23'.isRadixIntegerString(10)
true

>>> '-AE'.isRadixIntegerString(16)
true
```

The empty string answers `false`:

```
>>> ''.isRadixIntegerString(4)
false
```

* * *

See also: asNumber, isBooleanString, isFloatString, parseRadixInteger

Categories: Testing
