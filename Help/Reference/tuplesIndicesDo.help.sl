# tuplesIndicesDo

- _tuplesIndicesDo(k, n, f:/1)_

Iterates through each index sequence for a list of size _k_ places to generate all _n_-tuples,
evaluating the block _f_ at each index array.

```
>>> let r = [];
>>> 3.tuplesIndicesDo(2) { :each |
>>> 	r.add(each.copy)
>>> };
>>> r
[1 1; 1 2; 1 3; 2 1; 2 2; 2 3; 3 1; 3 2; 3 3]
```

* * *

See also: tuples, tuplesDo

Guides: Iteration Functions

Categories: Enumerating
