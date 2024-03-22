# removeAllFoundIn

- _removeAllFoundIn(aCollection, anotherCollection)_

Remove each element of _anotherCollection_ which is present in _aCollection_.
Answer _anotherCollection_.
No error is raised if an element isn’t found.

```
>>> let c = [1 2 2 3 3 3 4 4 4 4];
>>> (c.removeAllFoundIn([2 3]), c)
([2 3], [1 2 3 3 4 4 4 4])
```

* * *

See also: removeAll
