# withReplace

- _withCollect(aSequence, anotherSequence, aBlock:/2)_

In place withCollect.

	let a = [9 .. 1]; a.withReplace(1:9) { :p :q | p * 2 + q }; a = [19 .. 11]
	[9 .. 1].withCollect(1:9) { :p :q | p * 2 + q } = [19 .. 11]

* * *

See also: collect, replace, withCollect
