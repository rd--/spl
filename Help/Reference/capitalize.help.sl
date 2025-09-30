# capitalize

- _capitalize(s)_

Answer a copy of the string _s_ with the first character capitalized if it is a letter.

```
>>> 'ascii'.capitalize
'Ascii'

>>> 'a sentence.'.capitalize
'A sentence.'

>>> '3.141'.capitalize
'3.141'
```

Capitalize letters of the Greek alphabet:

```
>>> 'π'.capitalize
'Π'

>>> 'φ'.capitalize
'Φ'
```

Threads over lists:

```
>>> ['a' 'b' 'c'].capitalize
['A' 'B' 'C']

>>> ['apple' 'bear' 'cat'].capitalize
['Apple' 'Bear' 'Cat']
```

* * *

See also: asLowerCase, asUpperCase, decapitalize, isLowerCase, isUpperCase, String

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Capitalize.html),
_W_
[1](https://en.wikipedia.org/wiki/Capitalization)

Categories: Converting
