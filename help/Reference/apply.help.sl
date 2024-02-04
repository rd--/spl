# apply

- _apply(aBlock, aList)_

Apply _aBlock_ to the arguments at _aList_.
It is an error is _aList_ is not an _List_ or has the wrong number of arguments.

	{ :x :y | x * y + y }.apply([3.141, 23]) = 95.243

* * *

See also: List, cull, Block, value

Categories: Evaluating
