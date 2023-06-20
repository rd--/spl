# String -- text

_String_ is the type of text literals and constants.
There is no character type, fetching an indexed location in a string answers a string.
Strings are immutable, there is no _atPut_ implementation.

	'string'.typeOf = 'String'
	'string'.size= 6
	'string'[1] = 's'

* * *

- withBlanksTrimmed(self): Return a copy of the receiver from which leading and trailing blanks have been trimmed.
- withoutLeadingBlanks(self): Return a copy of the receiver from which leading blanks have been trimmed.
- withoutTrailingBlanks(self): Return a copy of the receiver from which trailing blanks have been trimmed.
