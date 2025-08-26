# asHexDigit

- _asHexDigit(anInteger)_

Answer the `Character` representing given hexadecimal digit.

```
>>> 15.asHexDigit
'F'.asCharacter

>>> [0 .. 15].collect(asHexDigit:/1).stringJoin
'0123456789ABCDEF'
```

Signal an `error` if out of bounds:

```
>>> { -1.asHexDigit }.ifError { true }
true
```

* * *

See also: asHexString, base16Encode, Character, Integer

Categories: Converting
