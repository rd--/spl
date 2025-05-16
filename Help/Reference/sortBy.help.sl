# sortBy

- _sortBy(aSequence, aBlock:/2)_

Sort _aSequence_ in place using the comparator _aBlock_.
Answers _aSequence_.
Unlike `sort`, the comparison block must be valid, not `nil`.

At `List`, sort into descending order:

```
>>> let a = [1 7 3 9 5];
>>> a.sortBy(>=);
>>> a
[9, 7 .. 1]
```

At `List`, sort into ascending order:

```
>>> [1 7 3 9 5].sortBy(<=)
[1, 3 .. 9]
```

At an `Association` list, sort by descending key:

```
>>> [3 -> 'a', 1 -> 'b', 2 -> 'c'].sortBy(>=)
[3 -> 'a', 2 -> 'c', 1 -> 'b']
```

* * *

See also: sort, sorted, sortOn, sortOnBy

Guides: Sort Functions

Categories: Sorting
