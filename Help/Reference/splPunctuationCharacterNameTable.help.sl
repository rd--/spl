# splPunctuationCharacterNameTable

- _splPunctuationCharacterNameTable(s)_

At `System`,
answer a `Dictionary` where the `keys` are punctuation characters and the values are punctuation character names.

```
>>> let t = system
>>> .splPunctuationCharacterNameTable;
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

See also: splOperatorTokenName, splOperatorNameTable, splPunctuationCharacters, system

Guides: Reflection Functions

Categories: Reflection
