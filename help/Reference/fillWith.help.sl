# fillWith -- initializing

- _fillWith(aSequence, aBlock:/1)_

Apply _aBlock_, using _cull_, to each index of _aSequence_, writing the answer into that slot.
Answer _aSequence_.

	Array(5).fillWith(negated:/1) = [-1 .. -5]

Block is applied using cull:

	let r = Random(12345); Array(5).fillWith { r.nextRandomInteger(9) } = [8 5 9 9 4]

_Rationale:_
This is ordinarily used to initialize a sequence using a block, hence answering the sequence.

* * *

See also: fillFromWith
