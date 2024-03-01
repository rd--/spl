# ifEmpty

- _ifEmpty(aCollection, emptyBlock:/0)_
- _ifEmpty(aCollection, emptyBlock:/0, notEmptyBlock)_

Conditional evaluation.
If _aCollection_ has no elements answer the result of  _emptyBlock_,
else answer _aCollection_ or _notEmptyBlock.cull(aCollection)_.

```
>>> [].ifEmpty { 1:9 }
1:9

>>> 0:8.ifEmpty { } { :x | x + 1 }
1:9
```

* * *

See also: if, ifFalse, ifNil, ifNotNil, ifTrue, size

Categories: Evaluating
