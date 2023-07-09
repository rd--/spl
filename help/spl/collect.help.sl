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

* * *

See also: select, reject
