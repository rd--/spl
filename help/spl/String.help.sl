# String -- text type

_String_ is the type of text literals and constants.

	'string'.typeOf = 'String'
	'string'.size = 6

Strings are immutable, i.e. there is no _atPut_ implementation.


There is a Character type, and fetching an indexed location in a string answers such a Character.

	'string'[1] = 's'.Character

However Strings are not arrays of Characters, and working with individual characters is unusual.

Implementation Note: Javascript has a curious implementation of Unicode.
String indexing only makes sense for strings that are in the _Basic Multilingual Plane_.

* * *

See also: ascii, Character, utf8, utf16

* * *

- withBlanksTrimmed(self): Return a copy of the receiver from which leading and trailing blanks have been trimmed.
- withoutLeadingBlanks(self): Return a copy of the receiver from which leading blanks have been trimmed.
- withoutTrailingBlanks(self): Return a copy of the receiver from which trailing blanks have been trimmed.
