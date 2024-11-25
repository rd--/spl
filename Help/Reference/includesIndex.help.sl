# includesIndex

- _includesIndex(aCollection, index)_

Answer whether _aCollection_ has an index equal to _index_.

At `Range`:

```
>>> 1:5.includesIndex(3)
true
```

At `Record`:

```
(w: 1, x: 2, y: 3).includesIndex('x')
true
```

At `BitSet`, which is notably _zero-indexed_:

```
>>> BitSet(11).includesIndex(0)
true
```

At `String`:

```
>>> [0 3 7].collect { :each | 'string'.includesIndex(each) }
[false true false]
```

* * *

See also: at, includesKey, Indexable, indices

Categories: Testing
