# max -- testing

- _max(aCollection)_
- _max(aMagnitude, anotherMagnitude)_

The unary form answers the maximum value in the collection.
The collection must be non-empty and contain compatible Magnitudes.

	1:10.max = 10
	[4 1 7 2].max = 7
	{ [].max }.ifError { true }

The binary form answer the receiver or the argument, whichever has the greater magnitude.

	9.max(2) = 9

The binary form allows vector operands:

	[1 3 5].max([5 3 1]) = [5 3 5]

* * *

See also: ceiling, min

References:
_Apl_
[1](https://aplwiki.com/wiki/Maximum),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:max)
[2](https://hackage.haskell.org/package/base/docs/Prelude.html#v:maximum),
_Mathematica_
[1](https://mathworld.wolfram.com/Maximum.html)
[2](https://reference.wolfram.com/language/ref/Max.html)
