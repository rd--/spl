# replaceNaN

- _replaceNaN(x, y=0)_

If _x_ is a _not-a-number_ value answer _y_, else answer _x_.

```
>>> NaN.replaceNaN(0)
0

>>> 1.pi.replaceNaN(0)
1.pi
```

Threads over lists:

```
>>> [1 NaN 3]
>>> .replaceNaN(0)
[1 0 3]

>>> [1 2 3; 4 NaN 6]
>>> .replaceNaN(0)
[1 2 3; 4 0 6]
```

* * *

See also: isNaN, NaN

Guides: Error Functions
