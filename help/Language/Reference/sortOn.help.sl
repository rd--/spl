# sortOn -- sorting

- _sortOn(aSequence, aBlock:/1)_

Sort the elements of _aSequence_ in the order defined by applying _aBlock_ to each of them.
Sort is in place (mutating) and answers _aSequence_.

	[1 2 3; 2 3 1; 3 1 2; 2 2].sortOn(last:/1) = [2 3 1; 2 2; 3 1 2; 1 2 3]
	[1 2 3; 2 3 1; 3 1 2; 2 2].sortOn(sum:/1) = [2 2; 3 1 2; 2 3 1; 1 2 3]
	let alpha = [1 .. 9]; let beta = alpha.sortOn(negated:/1); alpha = [9 .. 1] & { alpha == beta }

* * *

See also: sort, sortBy
