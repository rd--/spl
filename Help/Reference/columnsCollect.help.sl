# columnsCollect

- _columnsCollect(aMatrix, aBlock:/1)_

Apply _aBlock_ to each column of _aMatrix_ and collect the answer into a `List`.

```
>>> let m = [2 0 1; -1 1 0; -3 3 0];
>>> m.columnsCollect(norm:/1)
[14.sqrt 10.sqrt 1.sqrt]
```

C.f. `collect`:

```
>>> let m = [2 0 1; -1 1 0; -3 3 0];
>>> m.collect(norm:/1)
[5.sqrt 2.sqrt 18.sqrt]
```

* * *

See also: arrayReduce, collect, column, isMatrix
