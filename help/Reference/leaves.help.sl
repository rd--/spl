# leaves

_leaves(aTree)_

Answer a List of the _value_ of each of the leaf trees:

```
>>> [1 [2 [3] 4] 5].asTree.leaves
[1 2 3 4 5]
```

Count the even numbers in a Tree:

```
>>> [1 [2 [3] 4] 5].asTree.count { :each | each.value.isNumber & { each.value.isEven } }
2
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TreeLeaves.html)

Categories: Accessing
