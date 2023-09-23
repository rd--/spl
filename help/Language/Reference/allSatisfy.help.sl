# allSatisfy -- testing

- _allSatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock:/1_ with the elements of _aCollection_.
If _aBlock:/1_ returns false for any element return false, otherwise return true.

	[].allSatisfy(odd:/1) = true
	[1, 3, 5, 7, 9].allSatisfy(odd:/1) = true
	[1, 2, 3, 4, 5].allSatisfy(odd:/1) = false

* * *

See also: anySatisfy, noneSatisfy
