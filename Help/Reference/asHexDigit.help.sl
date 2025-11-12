# asHexDigit

- _asHexDigit(n)_

Answer the `String` representing given hexadecimal digit.

```
>>> 15.asHexDigit
'F'

>>> [0 .. 15]
>>> .collect(asHexDigit:/1)
>>> .stringJoin
'0123456789ABCDEF'
```

Signal an `error` if out of bounds:

```
>>> { -1.asHexDigit }.hasError
true
```

* * *

See also: asHexString, base16Encode, Character, Integer

Guides: String Functions

Categories: Converting
