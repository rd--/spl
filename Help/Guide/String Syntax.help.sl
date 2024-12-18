# String Syntax

Strings are written between single quote marks, i.e. _'Single Quoted String'_.

```
>>> 'Single Quoted String'
'Single Quoted String'
```

Strings may include double quotes and backtick quotes:

```
>>> 'Quoted "double quoted" string'.size
29

>>> 'Quoted `backtick quoted` string'.size
31
```

All of the usual punctation symbols are allowed:

```
>>> let x = '~!@#$%^&*()-+=_[]{}|<>,.';
>>> (x.size, x)
(24, '~!@#$%^&*()-+=_[]{}|<>,.')
```

Unicode characters are allowed:

```
>>> let x = 'αβγδεζηθικλμνξοπρστυφχψω';
>>> (x.size, x)
(24, 'αβγδεζηθικλμνξοπρστυφχψω')
```

Double quoted and back tick quoted strings answer as simple types,
`DoubleQuotedString` and `BacktickQuotedString` respectively,
holding the quoted string.

A double quoted string:

```
>>> "Double Quoted String"
DoubleQuotedString(
	'Double Quoted String'
)
```

A backtick quoted string:

```
>>> `Backtick Quoted String`
BacktickQuotedString(
	'Backtick Quoted String'
)
```

At `String` the `contents` method answers single character strings that make up the quoted string:

```
>>> 'Single Quoted String'.contents
[
	'S' 'i' 'n' 'g' 'l' 'e'
	' '
	'Q' 'u' 'o' 't' 'e' 'd'
	' '
	'S' 't' 'r' 'i' 'n' 'g'
]
```

At `DoubleQuotedString` and `BacktickQuotedString` the `contents` method answers the quoted string:

```
>>> "Double Quoted String".contents
'Double Quoted String'

>>> `Backtick Quoted String`.contents
'Backtick Quoted String'
```

* * *

See also: apostrophe, BacktickQuotedString, DoubleQuotedString, graveAccent, quotationMark, String

Guides: Literals Syntax

Unicode: U+00022 Quotation Mark, U+00027 Apostrophe, U+00060 Grave Accent

Categories: Syntax
