# apply -- evaluating

- _apply(aProcedure, anArray)_

Apply _aProcedure_ to the arguments at _anArray_.
It is an error is _anArray_ is not an _Array_ or has the wrong number of arguments.

	{ :x :y | x * y + y }.apply([3.141, 23]) = 95.243

* * *

See also: Array, cull, Procedure, value
