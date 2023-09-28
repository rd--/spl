# atPin -- accessing

- _atPin(aSequence, index)_

Answer the element of _aSeqence_ at _index_ if possible.
Answer the first or last element if _index_ is out of bounds.

	[2 .. 8].atPin(1) = 2
	[2 .. 8].atPin(9) = 8

* * *

See also: at, atWrap
