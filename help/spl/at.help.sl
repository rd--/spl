# at -- accessing

- _at(anIndexableCollection, anIndex)_

Answer the value of the indexed instance variable of the receiver whose index is the argument _anIndex_.

If the receiver does not have indexed variables, or if the argument is less than one or greater than the number of indexed variables, then report an _error_.

	['x', 'y'].at(1) = 'x'
	{ ['x', 'y'].at(3) }.ifError { :err | true }

- _at(aKeyedCollection, aKey)_

Answer the value associated with _aKey_ in _aCollection_, else nil.

	(x: 1, y: 2).at('x') = 1
	(x: 1, y: 2).at('z') = nil

* * *

See also: atPut, size, [Put Syntax]
