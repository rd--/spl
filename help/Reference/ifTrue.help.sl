# ifTrue

- _ifTrue(aBoolean, aBlock:/0)_

If _aBoolean_ is _true_ answer the result of  _aBlock()_, else answer _nil_.

```
>>> let x = nil;
>>> true.ifTrue { x := 1 };
>>> x
1
```

* * *

See also: if, ifEmpty, ifFalse, ifNil, ifNotNil

Categories: Conditional evaluation
