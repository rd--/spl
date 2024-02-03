# cull

- _cull(aBlock, firstArg)_
- _cull(aBlock, firstArg, secondArg)_

Activate the receiver, with two or one or zero arguments.

_cull_ calls _numArgs_ to ask how many arguments are required,
and passes only the required number of arguments.

	{ }.cull(23) = nil
	{ }.cull(23, 3.141) = nil
	{ :x | 0 - x }.cull(23) = -23
	{ :x | 0 - x }.cull(23, 3.141) = -23
	{ :x :y | x - y }.cull(23, 3.141) = 19.859

* * *

See also: numArgs, value

Categories: Evaluating
