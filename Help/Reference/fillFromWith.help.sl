# fillFromWith

- _fillFromWith(aCollection, anotherCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _anotherCollections_ as the argument.
Collect the resulting values into _aCollection_, and answer it.

```
>>> let p = [1 .. 9];
>>> List(9).fillFromWith(p, square:/1)
(p ^ 2)
```

* * *

Categories: Private
