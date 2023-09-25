# asNumber -- converting

- _asNumber(aBoolean | aNumber | aString)_

In the Boolean case, answer _asBit_.
In the Number case answer _identity_.
In the String case answer _parseNumber_.

	false.asNumber = 0
	true.asNumber = 1
	23.asNumber = 23
	pi.asNumber = pi
	'23'.asNumber = 23
	'3.141'.asNumber = 3.141

* * *

See also: asInteger
