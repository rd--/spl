# add -- adding

- _add(aCollection, newObject)_

Include _newObject_ as one of the receiver's elements.
Answer _newObject_.

	| r = Bag(); | r.add('x'); r.add('x'); r.size = 2
	| r = Dictionary(); | r.add('x' -> 1); r.add('y' -> 2); r.size = 2
	| r = Set(); | r.add('x'); r.add('x'); r.size = 1
	| r = []; | r.add('x'); r.add('x'); r.size = 2
	| r = 'string'; | { r.add('!') }.ifError { :err | true }

* * *

See also: _addAll_, _remove_
