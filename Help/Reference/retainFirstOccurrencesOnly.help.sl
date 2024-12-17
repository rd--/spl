# retainFirstOccurrencesOnly

- _retainFirstOccurrencesOnly(aList, compareBlock:/2)_
- _retainFirstOccurrencesOnly(aList)_

Remove from each sublist at _aList_ any items that appear in any earlier list,
according to _compareBlock_,
which is set to `=` in the unary case.

```
>>> [1; 1 2; 1 2 3; 1 2 3 4].retainFirstOccurrencesOnly
[1; 2; 3; 4]
```

* * *

See also: detectIfFoundIfNone, includeAll, removeAllSuchThat
