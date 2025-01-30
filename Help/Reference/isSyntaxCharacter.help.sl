# isSyntaxCharacter

- _isSyntaxCharacter(aString)_

Answer `true` if _aString_ is a puncuation character in the context of the Spl grammar.

Valid syntax characters:

```
>>> '_'.isSyntaxCharacter
true

>>> '.'.isSyntaxCharacter
true
```

Invalid syntax characters, which includes the operator characters:

```
>>> '*'.isSyntaxCharacter
false

>>> 'x'.isSyntaxCharacter
false
```

It is an `error` if _aString_ is not a single character:

```
>>> { '..'.isSyntaxCharacter }.ifError { true}
true
```

* * *

See also: isOperatorCharacter, isSyntaxToken
