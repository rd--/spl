# LsWhite

- _LsWhite(low, high, length)_

Random values that follow a uniform distribution.

	LsWhite(-1, 1, 99).upToEnd.plot

Diverging range:

	LsWhite(
		LsSeries(0, -1, inf),
		LsSeries(0, 1, inf),
		99
	).upToEnd.plot

* * *

See also: LsBrown, LsRand

