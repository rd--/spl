# injectInto -- enumerating

- _injectInto(anIterable, thisValue, aBlock:/2)_

Accumulate a running value associated with evaluating _aBlock_ with the current value _thisValue_ and the sucessive elements of _anIterable_ as arguments.

For instance, to sum the numeric elements of a collection:

	(1 .. 9).injectInto(0, plus:/2) = 45
	[1 .. 9].injectInto(0, plus:/2) = 45

* * *

See also: reduce
