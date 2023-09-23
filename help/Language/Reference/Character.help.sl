# Character -- text type

- _Character(anInteger)_
- _Character(aString)_

A Character can be constructed either from a single character string, or from a unicode code point.

The _codePoint_ method retrieves the unicode code point and the _string_ method retrieves the single element string.

	'x'.Character.codePoint = 120
	120.Character.string = 'x'

Characters are cached on construction, and are therefore identical.

	'x'.Character == 120.Character

There is no literal syntax for characters.

_Note:_
Strings in Spl are not Arrays of Characters.
Except where necessary Characters and Character arrays are not recommended.

* * *

See also: String
