# asString -- printing

- _asString(anObject)_

Answer the _printString_ of the receiver, unless it is a _String_, in which case answer the receiver itself.

	23.asString = '23'
	3.141.asString = '3.141'
	2:3.asString = '2:3'
	true.asString = 'true'
	false.asString = 'false'
	nil.asString = 'nil'
	'x'.asString = 'x'
	[1 .. 3].asString = '[1, 2, 3]'
	(1 .. 99).asString = '(1 .. 99)'
	(23 -> 3.141).asString = '23 -> 3.141'
	(x: 1, y: 2).printString = '(x: 1, y: 2)'

* * *

See also: _printString_, _storeString_
