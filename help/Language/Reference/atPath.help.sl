# atPath -- accessing

- _atPath(aCollection, indices)_

The _indices_ describe a path of accesses into _aCollection_, taken in sequence.

	(x: (y: 1)).atPath(['x', 'y']) = 1
	(x: (y: 1)).atPath(['x', 'y']) = 1
	(x: (y: (z: 1))).atPath(['x', 'y', 'z']) = 1
	(w: (x: (y: (z: 1)))).atPath(['w', 'x', 'y', 'z']) = 1
	[['w', 'x'], ['y', 'z']].atPath([1, 2]) = 'x'

The infix form is @>.

	(w: (x: (y: (z: 1)))) @> ['w', 'x', 'y', 'z'] = 1

* * *

See also: at
