# atMod

- _atMod(aSequence, anIndex, anInteger)_
- _atMod(aSequence, anIndex)_

Answer the item associated with the cyclical, or modular, index _anIndex_ in _aSequence_.
In one-based indexing systems this operation is a little more involved than in zero-indexed systems.

Cycle though a list three times:

```
>>> let l = [1 2 3];
>>> let n = l.size;
>>> -2:6.collect { :each |
>>> 	[each, l.atMod(each, n)]
>>> }
[
	-2 1;
	-1 2;
	 0 3;
	 1 1;
	 2 2;
	 3 3;
	 4 1;
	 5 2;
	 6 3
]
```

The unary form is equivalent to `atWrap`.

* * *

See also: at, atFold, atPin, atPut, atWrap, Indexable, size

Categories: Accessing
