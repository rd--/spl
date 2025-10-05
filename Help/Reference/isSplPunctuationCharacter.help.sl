# isSplPunctuationCharacter

- _isSplPunctuationCharacter(s)_

Answer `true` if the string _s_ is a puncuation character in the context of the Sᴘʟ grammar.
The punctuation characters are the union of the operator and syntax characters.

```
>>> '*'.isSplPunctuationCharacter
true

>>> '_'.isSplPunctuationCharacter
true

>>> '.'.isSplPunctuationCharacter
true
```

It is an `error` if the string _s_ is not a single character:

```
>>> {
>>> 	'..'.isSplPunctuationCharacter
>>> }.hasError
true
```

* * *

See also: isSplOperatorCharacter, isSplPunctuationToken, isSplSyntaxCharacter

Guides: Reflection Functions
