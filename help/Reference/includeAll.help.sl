# includeAll -- adding

- _includeAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

	let c = 'xyyzzz'; let r = Bag(); r.includeAll(c); r.size = 6
	let c = 'xyyzzz'; let r = Set(); r.includeAll(c); r.size = 3
	let c = 1:9; let r = []; r.includeAll(c); r.size = 9
	let c = 'text'; let r = []; r.includeAll(c); r.size = 4
	let c = (y: 2, z: 3); let r = (x: 1); r.includeAll(c); r = (x: 1, y: 2, z: 3)

* * *

See also: add, addAll, include
