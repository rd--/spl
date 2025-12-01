# replaceNil

- _replaceNil(x, y=0)_

If _x_ is `nil` answer _y_, else answer _x_.

```
>>> nil.replaceNil(0)
0

>>> 23.replaceNil(0)
23
```

Threads over lists:

```
>>> [1 nil 3]
>>> .replaceNil(0)
[1 0 3]

>>> [1 2 3; 4 nil 6]
>>> .replaceNil(0)
[1 2 3; 4 0 6]
```

* * *

See also: isNil, Nil

Guides: Error Functions
