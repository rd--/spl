# isSyntaxToken

- _isSyntaxToken(aString)_

Answer `true` if each character of _aString_ answers `true` to `isSyntaxCharacter`.

Valid syntax tokens:

```
>>> '_'.isSyntaxToken
true

>>> '..'.isSyntaxToken
true
```

Invalid syntax tokens,
which includes valid operator tokens:

```
>>> '*'.isSyntaxToken
false

>>> '<=>'.isSyntaxToken
false

>>> 'x'.isSyntaxToken
false
```

* * *

See also: isOperatorToken, isPunctuationToken, isSyntaxCharacter

Categories: Reflection
