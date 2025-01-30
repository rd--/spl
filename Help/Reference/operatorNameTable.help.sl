# operatorNameTable

- _operatorNameTable(aSystem)_

Answer a `Dictionary` where the `keys` are operator tokens and the values are operator names.

```
>>> let t = system.operatorNameTable;
>>> (t.size, t['++'], t['&'], t['!^'])
(
	44,
	'plusSignPlusSign',
	'ampersand',
	'exclamationMarkCircumflexAccent'
)
```

One- and two-character operators:

```
>>> let table = system.operatorNameTable;
>>> let all = table.associations.collect { :each |
>>> 	each.value -> each.key
>>> }.sort;
>>> [1 2].collect { :k |
>>> 	all.select { :each |
>>> 		each.value.size = k
>>> 	}
>>> }.++
[
	'ampersand' -> '&',
	'asterisk' -> '*',
	'circumflexAccent' -> '^',
	'commercialAt' -> '@',
	'dollarSign' -> '$',
	'equalsSign' -> '=',
	'exclamationMark' -> '!',
	'greaterThanSign' -> '>',
	'hyphenMinus' -> '-',
	'lessThanSign' -> '<',
	'numberSign' -> '#',
	'percentSign' -> '%',
	'plusSign' -> '+',
	'questionMark' -> '?',
	'reverseSolidus' -> '\\',
	'solidus' -> '/',
	'tilde' -> '~',
	'verticalLine' -> '|',
	'ampersandAmpersand' -> '&&',
	'commercialAtAsterisk' -> '@*',
	'commercialAtGreaterThanSign' -> '@>',
	'equalsSignEqualsSign' -> '==',
	'exclamationMarkCircumflexAccent' -> '!^',
	'exclamationMarkGreaterThanSign' -> '!>',
	'exclamationMarkPlusSign' -> '!+',
	'exclamationMarkTilde' -> '!~',
	'greaterThanSignEqualsSign' -> '>=',
	'greaterThanSignGreaterThanSign' -> '>>',
	'greaterThanSignTilde' -> '>~',
	'hyphenMinusGreaterThanSign' -> '->',
	'lessThanSignEqualsSign' -> '<=',
	'lessThanSignExclamationMark' -> '<!',
	'lessThanSignHyphenMinus' -> '<-',
	'lessThanSignLessThanSign' -> '<<',
	'lessThanSignTilde' -> '<~',
	'plusSignPlusSign' -> '++',
	'reverseSolidusReverseSolidus' -> '\\\\',
	'solidusSolidus' -> '//',
	'tildeEqualsSign' -> '~=',
	'tildeTilde' -> '~~',
	'verticalLineVerticalLine' -> '||'
]
```

* * *

See also: punctuationCharacterNameTable, operatorTokenName

Guides: Binary Operators

Categories: Reflection
