# scanLeftAssociatingRight

- _scanLeftAssociatingRight(aSequence, aBlock:2)_

A variant of _scanLeft_ that associates arguments to the right.
That is,
where _scanLeft_ will reduce a triple as _f(f(i,j),k)_,
_scanLeftAssociatingRight_ will reduce the same triple as _f(i,f(j,k))_.
This is the Apl _scan_.

	1:5.scanLeftAssociatingRight(-) = [1 -1 2 -2 3]
	[1, 1 - 2, 1 - (2 - 3), 1 - (2 - (3 - 4)), 1 - (2 - (3 - (4 - 5)))] = [1 -1 2 -2 3]
	1:5.scanLeftAssociatingRight(-.swap) = [1 1 0 -2 -5]

* * *

See also: scan, scanLeft, scanRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan)
