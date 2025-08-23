# isSplSyntaxCharacter

- _isSplSyntaxCharacter(s)_

Answer `true` if the string _s_ is a puncuation character in the context of the Spl grammar.

Valid syntax characters:

```
>>> '_'.isSplSyntaxCharacter
true

>>> '.'.isSplSyntaxCharacter
true
```

Invalid syntax characters, which includes the operator characters:

```
>>> '*'.isSplSyntaxCharacter
false

>>> 'x'.isSplSyntaxCharacter
false
```

It is an `error` if the string _s_ is not a single character:

```
>>> {
>>> 	'..'.isSplSyntaxCharacter
>>> }.ifError { true}
true
```

* * *

See also: isSplOperatorCharacter, isSplSyntaxToken

Guides: Reflection Functions
