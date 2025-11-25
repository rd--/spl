# List Range Syntax

List range expression rewrite rules:

```
>> '[i .. j]'.splSimplify
asList(nonemptyRange(i, j, 1))

>> '[i, j .. k]'.splSimplify
asList(nonemptyThenTo(i, j, k))

>> '[i .. j; k]'.splSimplify
asList(nonemptyRange(i, j, k))
```

Answer ascending `List` values:

```
>>> [1 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1 .. 9; 1]
[1 2 3 4 5 6 7 8 9]

>>> [1, 3 .. 9]
[1 3 5 7 9]

>>> [1 .. 9; 2]
[1 3 5 7 9]
```

Answer descending `List` values:

```
>>> [9, 8 .. 1]
[9 8 7 6 5 4 3 2 1]

>>> [9 .. 1; -1]
[9 8 7 6 5 4 3 2 1]

>>> [9, 7 .. 1]
[9 7 5 3 1]

>>> [9 .. 1; -2]
[9 7 5 3 1]
```

* * *

Guides: Range Syntax
