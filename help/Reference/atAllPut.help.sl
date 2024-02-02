# atAllPut -- accessing

- _atAllPut(aCollection, anObject)_

Put _anObject_ at every entry of _aCollection_.
Answer _anObject_.

- _atAllPut(aSequence, indices, anObject)_

Put _anObject_ at every index specified by the elements of _indices_ in _aSequence_.

	let a = Array(9);  a.atAllPut(0); a = [0, 0, 0, 0, 0, 0, 0, 0, 0]
	let a = [1 .. 9];  a.atAllPut([3 .. 7], 0); a = [1, 2, 0, 0, 0, 0, 0, 8, 9]

_Note:_
This method imlpements both _atAllPut:_ and _atAll:put:_.

* * *

See also: at, atAll, atPut
