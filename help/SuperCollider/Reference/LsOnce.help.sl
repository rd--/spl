# LsOnce

- _LsOnce(anObject)_

If _anObject_ is a stream, answer it,
else answer a stream that will answer _anObject_ once and then end.

	LsOnce(1).upToEnd = [1]
	LsOnce(LsSeries(1, 1, 3)).upToEnd = [1 2 3]

* * *

See also: LsConstant, LsForever
