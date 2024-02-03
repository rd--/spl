# scan

- _scan(aSequence, aBlock:2)_

Similar to _reduce_ but answer a sequence of successive reduced values.
Just as _reduce_ is an alias for _foldLeft_, _scan_ is an alias for _scanLeft_.

	[].scan(+) = []
	[1].scan(+) = [1]
	1:4.scan(+) = [1 3 6 10]
	1:4.reduce(+) = 10

* * *

See also: foldLeft, foldRight, reduce, scanLeft, scanRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl1),
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:scanl),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FoldList.html)

Categories: Enumerating
