# replaceStringAll

_replaceStringAll(aString, anotherString)_

Replace all occurences of one string with another:

	'x x x'.replaceStringAll('x', 'y') = 'y y y'

Replacement string may be empty:

	'A Bc Def'.replaceStringAll(' ', '') = 'ABcDef'

Replace hypens with forward slashes:

	'A-B-C'.replaceStringAll('-', '/') = 'A/B/C'

Replacement must be a string:

	{ 'x x x'.replaceStringAll('x', 1) }.ifError { true }

Replace every occurrence of _ab_ with _X_:

	'abbaabbaa'.replaceStringAll('ab', 'X') = 'XbaXbaa'

* * *

See also: replaceString

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringReplace.html)

Categories: Replacing
