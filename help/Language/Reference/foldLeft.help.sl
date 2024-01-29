# foldLeft

- _foldLeft(aSequence, aBlock:/2)_

Reduce from left to right.

	[1 .. 9].foldLeft(-) = -43
	((((((((1 - 2) - 3) - 4) - 5) - 6) - 7) - 8) - 9) = -43
	[1 2 3 4 5].foldLeft(/) = ((((1 / 2) / 3) / 4) / 5)

* * *

See also: foldRight, reduce
