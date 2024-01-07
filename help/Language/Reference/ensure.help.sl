# ensure -- exceptions

- _ensure(aBlock:/0, terminationBlock:/0)_

Evaluate _terminationBlock_ after evaluating _aBlock_, regardless of whether the initial evaluation completes.

	let x = nil; { { ''.error }.ensure { x := true } }.ifError { }; x
	let x = nil; { x := false }.ensure { x := true }; x

* * *

See also: Error, ifError
