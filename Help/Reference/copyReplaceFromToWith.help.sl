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

* * *

See also: copy, copyFromTo, insertAt

Categories: Copying
