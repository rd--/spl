# tuples -- enumerating

- _tuples(aSequence, anInteger)

Generates an array of all possible _anInteger_-tuples of elements from _aSequence_.

	[0 1].tuples(2) = [0 0; 0 1; 1 0; 1 1]
	[0 1].tuples(3) = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
	[0 1 2].tuples(3).first(6) = [0 0 0; 0 0 1; 0 0 2; 0 1 0; 0 1 1; 0 1 2]

Two-tuples are the cartesian product of a set with itself:

	| x = [0 1 2]; | x.tuples(2) = x.cartesianProduct(x)

* * *

See also: cartesianProduct, tuplesDo, tuplesIndicesDo
