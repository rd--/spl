# operatorName

- _operatorName(aString)_

Answer the name,
which is a `String`,
of the operator _aString_.

For single character operators this is the unicode table name of the character:

```
>>> '~'.operatorName
'tilde'
```

For multiple character operators, the indidual names are joined together:

```
>>> '!^'.operatorName
'exclamationMarkCircumflexAccent'

>>> '<=>'.operatorName
'lessThanSignEqualsSignGreaterThanSign'
```

The names of all of the `operatorCharacters`:

```
>>> system.operatorCharacters.collect { :each |
>>> 	each -> each.operatorName
>>> }
[
	'!' -> 'exclamationMark',
	'#' -> 'numberSign',
	'$' -> 'dollarSign',
	'%' -> 'percentSign',
	'&' -> 'ampersand',
	'*' -> 'asterisk',
	'+' -> 'plusSign',
	'-' -> 'hyphenMinus',
	'/' -> 'solidus',
	'<' -> 'lessThanSign',
	'=' -> 'equalsSign',
	'>' -> 'greaterThanSign',
	'?' -> 'questionMark',
	'@' -> 'commercialAt',
	'\\' -> 'reverseSolidus',
	'^' -> 'circumflexAccent',
	'|' -> 'verticalLine',
	'~' -> 'tilde'
]
```

This will not answer the names of non-operator characters,
see instead `punctuationTokenName`,
which will also answer the names of operators (since operators are a subset of punctuation tokens):

```
>>> '_'.punctuationTokenName
'lowLine'

>>> '&'.punctuationTokenName
'ampersand'
```

It is an `error` if the string is not an operator character:

```
>>> { 'x'.operatorName }.ifError { true }
true
```

* * *

See also: isOperator, isPunctuationToken, operatorCharacters, operatorNameTable, punctuationCharacterNameTable, punctuationTokenName

Guides: Binary Operators

Categories: Reflection
