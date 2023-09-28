# includeAll -- adding

- _includeAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

	| c = 'xyyzzz', r = Bag(); | r.includeAll(c); r.size = 6
	| c = 'xyyzzz', r = Set(); | r.includeAll(c); r.size = 3
	| c = (1 .. 9), r = []; | r.includeAll(c); r.size = 9
	| c = 'text', r = []; | r.includeAll(c); r.size = 4
	| c = (y: 2, z: 3), r = (x: 1); | r.includeAll(c); r = (x: 1, y: 2, z: 3)

* * *

See also: add, addAll, include
