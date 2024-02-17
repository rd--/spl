# replace

- _replace(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _aCollection_ as the argument.
Collect the resulting values into _aCollection_.

```
>>> let d = (x: 1, y: 2, z: 3);
>>> d.replace(squared:/1);
>>> d
(x: 1, y: 4, z: 9)
```

* * *

See also: collect


Categories: Enumerating
