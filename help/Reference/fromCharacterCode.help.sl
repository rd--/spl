# fromCharacterCode

_fromCharacterCode(anInteger | aSequence)_

Answer a String consisting of the character with integer code _anInteger_.

Space character:

```
>>> 32.fromCharacterCode
' '
```

A String consisting of the sequence of characters with codes 97, 98, and 99:

```
>>> [97 98 99].fromCharacterCode
'abc'
```

A List of Strings:

```
>>> [97 98 99; 100 101 102].fromCharacterCode
['abc' 'def']
```

Non-Ascii characters:

```
>>> (225 .. 227).fromCharacterCode
'áâã'
```

* * *

See also: asCharacter, Character

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromCharacterCode.html)
