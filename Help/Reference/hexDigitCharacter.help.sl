# hexDigitCharacter

- _hexDigitCharacter(n)_

Answer the `String` representing given hexadecimal digit.

```
>>> 15.hexDigitCharacter
'F'

>>> [0 .. 15]
>>> .collect(hexDigitCharacter/1)
>>> .stringJoin
'0123456789ABCDEF'
```

Signal an `error` if out of bounds:

```
>>> { 16.hexDigitCharacter }.hasError
true
```

* * *

See also: Character, Integer, base16Encode, digitCharacter, hexString

Guides: String Functions

Categories: Converting
