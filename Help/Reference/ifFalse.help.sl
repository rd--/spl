# ifFalse

- _ifFalse(b, f:/0)_

Conditional evaluation.
If the boolean _b_ is `false` answer the result of evaluating _f_,
else answer `nil`.

```
>>> let a = nil;
>>> let b = false.ifFalse { a := 1 };
>>> let c = true.ifFalse { a := 2 };
>>> (a, b, c)
(1, 1, nil)
```

Non-boolean values signal an error:

```
>>> {
>>> 	nil.ifFalse { nil }
>>> }.hasError
true
```

* * *

See also: if, ifEmpty, ifNil, ifNotNil, ifTrue

Guides: Boolean Functions, Control Functions

References:
_Smalltalk_
5.3.3.5

Categories: Evaluating
