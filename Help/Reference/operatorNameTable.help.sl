# operatorNameTable

- _operatorNameTable(aSystem)_

Answer a `Dictionary` where the `keys` are operators and the values are operator names.

```
>>> let t = system.operatorNameTable;
>>> (t.size, t['++'], t['&'])
(44, 'plusSignPlusSign', 'ampersand')
```

One-, two- and three-character operators:

```
>>> let all = system.operatorNameTable.associations.collect { :each |
>>> 	each.value -> each.key
>>> }.sort;
>>> let bySize = [1 2 3].collect { :k |
>>> 	all.select { :each |
>>> 		each.value.size = k
>>> 	}
>>> };
>>> (bySize.collect(size:/1), bySize)
(
	[18, 23, 3],
	[
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
			'verticalLine' -> '|'
		],
		[
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
		],
		[
			'greaterThanSignGreaterThanSignGreaterThanSign' -> '>>>',
			'lessThanSignEqualsSignGreaterThanSign' -> '<=>',
			'plusSignPlusSignPlusSign' -> '+++'
		]
	]
)
```

* * *

See also: punctuationCharacterNameTable, operatorName

Guides: Binary Operators

Categories: Reflection
