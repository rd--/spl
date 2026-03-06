# sternBrocotTree

- _sternBrocotTree(n)_

Answer the Stern-Brocot `Tree` of depth _n_.

The terms of the tree to depth five in level order:

```
>>> 4.sternBrocotTree
>>> .levelOrderValues
[
	1/1
	1/2 2/1
	1/3 2/3 3/2 3/1
	1/4 2/5 3/5 3/4 4/3 5/3 5/2 4/1
]
```

Numerators of Farey (or Stern-Brocot) tree fractions,
OEIS [A007305](https://oeis.org/A007305):

```
>>> 5.sternBrocotTree
>>> .levelOrderValues
>>> .numerator
[
	1
	1 2
	1 2 3 3
	1 2 3 3 4 5 5 4
	1 2 3 3 4 5 5 4 5 7 8 7 7 8 7 5
]
```

Denominators of Farey (or Stern-Brocot) tree fractions,
OEIS [A047679](https://oeis.org/A047679):

```
>>> 5.sternBrocotTree
>>> .levelOrderValues
>>> .denominator
[
	1
	2 1
	3 3 2 1
	4 5 5 4 3 3 2 1
	5 7 8 7 7 8 7 5 4 5 5 4 3 3 2 1
]
```

The sorted values of the tree for depths one through four:

```
>>> 1:4.collect { :n |
>>> 	n.sternBrocotTree.values.sort
>>> }
[
	1/1
	;
	1/2 1/1
	2/1
	;
	1/3 1/2 2/3 1/1
	3/2 2/1
	3/1
	;
	1/4 1/3 2/5 1/2 3/5 2/3 3/4 1/1
	4/3 3/2 5/3 2/1
	5/2 3/1
	4/1
]
```

The numerators of this tree are the terms of the Stern-Brocot sequence:

```
>>> 4.sternBrocotTree
>>> .contents
>>> .collect(value:/1)
>>> .sort
>>> .collect(numerator:/1)
[1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]

>>> 16.sternBrocotSequence
[0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]
```

The Stern-Brocot tree is a binary tree:

```
>>> 4.sternBrocotTree.isBinary
true
```

Numerators of Farey (or Stern-Brocot) tree fractions,
OEIS [A007305](https://oeis.org/A007305):

~~~spl svg=A
8.sternBrocotTree
.levelOrderValues
.numerator
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotTree-A.svg)

Denominators of Farey (or Stern-Brocot) tree fractions,
OEIS [A047679](https://oeis.org/A047679):

~~~spl svg=B
8.sternBrocotTree
.levelOrderValues
.denominator
.scatterPlot
~~~

![](sw/spl/Help/Image/sternBrocotTree-B.svg)

* * *

See also: calkinWilfTree, mediant, sternBrocotNumber, sternBrocotSequence

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Stern-BrocotTree.html)

Further Reading: Lehmer 1929, Stern 1858

Categories: Tree
