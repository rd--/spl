# ifTrue

- _ifTrue(b, f/0)_

Conditional evaluation.
If the boolean _b_ is `true`,
answer the result of _f()_,
else answer `nil`.

```
>>> let x = nil;
>>> let y = true.ifTrue { x := 1 };
>>> let z = false.ifTrue { x := -1 };
>>> (x, y, z)
(1, 1, nil)
```

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil

Guides: Boolean Functions, Control Functions

References:
_Smalltalk_
5.3.3.7

Categories: Evaluating
