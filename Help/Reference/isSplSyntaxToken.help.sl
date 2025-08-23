# isSplSyntaxToken

- _isSplSyntaxToken(s)_

Answer `true` if each character of the string _s_ answers `true` to `isSplSyntaxCharacter`.

Valid syntax tokens:

```
>>> '_'.isSplSyntaxToken
true

>>> '..'.isSplSyntaxToken
true
```

Invalid syntax tokens,
which includes valid operator tokens:

```
>>> '*'.isSplSyntaxToken
false

>>> '<=>'.isSplSyntaxToken
false

>>> 'x'.isSplSyntaxToken
false
```

* * *

See also: isSplOperatorToken, isSplPunctuationToken, isSplSyntaxCharacter

Guides: Reflection Functions

Categories: Reflection
