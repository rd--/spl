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

The characters are listed sorted by name, not code point:

```
>>> let c = system.operatorCharacters;
>>> c = c.copy.sortOn(operatorTokenName:/1)
true

>>> let c = system.operatorCharacters;
>>> c = c.copy.sortOn(codePoint:/1)
false
```

The `operatorCharacters` are a subset of the `punctuationCharacters`.

* * *

See also: operatorNameTable, operatorTokenName, punctuationCharacters
