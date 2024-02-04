# rotatedLeft

- _rotatedLeft(aSequence)_
- _rotatedLeft(aSequence, anInteger)_

Rotate _aSequence_ by _anInteger_ places to the left,
i.e. _anInteger_ elements from the start are moved to the end.
The rotation is not in place, a new sequence is answered.

	[1 2 3 4 5 6 7].rotatedLeft(3) = [4 5 6 7 1 2 3]
	[1 2 3 4 5 6 7].rotatedLeft(8) = [2 3 4 5 6 7 1]
	[1 2 3 4 5 6 7].rotatedLeft(-4) = [4 5 6 7 1 2 3]

The unary form rotates by one place:

	[1 2 3 4 5 6 7].rotatedLeft = [2 3 4 5 6 7 1]

* * *

See also: atWrap, rotatedRight
