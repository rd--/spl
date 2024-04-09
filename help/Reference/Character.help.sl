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

Characters are cached on construction, and therefore equal charactres are identical.

```
>>> let c1 = 'x'.asCharacter;
>>> let c2 = 120.asCharacter;
>>> (c1 = c2, c1 == c2)
(true, true)
```

There is no literal syntax for characters.

```
>>> 'x'.asCharacter.printString
'\'x\''

>>> 'x'.asCharacter.storeString
'120.asCharacter'
```

_Note:_
Strings in Spl are not Lists of Characters.
Except where necessary Characters and Character lists are not recommended.

* * *

See also: asCharacter, isAlphaNumeric, isCharacter, isDigit, isLetter, isUpperCase, isLowerCase, String

Categories: Text, Type
