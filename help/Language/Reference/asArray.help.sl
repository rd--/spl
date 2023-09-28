# asArray -- converting

- _asArray(aCollection)_

Answer an Array whose elements are the elements of _aCollection_.
Unlike the _Array_ constructor case this does not copy the object if it is an Array.

	| x = [1 .. 5]; | x.Array ~~ x
	| x = [1 .. 5]; | x.asArray == x

This should not be defined for scalar values, see _asCollection_.

* * *

See also: Array, asCollection
