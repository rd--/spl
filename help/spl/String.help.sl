# String -- text type

_String_ is the type of text literals and constants.

	'string'.typeOf = 'String'
	'string'.size = 6

Strings do not implement the Collection trait, however they are Iterable.

There is a Character type.
Iterating over a string supplies each succesive Character of the String,
and fetching an indexed location in a string answers a Character.

	'string'[1] = 's'.Character

Strings are not arrays of Characters.

Strings are immutable, i.e. there is no _atPut_ implementation.

Methods for converting: asLowercase, asUppercase, capitalized, asInteger, asNumber

_Implementation Note_:
Javascript has a curious implementation of Unicode.
String indexing only makes sense for strings that are in the _Basic Multilingual Plane_.

* * *

See also: ascii, characterArray, Character, utf8, utf16

* * *

- withBlanksTrimmed(self): Return a copy of the receiver from which leading and trailing blanks have been trimmed.
- withoutLeadingBlanks(self): Return a copy of the receiver from which leading blanks have been trimmed.
- withoutTrailingBlanks(self): Return a copy of the receiver from which trailing blanks have been trimmed.
