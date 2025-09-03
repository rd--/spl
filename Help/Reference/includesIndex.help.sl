# includesIndex

- _includesIndex(c, i)_

Answer whether the collection _c_ has an index equal to _i_.

At `Range`:

```
>>> 1:5.includesIndex(3)
true
```

At `BitSet`, which is notably _zero-indexed_:

```
>>> BitSet(11)
>>> .includesIndex(0)
true
```

At `String`:

```
>>> [0 3 7].collect { :each |
>>> 	'string'.includesIndex(each)
>>> }
[false true false]
```

* * *

See also: at, includesKey, Indexable, indices

Categories: Testing
