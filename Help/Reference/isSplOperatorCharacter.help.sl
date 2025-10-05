# isSplOperatorCharacter

- _isSplOperatorCharacter(s)_

Answer `true` if the string _s_ is a valid Sᴘʟ operator character.

Valid operator character:

```
>>> '*'.isSplOperatorCharacter
true

>>> '<=>'.characters
>>> .allSatisfy(
>>> 	isSplOperatorCharacter:/1
>>> )
true
```

Invalid operator names:

```
>>> '_'.isSplOperatorCharacter
false

>>> 'x'.isSplOperatorCharacter
false
```

* * *

See also: isSplOperatorCharacter, isSplPunctuationCharacter, isSplSyntaxCharacter, splOperatorCharacterName

Guides: Reflection Functions

Categories: Reflection
