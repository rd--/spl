# isAlphaNumeric

- _isAlphaNumeric(s)_

Answer `true` if the string, or character, _s_ is either a letter or digit, else `false`.

```
>>> '3'.isAlphaNumeric
true

>>> 'x'.isAlphaNumeric
true

>>> ','.isAlphaNumeric
false
```

It is an `error` if the string is not a character:

```
>>> { '3x'.isAlphaNumeric }.hasError
true
```

* * *

See also: isDigit, isLetter

Guides: String Functions

References:
_Smalltalk_
5.3.4.6

Categories: Testing
