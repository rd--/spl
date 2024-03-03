# ensure

- _ensure(aBlock:/0, terminationBlock:/0)_

Evaluate _terminationBlock_ after evaluating _aBlock_, regardless of whether the initial evaluation completes.

```
>>> let x = nil;
>>> { { ''.error }.ensure { x := true } }.ifError { };
>>> x
true

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
