# storeString -- printing

- _storeString(anObject)_

Answer a String representation of _anObject_ from which it can be reconstructed.

	(1 -> 2) = (1 -> 2).storeString.evaluate
	(false -> true) = (false -> true).storeString.evaluate
	('+' -> 'plus') = ('+' -> 'plus').storeString.evaluate

* * *

See also: asString, printString
