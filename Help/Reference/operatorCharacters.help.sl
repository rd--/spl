# operatorCharacters

- _operatorCharacters(aSystem)_

Answer the list of operator characters.

```
>>> system.operatorCharacters.size
18

>>> system.operatorCharacters.reject(
>>> 	isReverseSolidus:/1
>>> )
[
	'&' '*' '^' '@' '$' '=' '!' '>' '-' '<'
	'#' '%' '+' '?' '/' '~' '|'
]
```

The characters are listed sorted by their code point:

```
>>> let c = system.operatorCharacters;
>>> c = c.sortOn(codePoint:/1)
true
```

The `operatorCharacters` are a subset of the `punctuationCharacters`.

* * *

See also: operatorName, operatorNameTable, punctuationCharacterNameTable, punctuationCharacters
