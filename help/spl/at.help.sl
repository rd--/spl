# at -- accessing

- _at(aCollection, anIndex)_

Answer the item associated with _anIndex_ in _aCollection_.

If the collection does not support indexing,
or if the index is not valid,
report an _error_.

Arrays (and all sequenceable collections) are indexable:

	['x', 'y'].at(1) = 'x'
	{ ['x', 'y'].at(3) }.ifError { :err | true }

Records (and all dictionaries) are indexable:

	(x: 1, y: 2).at('x') = 1
	{ (x: 1, y: 2).at('z') }.ifError { true }

Sets and Bags are not indexable:

	{ [1, 2, 3].Set.at(1) }.ifError { true }
	{ [1, 2, 3].Bag.at(1) }.ifError { true }

There is [At Sytax] for accessing indexed values:

	| a = ['x', 'y']; | a[1] = 'x'
	| d = (x: 1, y: 2); | d['x'] = 1

* * *

See also: atPut, [AtPut Syntax], [At Syntax], Indexable, [Quoted At Syntax], size
