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

Non-boolean values signal an error:

```
>>> {
>>> 	nil.ifFalse { nil }
>>> }.ifError { true }
true
```

* * *

See also: if, ifEmpty, ifNil, ifNotNil, ifTrue

Guides: Boolean Functions

References:
_Smalltalk_
5.3.3.5

Categories: Evaluating
