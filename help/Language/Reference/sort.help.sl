# sort -- sorting

- _sort(aSequence, aProcedure:/2)_
- _sort(aSequence)_ ≡ _sort(aSequence, <=)_

Sort _aSequence_ in place using the comparator _aProcedure_.
If the sort procedure is omitted or is nil, sort by _<=_.

	| a = [3, 2, 1]; | a.sort = a & { a = [1, 2, 3] }
	| a = [1, 2, 3]; | a.sort(greaterThan:/2) = a & { a = [3, 2, 1] }

* * *

See also: sortBy, sorted
