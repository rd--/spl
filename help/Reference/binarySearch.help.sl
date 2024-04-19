# binarySearch

- _binarySearch(aSequence, anObject)_

Answer and index of _anObject_ in _aSequence_, which is known to be sorted.
If _anObject_ is not in _aSequence_ answer `zero`.

```
>>> let l = [8 30 35 45 49 77 79 82 87 97];
>>> l.collect { :each |
>>> 	l.binarySearch(each)
>>> }
[1 .. 10]
```

* * *

See also: detectIndex, indexOf
