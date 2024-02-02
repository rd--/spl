# Character -- text type

- _Character(aString, anInteger)_

A Character is constructed from a single character string and a unicode code point.

The _codePoint_ method retrieves the unicode code point,
and the _string_ method retrieves the single element string.

	'x'.asCharacter.codePoint = 120
	120.asCharacter.string = 'x'

Characters are cached on construction, and are therefore identical.

	'x'.asCharacter == 120.asCharacter

There is no literal syntax for characters.

_Note:_
Strings in Spl are not Arrays of Characters.
Except where necessary Characters and Character arrays are not recommended.

* * *

See also: String
