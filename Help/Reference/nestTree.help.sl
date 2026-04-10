# nestTree

- _nestTree(f:/1, t, n)_

Add children to each leaf of the tree _t_,
the block _f_ answers the new leaves given the existing leaf _value_.

Add one level to a tree:

```
>>> let t = Tree(1, [Tree(2, []), Tree(3, [])]);
>>> { :n |
>>> 	[2 * n, 2 * n + 1]
>>> }.nestTree(t, 1).values
[1 2 4 5 3 6 7]
```

Add two levels to a tree:

```
>>> let t = Tree(1, [Tree(2, []), Tree(3, [])]);
>>> { :n |
>>> 	[2 * n, 2 * n + 1]
>>> }.nestTree(t, 2).values
[1 2 4 8 9 5 10 11 3 6 12 13 7 14 15]
```

* * *

See also: nestList, Tree
