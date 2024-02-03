# collect

- _collect(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _aCollection_ as the argument.
Collect the resulting values into a collection like the receiver.
Answer the new collection.

	(2, 6 .. 14).collect { :x | x * x } = [4 36 100 196]
	[2, 6 .. 14].collect { :x | x * x } = [4 36 100 196]
	(x: 6, y: 10, z: 14).collect { :x | x * x } = (x: 36, y: 100, z: 196)
	[2, 6 .. 14].asBag.collect { :x | x * x } = [4 36 100 196].asBag
	[2, 6 .. 14].asSet.collect { :x | x * x } = [4 36 100 196].asSet

Collect is implemented in terms of _new_, _do_ and _add_ for unordered collections,
and in terms of _ofSize_, _size_, _at_ and _atPut_ for sequenceable collections.

* * *

See also: map, reject, replace, select, withCollect, withIndexCollect

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:map)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Map.html)

Categories: Enumerating
