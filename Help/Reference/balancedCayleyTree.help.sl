# balancedCayleyTree

- _balancedCayleyTree(n, k)_

Answer the balanced _n_-Cayley tree with depth _k_.

The _3,1_ tree:

~~~spl svg=A
balancedCayleyTree(3, 1).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-A.svg)

The _3,2_ tree:

~~~spl svg=B
balancedCayleyTree(3, 2).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-B.svg)

The _3,3_ tree:

~~~spl svg=C
balancedCayleyTree(3, 3).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-C.svg)

The _3,4_ tree:

~~~spl svg=D
balancedCayleyTree(3, 4).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-D.svg)

The _4,1_ tree:

~~~spl svg=E
balancedCayleyTree(4, 1).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-E.svg)

The _4,2_ tree:

~~~spl svg=F
balancedCayleyTree(4, 2).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-F.svg)

The _4,3_ tree:

~~~spl svg=G
balancedCayleyTree(4, 3).graphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-G.svg)

The _n=2_ trees are path graphs,
the _2,5_ tree:

~~~spl svg=H
balancedCayleyTree(2, 5)
.circularGraphPlot
~~~

![](sw/spl/Help/Image/balancedCayleyTree-H.svg)

The number of nodes at each level _k_ for _n=3_,
OEIS [A003945](https://oeis.org/A003945):

```
>>> linearRecurrence([2], [1 3], 12)
[1 3 6 12 24 48 96 192 384 768 1536 3072]

>>> 3 * (2 ^ 0:10)
[3 6 12 24 48 96 192 384 768 1536 3072]
```

Same for _n=4_,
OEIS [A003946](https://oeis.org/A003946):

```
>>> linearRecurrence([3], [1 4], 10)
[1 4 12 36 108 324 972 2916 8748 26244]

>>> 4 * (3 ^ 0:8)
[4 12 36 108 324 972 2916 8748 26244]
```

Same for _n=5_,
OEIS [A003947](https://oeis.org/A003947):

```
>>> linearRecurrence([4], [1 5], 9)
[1 5 20 80 320 1280 5120 20480 81920]

>>> 5 * (4 ^ 0:7)
[5 20 80 320 1280 5120 20480 81920]
```

The least node label at each level _k_ for _n=3_,
OEIS [A083329](https://oeis.org/A083329):

```
>>> linearRecurrence([3 -2], [1 2 5], 11)
[1 2 5 11 23 47 95 191 383 767 1535]
```

Same for _n=4_,
OEIS [A025192](https://oeis.org/A025192):

```
>>> 2 * (3 ^ 0:8)
[2 6 18 54 162 486 1458 4374 13122]
```

Same for _n=5_,
OEIS [A136412](https://oeis.org/A136412):

```
>>> linearRecurrence([5 -4], [2 7], 9)
[2 7 27 107 427 1707 6827 27307 109227]

>>> 0:8.collect { :n |
>>> 	(5 * (4 ^ n) + 1) / 3
>>> }
[2 7 27 107 427 1707 6827 27307 109227]
```

* * *

See also: cayleyTree, Graph

Guides: Graph Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CayleyTree.html),
_OEIS_
[1](https://oeis.org/A003945)
[2](https://oeis.org/A003946)
[3](https://oeis.org/A003947)
[4](https://oeis.org/A083329)
[5](https://oeis.org/A025192)
[6](https://oeis.org/A136412)
