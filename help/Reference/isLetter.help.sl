# isLetter

- _isLetter(aCharacter)_

Answer `true` if _aCharacter_ represents a letter, else `false`.

```
>>> 'x'.isLetter
true

>>> 'Y'.asCharacter.isLetter
true

>>> '1'.isLetter
false

>>> ','.isLetter
false
```

There are twenty six letters and each has two cases:

```
>>> 0:255.collect(asCharacter:/1).select(isLetter:/1).size
2 * 26
```

* * *

See also: Character, isDigit, isLowerCase, isUpperCase

References:
_Smalltalk_
5.3.4.8

Categories: Testing
