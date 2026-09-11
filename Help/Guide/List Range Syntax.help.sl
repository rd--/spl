# List Range Syntax

- _[i .. j]_
- _[i, j .. k]_
- _[i .. j; k]_

List range expression rewrite rules:

```
>> '[i .. j]'.splSimplify
listRange(i, j, 1))

>> '[i, j .. k]'.splSimplify
listRange(i, k, subtract(j, i))

>> '[i .. j; k]'.splSimplify
listRange(i, j, k)
```

Answer consecutive ascending `List` values:

```
>>> [1 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1, 2 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1 .. 9; 1]
[1 2 3 4 5 6 7 8 9]
```

Ascending by two:

>>> [1, 3 .. 9]
[1 3 5 7 9]

>>> [1 .. 9; 2]
[1 3 5 7 9]
```

Answer consecutive descending `List` values:

```
>>> [9, 8 .. 1]
[9 8 7 6 5 4 3 2 1]

>>> [9 .. 1; -1]
[9 8 7 6 5 4 3 2 1]
```

Descend by two:

```
>>> [9, 7 .. 1]
[9 7 5 3 1]

>>> [9 .. 1; -2]
[9 7 5 3 1]
```

A geomtric sequence:

```
>>> 3 ^ [1 .. 5]
[3 9 27 81 243]

>>> (3 ^ [1 .. 5])
>>> .isGeometricProgression
true
```

Nested ranges:

```
>>> [1 .. [1 .. 5]]
[1; 1 2; 1 2 3; 1 2 3 4; 1 2 3 4 5]

>>> [1 .. [1 .. 9; 2]; 2]
[1; 1 3; 1 3 5; 1 3 5 7; 1 3 5 7 9]

>>> [1 .. [1 .. [1 .. 3]]]
[1:; 1; 1 2:; 1; 1 2; 1 2 3]
```

* * *

Guides: Range Syntax
