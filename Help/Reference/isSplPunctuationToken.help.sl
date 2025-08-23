# isSplPunctuationToken

- _isSplPunctuationToken(s)_

Answer `true` if each character of the string _s_ answers `true` to `isSplPunctuationCharacter`.
The punctuation tokens are the union of the operator and syntax tokens.

Valid punctuation tokens:

```
>>> '*'.isSplPunctuationToken
true

>>> '<=>'.isSplPunctuationToken
true

>>> '_'.isSplPunctuationToken
true

>>> '..'.isSplPunctuationToken
true
```

Invalid punctuation tokens:

```
>>> 'x'.isSplPunctuationToken
false
```

* * *

See also: isSplOperatorToken, isSplPunctuationCharacter, splOperatorTokenName

Guides: Reflection Functions

Categories: Reflection
