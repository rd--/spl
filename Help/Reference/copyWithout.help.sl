# copyWithout

- _copyWithout(aCollection, oldElement)_

Answer a copy of _aCollection_ that does not contain any elements equal to oldElement.

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

Categories: Copying
