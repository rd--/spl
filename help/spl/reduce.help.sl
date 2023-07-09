# reduce -- enumerating

_reduce(aCollection, aProcedure:/2)_

Apply the argument, _aProcedure_ cumulatively to the elements of the receiver.

For sequenceable collections the elements will be used in order, for unordered collections the order is unspecified.

For instance, to sum the numeric elements of a collection:

	[1 .. 9].reduce(plus:/2) = 45

* * *

See also: injectInto
