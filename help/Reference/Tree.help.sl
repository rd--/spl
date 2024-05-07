# Tree

- _Tree(value, subTrees)_

A `Tree` is a recursive `Type`.
A Tree has a `value` and a possibly empty `List` of `subTrees`.
Each subTree of a Tree is a Tree.

The `asTree` method constructs a Tree from a `Sequence`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.isTree
true
```

Such a Tree has `nil` as the value of each non-leaf sub-tree,
and can be converted to a nested `List` using `asList`.
Trees that have non-nil values at non-leaf sub-trees cannot be so converted.

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.asList
[1 [2 [4 [7] 5] 3 [6 [8 9]]]]
```

The `size` of a tree is the number of `subTrees`.

```
>>> [1 2 3 4 5].asTree.size
5

>>> [1 [2 3 4] 5].asTree.size
3

>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.size
2
```

The size of a `Tree` is same as the size of an equivalent nested `List`:

```
>>> [1 2 3 4 5].size
5

>>> [1 [2 3 4] 5].size
3

>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].size
2
```

A `Tree` is a _leaf_ if its size is `zero`:

```
>>> Tree(1, []).isLeaf
true
```

The `leafCount` of a Tree is the number of its leaves:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.leafCount
9
```

The `leafCount` of a `Tree` is the same as the `leafCount` of an equivalent nested `List`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].leafCount
9
```

The `depth` of a `Tree` is one more than the `size` of the longest path to any leaf.
An empty `Tree` has `depth` of `one`.

```
>>> [].asTree.depth
1

>>> [1 2 3 4 5].asTree.depth
2

>>> [1 [2 3 4] 5].asTree.depth
3

>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.depth
5
```

The `depth` of a tree is the same as the `depth` of an equivalent nested `List`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].depth
5
```

Trees are `Iterable`.
`do` visits the tree and then each subTree in turn (i.e. pre-order traversal),
and hence `contents` answers all of the subTrees.
`values` answers the value at each tree visited by `do`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.values
[nil 1 nil 2 nil 4 nil 7 5 3 nil 6 nil 8 9]
```

`postOrderDo` visits each tree after visiting the its subtrees.
`postOrderValues` collects the value of each tree visited by `postOrderDo`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.postOrderValues
[1 2 4 7 nil 5 nil 3 6 8 9 nil nil nil nil]
```

`levelOrderDo` visits each level of each subtree in sequence.
`levelOrderValues` collects the value of each tree visited by `levelOrderDo`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.levelOrderValues
[nil 1 nil 2 nil 3 nil 4 nil 5 6 nil 7 8 9]
```

The values of a tree in each traversal order:

```
>>> let t = Tree(1, [
>>> 	Tree(2, [Tree(4, [Tree(7, [])]),Tree(5, [])]),
>>> 	Tree(3, [Tree(6, [Tree(8, []), Tree(9, [])])])
>>> ]);
>>> [t.values, t.postOrderValues, t.levelOrderValues]
[
	1 2 4 7 5 3 6 8 9;
	7 4 5 2 8 9 6 3 1;
	1 2 3 4 5 6 7 8 9
]
```

`reverseDo` visit each subTree in turn and then visits the tree:

```
>>> let t = [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree;
>>> let l = [];
>>> t.reverseDo { :each | l.add(each.value) };
>>> l
[9 8 nil 6 nil 3 5 7 nil 4 nil 2 nil 1 nil]
```

`leavesDo` visits only the `value`s of the leaves of a `Tree`.
`leaves` collects the items visited by `leavesDo` into a `List`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.leaves
[1 2 4 7 5 3 6 8 9]
```

`flatten` at a `Tree` is equal to `leaves`.

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.flatten
[1 2 4 7 5 3 6 8 9]
```

`leavesDo` at a `Tree` is the same as `deepDo` at an equivalent nested `List`,
and the `flatten` of a `Tree` is the same as the `flatten` of an equivalent nested `List`:

```
>>> let l = [1 [2 [4 [7] 5] 3 [6 [8 9]]]];
>>> let e = [];
>>> l.deepDo { :each | e.add(each) };
>>> e
[1 2 4 7 5 3 6 8 9]

>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].flatten
[1 2 4 7 5 3 6 8 9]
```

`Trees` are `Indexable`.
`indices` answers a `Range` of the indices to the immediate sub-trees:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.indices
1:2
```

The `indices` of a `Tree` are the same as the indices` of an equivalent nested `List`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].indices
1:2
```

`deepIndices` answers a `List` of Lists indicating the paths to the nested sub-tree:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.deepIndices
[
	1; 2;
	2 1;
	2 2; 2 2 1; 2 2 2; 2 2 2 1; 2 2 3;
	2 3;
	2 4; 2 4 1; 2 4 2; 2 4 2 1; 2 4 2 2
]
```

`atPath` finds the value at a _deep index_:

```
>>> let t = [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree;
>>> let i = t.deepIndices;
>>> i.collect { :each | t.atPath(each).value }
[1 nil 2 nil 4 nil 7 5 3 nil 6 nil 8 9]
```

`leafIndices` answers the paths to leaf sub-trees only:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.leafIndices
[
	1;
	2 1;
	2 2 1; 2 2 2 1; 2 2 3;
	2 3;
	2 4 1; 2 4 2 1; 2 4 2 2
]
```

The `leafIndices` of a tree are the same as the `deepIndices` of an equivalent nested `List`:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].deepIndices
[
	1;
	2 1;
	2 2 1; 2 2 2 1; 2 2 3;
	2 3;
	2 4 1; 2 4 2 1; 2 4 2 2
]
```

`level` answers a `List` of the sub-trees at the indicated level.
Sub-trees at level two:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.level(2)
[
	Tree(2, []),
	Tree(nil, [Tree(4, []), Tree(nil, [Tree(7, [])]), Tree(5, [])]),
	Tree(3, []),
	Tree(nil, [Tree(6, []), Tree(nil, [Tree(8, []), Tree(9, [])])])
]
```

Sub-trees at level three:

```
>>> [1 [2 [4 [7] 5] 3 [6 [8 9]]]].asTree.level(3)
[
	Tree(4, []),
	Tree(nil, [Tree(7, [])]),
	Tree(5, []),
	Tree(6, []),
	Tree(nil, [Tree(8, []), Tree(9, [])])
]
```

`Tree` implements `collect`:

```
>>> Tree(4, [Tree(9, [Tree(16, [])])]).collect(sqrt:/1)
Tree(2, [Tree(3, [Tree(4, [])])])
```

A `Tree` is a binary tree if it, and every subtree, is of `size` two:

```
>>> let e = { Tree(nil, []) };
>>> let l = { :n | Tree(n, []) };
>>> let b = { :n :l :r | Tree(n, [l, r]) };
>>> let t = b(6, b(2, l(1), b(3, e(), b(4, e(), l(5)))), b(8, l(7), l(9)));
>>> (t.isBinary, t.contents.collect(value:/1))
(true, [6 2 1 3 nil 4 nil 5 8 7 9])
```

* * *

See also: asTree, List, Tree Syntax

References:
_Haskell_
[1](https://hackage.haskell.org/package/containers/docs/Data-Tree.html)

Categories: Type, Collection
