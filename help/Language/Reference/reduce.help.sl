# reduce -- enumerating

- _reduce(anIterable, aBlock:/2)_

Apply _aBlock_ cumulatively to the elements of _anIterable_.

Initially evaluates the block with the first two elements of the collecton,
then with the result of the first evaluation and the next element,
and so on.
Answers the result of the final evaluation.
If _aCollection_ is empty, raise an error.
If _aCollection_ has a single element, answer that element.

For sequenceable collections the elements will be used in order,
for unordered collections the order is unspecified.

For instance, to sum the numeric elements of a collection:

	[1 .. 9].reduce(+) = 45
	[1 .. 9].reduce(-) = -43
	(1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9) = -43
	[1 .. 9].foldRight(-) = 5
	(1 - (2 - (3 - (4 - (5 - (6 - (7 - (8 - 9)))))))) = 5

* * *

See also: injectInto
