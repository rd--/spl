# add -- adding

- _add(aCollection, newObject)_

Include _newObject_ as one of the elements of _aCollection_.
After adding an entry, the _size_ of the collection increases by one.
Therefore, for collections with invariants such as _Dictionary_ and _Set_, add may fail.
In these cases see _include_, which is like _add_ except that the size of the collection may stay the same.
Answers _newObject_.

	let r = Array();  r.add('x'); r.add('x'); r.size = 2
	let r = Bag();  r.add('x'); r.add('x'); r.size = 2
	let r = Map();  r.add('x' -> 1); r.add('y' -> 2); r.size = 2
	let r = Record();  r.add('x' -> 1); r.add('y' -> 2); r.size = 2
	let r = Set();  r.add('x'); r.add('y'); r.size = 2
	let r = 'string';  { r.add('!') }.ifError { :err | true }

* * *

See also: addAll, Extensible, include, remove
