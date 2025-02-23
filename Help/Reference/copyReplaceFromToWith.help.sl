# copyReplaceFromToWith

- _copyReplaceFromToWith(aSequence, startIndex, stopIndex, replacement)_

Answer a copy of _aSequence_,
with items from _startIndex_ to _stopIndex_ replaced with items from _replacement_.

```
>>> let a = [1 2 3 4 5 6 7];
>>> let b = [-3 -4 -5];
>>> let c = a.copyReplaceFromToWith(3, 5, b);
>>> (a, b, c)
(
	[1 2 3 4 5 6 7],
	[-3 -4 -5],
	[1 2 -3 -4 -5 6 7]
)
```

The replacement need not be the same size as the deleted region.

Delete region:

```
>>> [1 2 3 4 5].copyReplaceFromToWith(2, 4, [])
[1 5]
```

Reduce size of region:

```
>>> [1 2 3 4 5].copyReplaceFromToWith(2, 4, ['x'])
[1 'x' 5]
```

Expand size of region:

```
>>> [1 2 3 4 5]
>>> .copyReplaceFromToWith(2, 4, [-1 -2 -3 -4])
[1 -1 -2 -3 -4 5]
```

If _stopIndex_ is one less than _startIndex_,
insert collection at _startIndex_:

```
>>> [1 2 3 4 5].copyReplaceFromToWith(
>>> 	3, 2, [0 0 0 0]
>>> )
[1 2 0 0 0 0 3 4 5]
```

If _stopIndex_ is the end index and _startIndex_ is one past the end,
append collection:

```
>>> [1 2 3 4 5].copyReplaceFromToWith(
>>> 	6, 5, [0 0 0 0]
>>> )
[1 2 3 4 5 0 0 0 0]
```

* * *

See also: copy, copyFromTo, copyReplaceFromToWithObject, insertAt

References:
_Smalltalk_
5.7.8.9

Categories: Copying
