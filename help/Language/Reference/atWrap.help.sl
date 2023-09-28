# atWrap -- acccessing

- _atWrap(aSequence, index)_

Answer the element at _index_ in _aSequence_.
If _index_ is out of bounds, let it wrap around from the end to the beginning until it is in bounds.

	[1 .. 5].atWrap(-1) = 4
	[1 .. 5].atWrap(9) = 4

* * *

See also: at, atPin, atWrapPut
