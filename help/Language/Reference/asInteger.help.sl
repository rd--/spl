# asInteger -- converting

- _asInteger(aBoolean | aCharacter | anInteger | aNumber | aString)_

In the Boolean case, answer _asBit_.
In the Character case, answer _codePoint_.
In the Integer case answer _identity_.
In the Number case, i.e. SmallFloat or Fraction, answer _truncated_.
In the String case answer _parseDecimalInteger_

	false.asInteger = 0
	true.asInteger = 1
	'~'.asCharacter.asInteger = 126
	23.asInteger = 23
	pi.asInteger = 3
	22/7.asInteger = 3
	'23'.asInteger = 23

* * *

See also: asFloat, asNumber
