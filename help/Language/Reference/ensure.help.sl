# ensure -- exceptions

- _ensure(aBlock:/0, terminationBlock:/0)_

Evaluate _terminationBlock_ after evaluating _aBlock_, regardless of whether the initial evaluation completes.

	| x | { { ''.error }.ensure { x := true } }.ifError { }; x
	| x | { x := false }.ensure { x := true }; x

* * *

See also: Error, ifError
