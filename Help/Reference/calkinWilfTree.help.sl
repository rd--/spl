# calkinWilfTree

- _calkinWilfTree(n)_

Answer the Calkin-Wilf `Tree` of depth _n_.

```
>>> 1:4.collect { :n |
>>> 	n.calkinWilfTree.values
>>> }
[
	1/1
	;
	1/1 1/2
	2/1
	;
	1/1 1/2 1/3 3/2
	2/1 2/3
	3/1
	;
	1/1 1/2 1/3 1/4 4/3 3/2 3/5 5/2
	2/1 2/3 2/5 5/3
	3/1 3/4
	4/1
]
```

The level-order values of the tree are the terms of the `calkinWilfSequence`:

```
>>> 4.calkinWilfTree.levelOrderValues
[
	1/1
	1/2 2/1
	1/3 3/2 2/3 3/1
	1/4 4/3 3/5 5/2 2/5 5/3 3/4 4/1
]
```

* * *

See also: calkinWilfSequence, sternBrocotSequence, sternBrocotTree, Tree

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Calkin-WilfTree.html),
_W_
[1](https://en.wikipedia.org/wiki/Calkin%E2%80%93Wilf_tree)

Categories: Tree
