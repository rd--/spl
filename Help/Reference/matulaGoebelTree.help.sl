# matulaGoebelTree

- _matulaGoebelTree(n)_

Answer the `Tree` associated with the Matula-Göbel number _n_.
Threads over lists.

First few trees:

```
>>> 1:15.matulaGoebelTree
[
	Tree(1, []),
	Tree(2, [1].matulaGoebelTree),
	Tree(3, [2].matulaGoebelTree),
	Tree(4, [1 1].matulaGoebelTree),
	Tree(5, [3].matulaGoebelTree),
	Tree(6, [1 2].matulaGoebelTree),
	Tree(7, [4].matulaGoebelTree),
	Tree(8, [1 1 1].matulaGoebelTree),
	Tree(9, [2 2].matulaGoebelTree),
	Tree(10, [1 3].matulaGoebelTree),
	Tree(11, [5].matulaGoebelTree),
	Tree(12, [1 1 2].matulaGoebelTree),
	Tree(13, [6].matulaGoebelTree),
	Tree(14, [1 4].matulaGoebelTree),
	Tree(15, [2 3].matulaGoebelTree)
]
```

Plot the 78th Matula tree:

~~~spl svg=A
78.matulaGoebelTree.treePlot
~~~

![](sw/spl/Help/Image/matulaGoebelTree-A.svg)

Leaf counts of first few trees,
OEIS [A109129](https://oeis.org/A109129):

```
>>> 2:23.matulaGoebelTree
>>> .collect(leafCount:/1)
[1 1 2 1 2 2 3 2 2 1 3 2 3 2 4 2 3 3 3 3 2 2]
```

Plot:

~~~spl svg=B
2:75.matulaGoebelTree
.collect(leafCount:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/matulaGoebelTree-B.svg)

Depth counts of first few trees,
OEIS [A358552](https://oeis.org/A358552):

```
>>> 1:21.matulaGoebelTree
>>> .collect(depth:/1)
[1 2 3 2 4 3 3 2 3 4 5 3 4 3 4 2 4 3 3 4 3]
```

Plot:

~~~spl svg=C
2:75.matulaGoebelTree
.collect(depth:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/matulaGoebelTree-C.svg)

Plot tree with arbitrarily chosen Matula-Göbel number _n=987654321_:

~~~spl svg=D
987654321.matulaGoebelTree.treePlot
~~~

![](sw/spl/Help/Image/matulaGoebelTree-D.svg)

* * *

See also: matulaGoebelNumber, primePi, Tree

Guides: Tree Functions

Further Reading: Matula 1968, Göbel 1980
