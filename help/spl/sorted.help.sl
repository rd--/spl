# sorted -- sorting

- _sorted(aCollection)_
- _sorted(aCollection, aProcedure:/2)_

Answer a new Array which contains the same elements as _aCollection_ where the elements are sorted by _aProcedure_.

The procedure should take two arguments and answer true if the first element should preceed the second one.

The unary form of _sorted_ sorts using <=.

	[1, 3, 2, 4, 5].sorted = [1 .. 5]
	[1, 3, 2, 4, 5].sorted { :i :j | i > j } = [5 .. 1]
	| a = [3, 2, 1]; | a.sorted ~= a

* * *

See also: sort
