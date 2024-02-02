# swap

- _swap(aBlock:/2)_

Answer a block that applies _aBlock_ with the arguments reversed.

	3 - 1 = 2
	1 -.swap 3 = 2

It is an error if _aBlock_ is not binary:

	{ {}.swap }.ifError { true }
	{ identity:/1.swap }.ifError { true }

* * *

See also: [Block Arity]

References:
_Apl_
[1](https://aplwiki.com/wiki/Commute),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:flip)
