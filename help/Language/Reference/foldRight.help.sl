# foldRight

- _foldRight(aSequence, aBlock:/2)_

Reduce from right to left.

	[1 .. 9].foldRight(-) = 5
	(1 - (2 - (3 - (4 - (5 - (6 - (7 - (8 - 9)))))))) = 5
	[1 2 3 4 5].foldRight(/) = (1 / (2 / (3 / (4 / 5))))

* * *

See also: foldLeft, reduce
