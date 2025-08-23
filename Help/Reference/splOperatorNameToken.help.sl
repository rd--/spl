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
