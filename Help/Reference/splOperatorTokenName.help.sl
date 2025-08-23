# splOperatorTokenName

- _splOperatorTokenName(s)_

Answer the name,
which is a `String`,
of the operator token string _s_.

For single character operators this is the unicode table name of the character:

```
>>> '~'.splOperatorTokenName
'tilde'
```

For multiple character operators, the individual names are joined together:

```
>>> '!^'.splOperatorTokenName
'exclamationMarkCircumflexAccent'

>>> '<=>'.splOperatorTokenName
'lessThanSignEqualsSignGreaterThanSign'
```

The inverse is `splOperatorNameToken`:

```
>>> '/'
>>> .splOperatorTokenName
>>> .splOperatorNameToken
'/'
```

The names of all of the `splOperatorCharacters`:

```
>>> system.splOperatorCharacters
>>> .collect { :c |
>>> 	c -> c.splOperatorTokenName
>>> }
[
	'&' -> 'ampersand',
	'*' -> 'asterisk',
	'^' -> 'circumflexAccent',
	'@' -> 'commercialAt',
	'$' -> 'dollarSign',
	'=' -> 'equalsSign',
	'!' -> 'exclamationMark',
	'>' -> 'greaterThanSign',
	'-' -> 'hyphenMinus',
	'<' -> 'lessThanSign',
	'#' -> 'numberSign',
	'%' -> 'percentSign',
	'+' -> 'plusSign',
	'?' -> 'questionMark',
	'\\' -> 'reverseSolidus',
	'/' -> 'solidus',
	'~' -> 'tilde',
	'|' -> 'verticalLine'
]
```

This will not answer the names of non-operator characters,
see instead `splPunctuationTokenName`,
which will also answer the names of operators (since operators are a subset of punctuation tokens):

```
>>> '_'.splPunctuationTokenName
'lowLine'

>>> '&'.splPunctuationTokenName
'ampersand'
```

It is an `error` if the string is not an operator character:

```
>>> {
>>> 	'x'.splOperatorTokenName
>>> }.ifError { true }
true
```

* * *

See also: isSplOperatorToken, isSplPunctuationToken, splOperatorCharacters, splOperatorNameTable, splOperatorTokenName, splPunctuationTokenName

Guides: Binary Operators, Reflection Functions

Categories: Reflection
