# tuples -- enumerating

- _tuples(aSequence, n)

Generates an array of all possible _n_-tuples of elements from _aSequence_.

	[0 1].tuples(2) = [0 0; 0 1; 1 0; 1 1]
	[0 1].tuples(3) = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
	[0 1 2].tuples(3).first(6) = [0 0 0; 0 0 1; 0 0 2; 0 1 0; 0 1 1; 0 1 2]

* * *

See also: tuplesDo, tuplesIndicesDo
