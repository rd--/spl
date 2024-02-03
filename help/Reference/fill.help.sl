# fill

_fill(aCollection, aBlock:/1)_

Set each element of _aCollection_ to the answer of applying _aBlock_ to the index.

	let x = [1 .. 9]; x.fill { :index | index * index }; x = [1 4 9 16 25 36 49 64 81]
	let x = [1 .. 9]; x.fill(squared:/1); x = [1 4 9 16 25 36 49 64 81]

* * *

See also: atAllPut, fillFromWith
