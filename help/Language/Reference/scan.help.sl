# scan

- _scan(aSequence, aBlock:2)_

Similar to _reduce_ but answer a sequence of successive reduced values.

	1:5.scan(+) = [1 3 6 10 15]
	[1, 1 + 2, 1 + 2 + 3, 1 + 2 + 3 + 4, 1 + 2 + 3 + 4 + 5] = [1 3 6 10 15]
	1:5.reduce(+) = 15

* * *

See also: reduce

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan)

_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl)
