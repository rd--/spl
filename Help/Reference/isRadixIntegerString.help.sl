# isRadixIntegerString

- _isRadixIntegerString(aString, radix)_

Answer `true` if _aString_ consists only of digits in the specified _radix_,
allowing for an initial sign character.

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
```

Allows both upper and lower case for radices above ten:

```
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

See also: asNumber, isBooleanString, isFloatString

References:
_W_
[1](https://en.wikipedia.org/wiki/Radix)

Categories: Testing
