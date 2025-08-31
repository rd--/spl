# indicesDo

- _indicesDo(c, f:/1)_

Evaluate the block _f_ at the valid indices of the collection _c_.
For sequenceable collections indices are enumerated in sequence.

```
>>> let c = [1 3 5 7 9];
>>> let r = [];
>>> c.indicesDo { :each |
>>> 	r.add(each)
>>> };
>>> r
[1 2 3 4 5]
```

* * *

See also: includesIndex, Indexable, indices, withIndexDo

Categories: Enumerating
