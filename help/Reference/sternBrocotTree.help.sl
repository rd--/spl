# sternBrocotTree

- _sternBrocotTree(anInteger)_

Answer the Stern-Brocot `Tree` of depth _anInteger_.

The terms of the tree to depth five in level order:

```
>>> 5.sternBrocotTree.levelOrderValues
[
	1/1
	1/2 2/1
	1/3 2/3 3/2 3/1
	1/4 2/5 3/5 3/4 4/3 5/3 5/2 4/1
	1/5 2/7 3/8 3/7 4/7 5/8 5/7 4/5 5/4 7/5 8/5 7/4 7/3 8/3 7/2 5/1
]
```

The sorted values of the tree for depths one through four:

```
>>> 1:4.collect { :n |
>>> 	n.sternBrocotTree.values.sort
>>> }
[
	1/1;
	1/2 1/1 2/1;
	1/3 1/2 2/3 1/1 3/2 2/1 3/1;
	1/4 1/3 2/5 1/2 3/5 2/3 3/4 1/1 4/3 3/2 5/3 2/1 5/2 3/1 4/1
]
```

The numerators of this tree are the terms of the Stern-Brocot sequence:

```
>>> 4.sternBrocotTree.contents.collect(value:/1).sort.collect(numerator:/1)
[1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]

>>> 15.sternBrocotSequence.first(15)
[1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]
```

The Stern-Brocot tree is a binary tree:

```
>>> 4.sternBrocotTree.isBinary
true
```

* * *

See also: calkinWilfTree, mediant, sternBrocotSequence

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Stern-BrocotTree.html)

Further Reading: Lehmer 1929, Stern 1858

Categories: Tree
