# atAll -- accessing

- _atAll(aSequence, indices)_

Answer a new collection like _aSequence_ containing all elements of _aSequence_ at _indices_.

	['one', 'two', 'three', 'four'].atAll([3, 2, 4]) = ['three', 'two', 'four']

The infix form of this is @*.

	['1', '2', '3', '4'] @* [3, 2, 4] = ['3', '2', '4']

* * *

See also: at, atAllPut
