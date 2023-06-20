# perform - reflection

- _perform(aValue, aString)_
- _perform(aValue, aString, anArgument)_

Look up a named method in the method table for the type of the receiver and apply it.

	(3 -> 2).perform('key') = 3
	3.perform('plus', 4) = 7

* * *

See also: _methodLookupAtType_
