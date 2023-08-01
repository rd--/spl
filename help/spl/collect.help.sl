# collect -- enumerating

- _collect(aCollection, aProcedure:/1)_

Evaluate _aProcedure_ with each element of _aCollection_ as the argument.
Collect the resulting values into a collection like the receiver.
Answer the new collection.

	(2, 6 .. 14).collect { :x | x * x } = [4, 36, 100, 196]
	[2, 6 .. 14].collect { :x | x * x } = [4, 36, 100, 196]
	(x: 6, y: 10, z: 14).collect { :x | x * x } = (x: 36, y: 100, z: 196)
	[2, 6 .. 14].Bag.collect { :x | x * x } = [4, 36, 100, 196].Bag
	[2, 6 .. 14].Set.collect { :x | x * x } = [4, 36, 100, 196].Set

Collect is implemented in terms of _new_, _do_ and _add_ for unordered collections,
and in terms of _ofSize_, _size_, _at_ and _atPut_ for sequenceable collections.

* * *

See also: select, reject, withCollect, withIndexCollect

