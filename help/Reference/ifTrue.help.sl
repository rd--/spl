# ifTrue

- _ifTrue(aBoolean, aBlock:/0)_

Conditional evaluation.
If _aBoolean_ is _true_ answer the result of  _aBlock()_, else answer _nil_.

```
>>> let x = nil;
>>> true.ifTrue { x := 1 };
>>> x
1
```

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil

References:
_Smalltalk_
5.3.3.7

Categories: Evaluating
