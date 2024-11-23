# morseCode

- _morseCode(aCharacter)_

Answer the Morse code for _aCharacter_ as a `String` of dots ('.') and dashes ('-').

Vowels:

```
>>> 'eaiou'.asList.collect(morseCode:/1)
[
	'.',
	'.-', '..',
	'---', '..-'
]
```

Consonants, grouped by code length:

```
>>> 't'.morseCode
'-'

>>> 'mn'.asList.collect(morseCode:/1)
['--' '-.']

>>> 'dgkrsw'.asList.collect(morseCode:/1)
[
	'-..', '--.', '-.-',
	'.-.', '...', '.--'
]

>>> 'bcfhjlpqvxyz'.asList.collect(morseCode:/1)
[
	'-...', '-.-.', '..-.', '....',
	'.---', '.-..', '.--.', '--.-',
	'...-', '-..-', '-.--', '--..'
]
```

Numbers:

```
>>> '1234567890'.asList.collect(morseCode:/1)
[
	'.----', '..---', '...--', '....-', '.....',
	'-....', '--...', '---..', '----.', '-----'
]
```

* * *

See also: Character

References:
_ITU_
[1](https://www.itu.int/rec/R-REC-M.1677-1-200910-I/)
