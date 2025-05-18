# combinationProductSet

- _combinationProductSet(aList, anInteger)_

Answer the combination product set of the items in _aList_ taken _anInteger_ at a time.

The _2_ combination product set of _1 1 3 5_:

```
>>> [1 1 3 5].combinationProductSet(2)
[1/1 5/4 3/2 15/8]
```

The _2_ combination product set of _1 3 5 7_:

```
>>> [1 3 5 7].combinationProductSet(2)
[1/1 7/6 5/4 35/24 5/3 7/4]
```

The _4_ combination product set of _1 3 5 7 11_:

```
>>> [1 3 5 7 11].combinationProductSet(4)
[1/1 11/10 11/8 11/7 11/6]
```

Draw the _2_ combination product set of _1 3 5 7 11_:

~~~spl svg=A
[1 3 5 7 11].combinationProductSet(2)
.asRatioTuning
.latticeGraph
.asLineDrawing
~~~

![](sw/spl/Help/Image/combinationProductSet-A.svg)

Draw the _3_ combination product set of _1 3 5 7 11_:

~~~spl svg=B
[1 3 5 7 11].combinationProductSet(3)
.asRatioTuning
.latticeGraph
.asLineDrawing
~~~

![](sw/spl/Help/Image/combinationProductSet-B.svg)

A worked example:

```
>>> [1 3 5 7].subsets { :each |
>>> 	each.size = 2
>>> }
[1 3; 1 5; 3 5; 1 7; 3 7; 5 7]

>>> [1 3; 1 5; 3 5; 1 7; 3 7; 5 7].collect(
>>> 	product:/1
>>> )
[3 5 15 7 21 35]

>>> [3 5 15 7 21 35] / 3
[1 5/3 5 7/3 7 35/3]

>>> [1 5/3 5 7/3 7 35/3].octaveReduced
[1/1 5/3 5/4 7/6 7/4 35/24]

>>> [1/1 5/3 5/4 7/6 7/4 35/24].sort
[1/1 7/6 5/4 35/24 5/3 7/4]
```

* * *

See also: eulerFokkerGenus, latticeGraph, nub, product, octaveReduced, subsets

Guides: Xenharmonic Functions

References:
_Anaphoria_
[1](https://anaphoria.com/wilsoncps.html)
_Xenharmonic_
[1](https://en.xen.wiki/w/Combination_product_set)

Categories: Tuning
