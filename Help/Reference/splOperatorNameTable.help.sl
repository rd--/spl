# splOperatorNameTable

- _splOperatorNameTable(aSystem)_

Answer a `Dictionary` where the `keys` are operator tokens and the values are operator names.

```
>>> let t = system.splOperatorNameTable;
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
>>> let t = system.splOperatorNameTable;
>>> let a = t.associations.collect { :each |
>>> 	each.value -> each.key
>>> }.sort;
>>> [1 2].collect { :k |
>>> 	a.select { :each |
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
	'exclamationMarkEqualsSign' -> '!=',
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
	'verticalLineVerticalLine' -> '||'
]
```

* * *

See also: splPunctuationCharacterNameTable, splOperatorTokenName

Guides: Binary Operators, Reflection Functions

Categories: Reflection
