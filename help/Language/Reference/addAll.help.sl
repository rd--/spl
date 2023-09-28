# addAll -- adding

- _addAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

	| c = 'xyyzzz', r = Bag(); | r.addAll(c); r.size = 6
	| c = 'xyz', r = Set(); | r.addAll(c); r.size = 3
	| c = (1 .. 9), r = []; | r.addAll(c); r.size = 9
	| c = 'text', r = []; | r.addAll(c); r.size = 4
	| c = (y: 2, z: 3), r = (x: 1); | r.addAll(c); r = (x: 1, y: 2, z: 3)

* * *

See also: add, include, includeAll, Iterable, remove, removeAll
