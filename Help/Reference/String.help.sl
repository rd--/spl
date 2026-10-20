# String

`String` is the `Type` of text literals and constants.

String literal syntax:

```
>>> 'string'.typeName
'String'

>>> 'string'.size
6
```

Strings do not implement the `Collection` trait,
however they do implement `At` and `Do`.

There is a `Character` type,
however ordinarily characters are represented as single element string values.
Iterating over a string supplies each succesive character of the `String`,
and fetching an indexed location in a string answers a character:

```
>>> 'string'.at(1).typeName
'String'
```

Strings are not lists of characters.

Strings are immutable, i.e. there is no `put` implementation.

List of traits implemented by `String`:

```
>>> system.typeLookup('String')
>>> .traitNameList
>>> .sort!
[
	'At'
	'Character'
	'Compare'
	'Copy'
	'Do'
	'Equal'
	'Indices'
	'Json'
	'Object'
	'Store'
]
```

_Implementation Note_:
Javascript has a curious implementation of Unicode.
String indexing only makes sense for strings that are in the _Basic Multilingual Plane_.

* * *

See also: AsciiString, BacktickQuotedString, Character, DoubleQuotedString, asciiByteArray, characterList, utf8ByteArray, utf16List

Guides: String Functions, String Syntax

Unicode: U+00027 Apostrophe

References:
_Smalltalk_
5.7.13

Categories: Text, Type
