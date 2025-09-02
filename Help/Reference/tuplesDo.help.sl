# tuplesDo

- _tuplesDo(c, f:/1)_

Apply the block _f_ to all of the possible n-tuples of each of the elements of the sequence _c_,
which is an n-element sequence of any sized sequences.
The collection received by _f_ is the same at each iteration, only the contents are modified.

```
>>> let r = [];
>>> [1 2 3; 4 5 6].tuplesDo { :each |
>>> 	r.add(each.copy)
>>> };
>>> r
[1 4; 1 5; 1 6; 2 4; 2 5; 2 6; 3 4; 3 5; 3 6]
```

* * *

See also: tuples, tuplesCollect

Guides: Iteration Functions

Categories: Enumerating
