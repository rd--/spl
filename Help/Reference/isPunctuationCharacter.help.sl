# isPunctuationCharacter

- _isPunctuationCharacter(aString)_

Answer `true` if _aString_ is a puncuation character in the context of the Spl grammar.
The punctuation characters are the union of the operator and syntax characters.

```
>>> '*'.isPunctuationCharacter
true

>>> '_'.isPunctuationCharacter
true

>>> '.'.isPunctuationCharacter
true
```

It is an `error` if _aString_ is not a single character:

```
>>> { '..'.isPunctuationCharacter }.ifError { true}
true
```

* * *

See also: isOperatorCharacter, isPunctuationToken, isSyntaxCharacter
