# asCollection

- _asCollection(anObject)_

If the argument is a collection, answer the collection,
else answer a single element list containing the argument.

```
>>> 1.asCollection
[1]

>>> [1].asCollection
[1]

>>> let l = [1];
>>> l.asCollection == l
true
```

* * *

See also: asList, assertIsCollection, List, nest

Categories: Converting
