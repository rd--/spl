# Tree

_Tree(value, subTrees)_

A Tree is a recursive Type.
A Tree has a _value_ and a possibly empty List of _subTrees_.
Each subTree of a Tree is a Tree.

The _asTree_ method constructs a Tree from a Sequence:

```
>>> [1 [2 [3] 4] 5].asTree.isTree
true
```

Such a Tree has _nil_ as the value of each non-leaf sub-tree,
and can be converted to a nested List using _asList_.
Trees that have non-_nil_ values at non-leaf sub-trees cannot be so converted.

```
>>> [1 [2 [3] 4] 5].asTree.asList
[1 [2 [3] 4] 5]
```

The _size_ of a tree is the number of _subTrees_.

```
>>> [1 2 3 4 5].asTree.size
5

>>> [1 [2 3 4] 5].asTree.size
3
```

The size of a Tree is same as the size of an equivalent nested List:

```
>>> [1 2 3 4 5].size
5

>>> [1 [2 3 4] 5].size
3
```

A Tree is a _leaf_ if it’s size is zero:

```
>>> Tree(1, []).isLeaf
true
```

The _leafCount_ of a Tree is the number of it’s leaves:

```
>>> [1 [2 [3] 4] 5].asTree.leafCount
5
```

The leafCount of a Tree is the same as the leafCount of an equivalent nested List:

```
>>> [1 [2 [3] 4] 5].leafCount
5
```

_flatten_ at a Tree is a List of the _value_ of each of the leaf trees:

```
>>> [1 [2 [3] 4] 5].asTree.flatten
[1 2 3 4 5]
```

The flatten of a Tree is the same as the flatten of an equivalent nested List:

```
>>> [1 [2 [3] 4] 5].flatten
[1 2 3 4 5]
```

The _depth_ of a tree is one more than the size of the longest path to any leaf.
An empty Tree has depth of one.

```
>>> [].asTree.depth
1

>>> [1 2 3 4 5].asTree.depth
2

>>> [1 [2 3 4] 5].asTree.depth
3

>>> [1 [2 [3] 4] 5].asTree.depth
4
```

The depth of a tree is the same as the depth of an equivalent nested List:

```
>>> [1 [2 [3] 4] 5].depth
4
```

Trees are Iterable.
_do_ visits the tree and then each subTree in turn.

```
>>> let t = [1 [2 [3] 4] 5].asTree;
>>> let l = [];
>>> t.do { :each | l.add(each.value.printString) };
>>> l
['nil' '1' 'nil' '2' 'nil' '3' '4' '5']
```

_reverseDo_ visit each subTree in turn and then visits the tree:

```
>>> let t = [1 [2 [3] 4] 5].asTree;
>>> let l = [];
>>> t.reverseDo { :each | l.add(each.value.printString) };
>>> l
['5' '4' '3' 'nil' '2' 'nil' '1' 'nil']
```

_leavesDo_ visits only the values of the leaves of a Tree:

```
>>> let t = [1 [2 [3] 4] 5].asTree;
>>> let l = [];
>>> t.leavesDo { :each | l.add(each) };
>>> l
[1 2 3 4 5]
```

leavesDo at a Tree is the same as _deepDo_ at an equivalent nested List:

```
>>> let l = [1 [2 [3] 4] 5];
>>> let e = [];
>>> l.deepDo { :each | e.add(each) };
>>> e
[1 2 3 4 5]
```

Trees are Indexable.
_indices_ answers a Range of the indices to the immediate sub-trees:

```
>>> [1 [2 [3] 4] 5].asTree.indices
1:3
```

The indices of a tree are the same as the indices of an equivalent nested List:

```
>>> [1 [2 [3] 4] 5].indices
1:3
```

_deepIndices_ answers a List of Lists indicating the paths to the nested sub-tree:

```
>>> [1 [2 [3] 4] 5].asTree.deepIndices
[1; 2; 2 1; 2 2; 2 2 1; 2 3; 3]

>>> let t = [1 [2 [3] 4] 5].asTree;
>>> let i = t.deepIndices;
>>> i.collect { :each | t.atPath(each).value.printString }
['1' 'nil' '2' 'nil' '3' '4' '5']
```

_leafIndices_ answers the paths to leaf sub-trees only:

```
>>> [1 [2 [3] 4] 5].asTree.leafIndices
[1; 2 1; 2 2 1; 2 3; 3]
```

The leafIndices of a tree are the same as the deepIndices of an equivalent nested List:

```
>>> [1 [2 [3] 4] 5].deepIndices
[1; 2 1; 2 2 1; 2 3; 3]
```

_level_ answers a List of the sub-trees at the indicated level:

```
>>> [1 [2 [3] 4] 5].asTree.level(2)
[Tree(2, []), Tree(nil, [Tree(3, [])]), Tree(4, [])]

>>> [1 [2 [3] 4] 5].asTree.level(3)
[Tree(3, [])]
```

Tree implements _collect_:

```
>>> Tree(4, [Tree(9, [Tree(16, [])])]).collect(sqrt:/1)
Tree(2, [Tree(3, [Tree(4, [])])])
```

* * *

See also: List

References:
_Haskell_
[1](https://hackage.haskell.org/package/containers/docs/Data-Tree.html)

Categories: Type, Collection
