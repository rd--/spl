# isOperatorToken

- _isOperatorToken(aString)_

Answer `true` if _aString_ is a valid operator name.

Valid operator names:

```
>>> '*'.isOperatorToken
true

>>> '<=>'.isOperatorToken
true
```

Invalid operator names:

```
>>> '_'.isOperatorToken
false

>>> 'x'.isOperatorToken
false
```

* * *

See also: isOperatorCharacter, isPunctuationToken, isSyntaxToken, operatorTokenName

Categories: Reflection
