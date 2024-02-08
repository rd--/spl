# includeAll

- _includeAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

```
>>> let c = [1 2 2 3 3 3];
>>> let r = Bag();
>>> r.includeAll(c) = c & { r.size = 6 }
true

>>> let c = [1 2 2 3 3 3];
>>> let r = Set();
>>> r.includeAll(c) = c & { r.size = 3 }
true

>>> let c = 1:9;
>>> let r = [];
>>> r.includeAll(c) = c & { r.size = 9 }
true

>>> let c = 'text';
>>> let r = [];
>>> r.includeAll(c) = c & { r.size = 4 }
true

>>> let c = (y: 2, z: 3);
>>> let r = (x: 1);
>>> r.includeAll(c) = c & { r = (x: 1, y: 2, z: 3) }
true
```

* * *

See also: add, addAll, include

Categories: Adding
