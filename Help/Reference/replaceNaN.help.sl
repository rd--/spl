# replaceNaN

- _replaceNaN(x, y=0)_

If _x_ is a _not-a-number_ value answer _y_, else answer _x_.

```
>>> NaN.replaceNaN(0.0)
0

>>> 1.0.pi.replaceNaN(0.0)
1.0.pi
```

Threads over lists:

```
>>> [1.0 NaN 3.0]
>>> .replaceNaN(0.0)
[1.0 0.0 3.0]

>>> [1.0 2.0 3.0; 4.0 NaN 6.0]
>>> .replaceNaN(0.0)
[1.0 2.0 3.0; 4.0 0.0 6.0]
```

Sum a matrix after replacing NaN entries with zero:

```
>>> [NaN 1.0 NaN; 3.0 5.0 NaN; 4.0 NaN NaN]
>>> .replaceNaN(0.0).sum
[7.0 6.0 0.0]
```

* * *

See also: NaN, deleteMissing, ifNan, isNaN

Guides: Collection Functions, Error Functions, Mathematical Functions
