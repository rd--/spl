# scanRight

- _scanRight(aSequence, aBlock:2)_

A variant of _scan_ that associates arguments to the right.

	1:5.scanRight(+) = 1:5.scan(+)
	1:5.scanRight(-) = [1 -1 2 -2 3]
	[1, 1 - 2, 1 - (2 - 3), 1 - (2 - (3 - 4)), 1 - (2 - (3 - (4 - 5)))] = [1 -1 2 -2 3]
	1:5.scanRight(-.swap) = [1 1 0 -2 -5]

* * *

See also: reduce, scan
