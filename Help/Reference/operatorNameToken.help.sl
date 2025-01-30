# operatorNameToken

- _operatorNameToken(aString)_

Answer the operator token that corresponds to the specified operator name.

```
>>> 'plusSign'.operatorNameToken
'+'

>>> 'asterisk'.operatorNameToken
'*'

>>> 'greaterThanSignEqualsSign'.operatorNameToken
'>='
```

The inverse is `operatorTokenName`:

```
>>> 'solidus'.operatorNameToken.operatorTokenName
'solidus'
```

If the string is not an operator name, answer `nil`:

```
>>> '.'.operatorNameToken
nil
```

* * *

See also: isOperatorToken, operatorTokenName
