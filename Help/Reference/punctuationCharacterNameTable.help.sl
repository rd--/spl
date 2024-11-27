# punctuationCharacterNameTable

- _punctuationCharacterNameTable(aSystem)_

Answer a `Dictionary` where the `keys` are punctuation characters and the values are punctuation character names.

```
>>> let t = system.punctuationCharacterNameTable;
>>> (t.size, t['>'], t[':'], t['('], t['_'])
(
	32,
	'greaterThanSign',
	'colon',
	'leftParenthesis',
	'lowLine'
)
```

* * *

See also: operatorName, operatorNameTable, punctuationCharacters

Categories: Reflection
