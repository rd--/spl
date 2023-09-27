# count -- enumerating

- _count(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the receivers elements as the argument.

Answer the number of elements that answered true.

	(1 .. 9).count(even:/1) = 4
	[1 .. 9].count(even:/1) = 4
	(x: 1, y: 2, z: 3).count(even:/1) = 1

* * *

See also: select
