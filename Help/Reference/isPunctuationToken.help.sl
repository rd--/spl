# isPunctuationToken

- _isPunctuationToken(aString)_

Answer `true` if each character of _aString_ answers `true` to `isPunctuationCharacter`.
The punctuation tokens are the union of the operator and syntax tokens.

Valid punctuation tokens:

```
>>> '*'.isPunctuationToken
true

>>> '<=>'.isPunctuationToken
true

>>> '_'.isPunctuationToken
true

>>> '..'.isPunctuationToken
true
```

Invalid punctuation tokens:

```
>>> 'x'.isPunctuationToken
false
```

* * *

See also: isOperatorToken, isPunctuationCharacter, operatorTokenName

Categories: Reflection
