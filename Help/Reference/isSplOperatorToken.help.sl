# isSplOperatorToken

- _isSplOperatorToken(s)_

Answer `true` if the string _s_ is a valid operator name.

Valid operator names:

```
>>> '*'.isSplOperatorToken
true

>>> '<=>'.isSplOperatorToken
true
```

Invalid operator names:

```
>>> '_'.isSplOperatorToken
false

>>> 'x'.isSplOperatorToken
false
```

* * *

See also: isSplOperatorCharacter, isSplPunctuationToken, isSplSyntaxToken, splOperatorTokenName

Guides: Reflection Functions

Categories: Reflection
