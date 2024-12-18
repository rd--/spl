# includeAll

- _includeAll(aCollection, anotherCollection)_

Include all the elements of _anotherCollection_ into _aCollection_.
Answer _anotherCollection_.

In general, any object responding to _do_ can be used as the second argument.

At `Bag`:

```
>>> let c = [1 2 2 3 3 3];
>>> let r = Bag();
>>> (r.includeAll(c), r.size
(c, 6)
```

At `Set`:

```
>>> let c = [1 2 2 3 3 3];
>>> let r = Set();
>>> (r.includeAll(c), r.size)
(c, 3)
```

At `List`, including `Range`:

```
>>> let c = 1:9;
>>> let r = [];
>>> (r.includeAll(c), r.size)
(c, 9)
```

At `List`, including `String`:

```
>>> let c = 'text';
>>> let r = [];
>>> (r.includeAll(c), r.size)
(c, 4)
```

At `Record`, including `Record`:

```
>>> let c = (y: 2, z: 3);
>>> let r = (x: 1);
>>> (r.includeAll(c), r)
(c, (x: 1, y: 2, z: 3))
```

* * *

See also: add, addAll, include

Categories: Adding
