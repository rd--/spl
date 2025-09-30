# decapitalize

- _decapitalize(s)_

Answer a copy of the string _s_ with the first character decapitalized if it is a letter.

```
>>> 'Ascii'.decapitalize
'ascii'

>>> 'A sentence.'.decapitalize
'a sentence.'

>>> '3.141'.decapitalize
'3.141'
```

Capitalize letters of the Greek alphabet:

```
>>> 'Π'.decapitalize
'π'

>>> 'Φ'.decapitalize
'φ'
```

Threads over lists:

```
>>> ['A' 'B' 'C'].decapitalize
['a' 'b' 'c']

>>> ['Apple' 'Bear' 'Cat'].decapitalize
['apple' 'bear' 'cat']
```

* * *

See also: asLowerCase, asUpperCase, capitalize, isLowerCase, isUpperCase, String

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Decapitalize.html),
_W_
[1](https://en.wikipedia.org/wiki/Capitalization)

Categories: Converting
