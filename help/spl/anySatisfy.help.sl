# anySatisfy -- predicate

- _anySatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock:/1_ with the elements of the receiver.
If _aBlock:/1_ returns true for any element return true, otherwise return false.

	[].anySatisfy(even:/1) = false
	[1, 3, 5, 7, 9].anySatisfy(even:/1) = false
	[1, 2, 3, 4, 5].anySatisfy(even:/1) = true

* * *

See also: _allSatisfy_
