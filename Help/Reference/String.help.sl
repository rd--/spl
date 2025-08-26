# String

`String` is the `Type` of text literals and constants.

```
>>> 'string'.typeOf
'String'

>>> 'string'.size
6
```

Strings do not implement the `Collection` trait, however they are `Iterable`.

There is a `Character` type.
Iterating over a string supplies each succesive `Character` of the `String`,
and fetching an indexed location in a string answers a `Character`.

```
>>> 'string'[1]
's'.asCharacter
```

Strings are not lists of Characters.

Strings are immutable, i.e. there is no `atPut` implementation.

Methods for converting: `asLowerCase`, `asUpperCase`, `capitalize`, `asInteger`, `asNumber`

_Implementation Note_:
Javascript has a curious implementation of Unicode.
String indexing only makes sense for strings that are in the _Basic Multilingual Plane_.

* * *

See also: AsciiString, asciiByteArray, BacktickQuotedString, characterList, Character, DoubleQuotedString, utf8ByteArray, utf16List

Guides: String Syntax

Unicode: U+00027 Apostrophe

References:
_Smalltalk_
5.7.13

Categories: Text, Type
