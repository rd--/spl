# copyWithout

- _copyWithout(c, x)_

Answer a copy of the collection _c_ that does not contain any elements equal to the object _x_.

At `List`:

```
>>> [1 3 5 7 9].copyWithout(5)
[1 3 7 9]
```

At `Range`:

```
>>> 1:9.copyWithout(5)
[1 2 3 4 6 7 8 9]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).copyWithout(2)
(x: 1, z: 3)
```

* * *

See also: copy, copyFromTo, copyWith, copyWithoutIdenticalElements

Guides: Copying Functions

Categories: Copying
