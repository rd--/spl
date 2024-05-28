# asTree

- _asTree(aSequence)_

Answer a `Tree` representation of a (possibly) nested `Sequence`.

```
>>> [1, [2, [3], 4], 5].asTree
Tree(nil, [Tree(1, []), Tree(nil, [Tree(2, []), Tree(nil, [Tree(3, [])]), Tree(4, [])]), Tree(5, [])])
```

`asList` is the inverse:

```
>>> Tree(nil, [Tree(1, []), Tree(nil, [Tree(2, []), Tree(nil, [Tree(3, [])]), Tree(4, [])]), Tree(5, [])]).asList
[1, [2, [3], 4], 5]
```

* * *

See also: asList, Tree

Categories: Converting
