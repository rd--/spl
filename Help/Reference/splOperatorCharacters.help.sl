# splOperatorCharacters

- _splOperatorCharacters(system)_

Answer the list of operator characters.

```
>>> system.splOperatorCharacters.size
18

>>> system.splOperatorCharacters.reject(
>>> 	isReverseSolidus:/1
>>> )
[
	'&' '*' '^' '@' '$' '=' '!' '>' '-' '<'
	'#' '%' '+' '?' '/' '~' '|'
]
```

The characters are listed sorted by name, not code point:

```
>>> let c = system.splOperatorCharacters;
>>> c.copy.sortOn(
>>> 	splOperatorTokenName:/1
>>> ) = c
true

>>> let c = system.splOperatorCharacters;
>>> c.copy.sortOn(codePoint:/1) = c
false
```

The `splOperatorCharacters` are a subset of the `splPunctuationCharacters`.

* * *

See also: splOperatorNameTable, splOperatorTokenName, splPunctuationCharacters

Guides: Reflection Functions
