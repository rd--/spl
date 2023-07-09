# add -- adding

- _add(aCollection, newObject)_

Include _newObject_ as one of the receivers elements.
Answer _newObject_.

	| r = Bag(); | r.add('x'); r.add('x'); r.size = 2
	| r = Map(); | r.add('x' -> 1); r.add('y' -> 2); r.size = 2
	| r = Set(); | r.add('x'); r.add('x'); r.size = 1
	| r = []; | r.add('x'); r.add('x'); r.size = 2
	| r = 'string'; | { r.add('!') }.ifError { :err | true }

* * *

See also: addAll, remove
