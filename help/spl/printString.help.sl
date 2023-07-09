# printString -- printing

- _printString(anObject)_

Answer a _String_ that is a description of the receiver.

	23.printString = '23'
	3.141.printString = '3.141'
	2:3.printString = '2:3'
	true.printString = 'true'
	false.printString = 'false'
	nil.printString = 'nil'
	'x'.printString = '\'x\''
	[1 .. 3].printString = '[1, 2, 3]'
	(x: 23, y: 3.141).printString = '(x: 23, y: 3.141)'
	(23 -> 3.141).printString = '23 -> 3.141'
	'x'.printString.size = 3
	'x'.printString.size ~= 'x'.asString

* * *

See also: asString, storeString
