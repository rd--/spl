# splPunctuationCharacters

- _splPunctuationCharacters(system)_

Answer the list of Spl punctuation characters.

```
>>> system.splPunctuationCharacters.size
32

>>> system
>>> .splPunctuationCharacters
>>> .reject { :each |
>>> 	each.isApostrophe | {
>>> 		each.isReverseSolidus
>>> 	}
>>> }
[
	'!' '#' '$' '%' '&' '*' '+' '-' '/' '<'
	'=' '>' '?' '@' '^' '|' '~' '"' '(' ')'
	',' ':' ';' '.' '[' ']' '_' '`' '{' '}'
]
```

The `splOperatorCharacters` are a subset of the `splPunctuationCharacters`.

The characters are listed sorted by their code point:

```
>>> let c = system.splPunctuationCharacters;
>>> c = c.sortOn(codePoint:/1)
true
```

* * *

See also: splOperatorTokenName, splOperatorNameTable, splPunctuationCharacterNameTable

Guides: Reflection Functions
