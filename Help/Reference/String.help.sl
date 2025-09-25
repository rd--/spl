# String

`String` is the `Type` of text literals and constants.

List of traits implemented by `String`:

```
>>> system.typeLookup('String')
>>> .traitNameList
[
	'Object'
	'Comparable'
	'Json'
	'Iterable'
	'Indexable'
	'Character'
]
```

String literal syntax:

```
>>> 'string'.typeOf
'String'

>>> 'string'.size
6
```

Strings do not implement the `Collection` trait, however they are `Iterable`.

There is a `Character` type,
however ordinarily characters are represented as single element string values.
Iterating over a string supplies each succesive character of the `String`,
and fetching an indexed location in a string answers a character:

```
>>> 'string'.at(1).typeOf
'String'
```

Strings are not lists of characters.

Strings are immutable, i.e. there is no `atPut` implementation.

_Implementation Note_:
Javascript has a curious implementation of Unicode.
String indexing only makes sense for strings that are in the _Basic Multilingual Plane_.

* * *

See also: AsciiString, asciiByteArray, BacktickQuotedString, characterList, Character, DoubleQuotedString, utf8ByteArray, utf16List

Guides: String Functions, String Syntax

Unicode: U+00027 Apostrophe

References:
_Smalltalk_
5.7.13

Categories: Text, Type
