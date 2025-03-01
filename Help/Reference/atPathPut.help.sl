# atPathPut

- _atPathPut(aCollection, index, value)_

Store _value_ at _index_ in _aCollection_.
If _index_ is not a valid path (or cartesian) index of _aCollection_ it is an `error`.
Answer _value_.

```
>>> let m = [3 3].iota;
>>> m.atPathPut([2 2], -5);
>>> m
[1 2 3; 4 -5 6; 7 8 9]
```

* * *

See also: at, atPath, atPut
