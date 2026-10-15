# morseCode

- _morseCode(c)_

Answer the Morse code for _c_ as a `String` of dots ('.') and dashes ('-').

```
>>> 's'.morseCode
'...'

>>> 'o'.morseCode
'---'
```

Threads over lists,
vowels in code-length order:

```
>>> List'eaiou'.morseCode
[
	'.'
	'.-'
	'..'
	'---'
	'..-'
]
```

Consonants, grouped by code length:

```
>>> 't'.morseCode
'-'

>>> List'mn'.morseCode
['--' '-.']

>>> List'dgkrsw'.morseCode
[
	'-..' '--.' '-.-'
	'.-.' '...' '.--'
]

>>> List'bcfhjlpqvxyz'.morseCode
[
	'-...' '-.-.' '..-.' '....'
	'.---' '.-..' '.--.' '--.-'
	'...-' '-..-' '-.--' '--..'
]
```

Numbers:

```
>>> List'1234567890'.morseCode
[
	'.----' '..---' '...--' '....-' '.....'
	'-....' '--...' '---..' '----.' '-----'
]
```

* * *

See also: characters

Guides: String Functions

References:
_ITU_
[1](https://www.itu.int/rec/R-REC-M.1677-1-200910-I/)
