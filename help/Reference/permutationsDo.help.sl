# permutationsDo

- _permutationsDo(aSequence, aBlock:/1)_

Repeatly evaluate _aBlock_ with a single copy of _aSequence_.
Reorder the copy so that _aBlock_ is presented all _aSequence.size.factorial_ possible permutations.

```
>>> let list = [];
>>> [1 2 3].permutationsDo { :each |
>>> 	list.add(each.copy)
>>> };
>>> list
[1 2 3; 1 3 2; 2 1 3; 2 3 1; 3 2 1; 3 1 2]
```

* * *

See also: permutations

Categories: Enumerating, Permutations
