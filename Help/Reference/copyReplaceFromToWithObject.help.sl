# copyReplaceFromToWithObject

- _copyReplaceFromToWithObject(aSequence, startIndex, stopIndex, anObject)_

Answer a copy of _aSequence_,
with items from _startIndex_ to _stopIndex_ replaced by _anObject_.

```
>>> let a = [1 2 3 4 5 6 7];
>>> let b = a.copyReplaceFromToWithObject(3, 5, 0);
>>> (a, b)
(
	[1 2 3 4 5 6 7],
	[1 2 0 0 0 6 7]
)
```

If _stopIndex_ is one less than _startIndex_,
insert object at _startIndex_:

```
>>> [1 2 3 4 5].copyReplaceFromToWithObject(3, 2, 0)
[1 2 0 3 4 5]
```

If _stopIndex_ is the end index and _startIndex_ is one past the end,
insert object at end:

```
>>> [1 2 3 4 5].copyReplaceFromToWithObject(6, 5, 0)
[1 2 3 4 5 0]
```

* * *

See also: copy, copyFromTo, copyReplaceFromToWith, insertAt

References:
_Smalltalk_
5.7.8.10

Categories: Copying
