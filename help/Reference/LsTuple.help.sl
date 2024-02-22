# LsTuple

- _LsTuple(list, repeats)_

Apply _LsForever_ at each element in _list_, and at each iteration answer a list of the next answer of each list item.
When any of list item ends, that repeat and all of the list items are reset.

```
>>> LsTuple([LsCyc([1 .. 5]), LsSeq([5 6 7], 2)], 1).upToEnd
[1 5; 2 6; 3 7; 4 5; 5 6; 1 7; 1 5]
```

* * *

See also: LsLace
