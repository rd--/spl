# Character

A `Character` is both a `Trait`, and also a `Type` holding a single character string.

The `codePoint` method retrieves the unicode code point:

```
>>> 'x'.codePoint
120

>>> 'x'.asCharacter.codePoint
120
```

The `characterString` method retrieves the single element string:

```
>>> 'x'.asCharacter.characterString
'x'

>>> 'x'.characterString
'x'
```

Characters are cached on construction, and therefore equal characters are identical:

```
>>> let c1 = 'x'.asCharacter;
>>> let c2 = 120.asCharacter;
>>> (c1 = c2, c1 == c2)
(true, true)
```

There is no literal syntax for characters,
the `printString` for a `Character` is equal to the `printString` for a one place `String`:

```
>>> 'x'.printString
'x'.asCharacter.printString
```

The `storeString` is distinguished:

```
>>> 'x'.asCharacter.storeString
'120.asCharacter'
```

A `Character` is not equal to an equivalent string of one place,
but it is similar to such:

```
>>> let s = 'c';
>>> let c = 'c'.asCharacter;
>>> (s = c, c = s, s ~ c, c ~ s)
(false, false, true, true)
```

_Note:_
A `String` in Spl is not a `List` of `Character` values.
Except where necessary the of `Character` and `Character` `List` values are not recommended.

* * *

See also: asCharacter, isAlphaNumeric, isCharacter, isDigit, isLetter, isUpperCase, isLowerCase, String

Categories: Text, Type
