# ifFalse

- _ifFalse(aBoolean, aBlock:/0)_

Conditional evaluation.
If _aBoolean_ is _false_ answer the result of  _aBlock()_, else answer _nil_.

```
>>> let x = nil;
>>> false.ifFalse { x := 1 };
>>> x
1
```

* * *

See also: if, ifEmpty, ifNil, ifNotNil, ifTrue

Categories: Evaluating
