# include -- adding

- _include(aCollection, newObject)_

Include _newObject_ as one of the elements of _aCollection_.
After including an entry, the _size_ of the collection may increases by one, or may stay the same.
Answers _newObject_.

	| r = Map(); | r.include('x' -> 1); r.include('x' -> 2); r.size = 1
	| r = Record(); | r.include('x' -> 1); r.include('x' -> 2); r.size = 1
	| r = Set(); | r.include('x'); r.include('x'); r.size = 1

* * *

See also: add, includeAll, remove
