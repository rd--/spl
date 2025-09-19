# ensure

- _ensure(f:/0, g:/0)_

Evaluate the no-argument block _g_ after evaluating the no-argument block _f_,
regardless of whether the initial evaluation completes.

Assign to _x_ in the case of an error:

```
>>> let x = nil;
>>> {
>>> 	{
>>> 		''.error
>>> 	}.ensure {
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

See also: Error, ifError, signal

Guides: Block Functions, Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WithCleanup.html),
_Smalltalk_
5.4.3.1,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-protect)

Categories: Exceptions
