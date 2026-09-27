# permutationsDo

- _permutationsDo(c, f/1)_

Repeatly evaluate the block _f_ with a single copy of the sequence _c_.
Reorder the copy so that _f_ is presented all _c.size.factorial_ possible permutations.
Answers `nil`.

```
>>> let a = [];
>>> [1 2 3].permutationsDo { :each |
>>> 	a.add(each.copy)
>>> };
>>> a
[1 2 3; 1 3 2; 2 1 3; 2 3 1; 3 2 1; 3 1 2]
```

* * *

See also: permutations

Guides: Iteration Functions, Permutation Functions

Categories: Enumerating, Permutations
