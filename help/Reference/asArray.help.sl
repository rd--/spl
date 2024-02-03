# asArray

- _asArray(aCollection)_

Answer an Array whose elements are the elements of _aCollection_.

	let x = [1 .. 5]; x.asArray == x
	'string'.asArray = ['s' 't' 'r' 'i' 'n' 'g'].collect(asCharacter:/1)

This should not be defined for scalar values, see _asCollection_.

* * *

See also: Array, asCollection

Categories: Converting
