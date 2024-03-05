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

Characters are cached on construction, and are therefore identical.

```
>>> 'x'.asCharacter == 120.asCharacter
true
```

There is no literal syntax for characters.

```
>>> 'x'.asCharacter.printString
'\'x\''

>>> 'x'.asCharacter.storeString
'120.asCharacter'
```

Character predicates: `isCharacter`, `isDigit`, `isLetter`, `isUpperCase`, `isLowerCase`, `isAlphaNumeric`.

_Note:_
Strings in Spl are not Lists of Characters.
Except where necessary Characters and Character lists are not recommended.

* * *

See also: asCharacter, String

Categories: Text, Type
