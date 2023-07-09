# injectInto -- enumerating

- _injectInto(aCollection, thisValue, aProcedure:/2)_

Accumulate a running value associated with evaluating _aProcedure_ with the current value _thisValue_ and the receiver as arguments.

For instance, to sum the numeric elements of a collection:

	(1 .. 9).injectInto(0, plus:/2) = 45
	[1 .. 9].injectInto(0, plus:/2) = 45

* * *

See also: reduce
