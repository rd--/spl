# sortOnBy

- _sortOnBy(aSequence, keyBlock:/1, compareBlock:/2)_

Sort _aSequence_ using _compareBlock_ to compare items according to _keyBlock_.

Sort into descending order according to last item:

```
>>> [2 3 1; 2 2 2; 2 1 3].sortOnBy(last:/1, >)
[2 1 3; 2 2 2; 2 3 1]
```

Sort into ascending order according to second item:

```
>>> [2 3 1; 2 2 2; 2 1 3].sortOnBy(second:/1, <)
[2 1 3; 2 2 2; 2 3 1]
```

* * *

See also: <, <=, sort, sortBy, sortOn

Categories: Sorting
