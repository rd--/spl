# characterRange

- _characterRange(min, max)_

At `String`:

```
>>> 'c'.characterRange('x')
[
	'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l'
	'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v'
	'w' 'x'
]

>>> 'C'.characterRange('X')
[
	'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L'
	'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V'
	'W' 'X'
]
```

Digits 0 through 9, as strings:

```
>>> '0'.characterRange('9')
['0' '1' '2' '3' '4' '5' '6' '7' '8' '9']
```

Greek alphabet (including ς):

```
>>> 'α'.characterRange('ω')
[
	'α' 'β' 'γ' 'δ' 'ε' 'ζ' 'η' 'θ' 'ι' 'κ'
	'λ' 'μ' 'ν' 'ξ' 'ο' 'π' 'ρ' 'ς' 'σ' 'τ'
	'υ' 'φ' 'χ' 'ψ' 'ω'
]
```

The character between Ρ and Σ is reserved and presently unused by the Unicode standard:

```
>>> 'Α'.characterRange('Ω')
[
	'Α' 'Β' 'Γ' 'Δ' 'Ε' 'Ζ' 'Η' 'Θ' 'Ι' 'Κ'
	'Λ' 'Μ' 'Ν' 'Ξ' 'Ο' 'Π' 'Ρ' '΢' 'Σ' 'Τ'
	'Υ' 'Φ' 'Χ' 'Ψ' 'Ω'
]
```

Printable Ascii characters that are not letters or numbers:

```
>>> ' '.characterRange('@').reject(isDigit:/1)
[
	' ' '!' '"' '#' '$' '%' '&' "'" '(' ')'
	'*' '+' ',' '-' '.' '/' ':' ';' '<' '='
	'>' '?' '@'
]

>>> '['.characterRange('~').reject(isLetter:/1)
['[' '\\' ']' '^' '_' '`' '{' '|' '}' '~']
```

At `Integer`:

```
1000.characterRange(1020).collect(asString:/1)
[
	'Ϩ' 'ϩ' 'Ϫ' 'ϫ' 'Ϭ' 'ϭ' 'Ϯ' 'ϯ' 'ϰ' 'ϱ'
	'ϲ' 'ϳ' 'ϴ' 'ϵ' '϶' 'Ϸ' 'ϸ' 'Ϲ' 'Ϻ' 'ϻ' 'ϼ'
]
```

At `Character`:

```
>>> 'a'.asCharacter.characterRange('c'.asCharacter)
[Character('a', 97), Character('b', 99), Character('c', 99)]
```

* * *

See also: asCharacter, Character, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CharacterRange.html)

Categories: Text
