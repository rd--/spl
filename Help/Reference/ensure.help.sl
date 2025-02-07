# ensure

- _ensure(aBlock:/0, terminationBlock:/0)_

Evaluate _terminationBlock_ after evaluating _aBlock_, regardless of whether the initial evaluation completes.

Assign to _x_ in the case of an error:

```
>>> let x = nil;
>>> {
>>> 	{ ''.error }.ensure {
>>> 		x := true
>>> 	}
>>> }.ifError { };
>>> x
true
```

Assign to _x_ in the case of no `error`:

```
>>> let x = nil;
>>> { x := false }.ensure { x := true };
>>> x
true
```

* * *

See also: Error, ifError

References:
_Smalltalk_
5.4.3.1

Categories: Exceptions
