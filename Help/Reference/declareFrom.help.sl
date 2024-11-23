# declareFrom

- _declareFrom(aDictionary, key, anotherDictionary)_

Add _key_ to the _aDictionary_.
If key already exists, do nothing.
If _anotherDictionary_ includes key, then remove it from anotherDictionary and use its association as the element of the receiver.

```
>>> let p = (x: 1);
>>> let q = (y: 2);
>>> p.declareFrom('y', q);
>>> [p, q]
[(x: 1, y: 2), ()]
```

* * *

See also: Dictionary

Categories: Adding
