# punctuationCharacters

- _punctuationCharacters(aSystem)_

Answer the list of punctuation characters.

```
>>> system.punctuationCharacters.size
32

>>> system.punctuationCharacters.reject { :each |
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

The `operatorCharacters` are a subset of the `punctuationCharacters`.

The characters are listed sorted by their code point:

```
>>> let c = system.punctuationCharacters;
>>> c = c.sortOn(codePoint:/1)
true
```

* * *

See also: operatorName, operatorNameTable, punctuationCharacters, punctuationCharacterNameTable
