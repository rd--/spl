# splOperatorNameToken

- _splOperatorNameToken(s)_

Answer the operator token that corresponds to the specified operator name string _s_.

```
>>> 'plusSign'.splOperatorNameToken
'+'

>>> 'asterisk'.splOperatorNameToken
'*'

>>> 'greaterThanSignEqualsSign'.splOperatorNameToken
'>='
```

This is distinct from the operator symbol:

```
>>> 'plus'.splOperatorSymbolToken
'+'

>>> 'times'.splOperatorSymbolToken
'*'

>>> 'less'.splOperatorSymbolToken
'<'
```

The inverse is `splOperatorTokenName`:

```
>>> 'solidus'
>>> .splOperatorNameToken
>>> .splOperatorTokenName
'solidus'
```

If the string is not an operator name, answer `nil`:

```
>>> '.'.splOperatorNameToken
nil
```

* * *

See also: isSplOperatorToken, splOperatorTokenName
