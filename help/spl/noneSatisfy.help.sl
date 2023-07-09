# noneSatisfy -- predicate

- _noneSatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock:/1_ with the elements of _aCollection_.
If _aBlock:/1_ answers true for any element answer false, otherwise answer true.

	[].noneSatisfy(odd:/1) = true
	[1, 3, 5, 7, 9].noneSatisfy(odd:/1) = true
	[1, 2, 3, 4, 5].noneSatisfy(odd:/1) = false

* * *

See also: allSatisfy, anySatisfy
