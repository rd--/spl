# fareyTree

- _fareyTree(n)_

Answer the Farey `Tree` of depth _n_.
The Farey tree is the left sub-tree of the Stern-Brocot tree.
The form here has values greater than zero and less than one,
there is also a form where the first level has the values zero and one.

The values of the first four levels of the Farey tree:

```
>>> 4.fareyTree
>>> .levelOrderTable
[
	1/2;
	1/3 2/3;
	1/4 2/5 3/5 3/4;
	1/5 2/7 3/8 3/7 4/7 5/8 5/7 4/5
]
```

Numerators of Farey tree fractions,
OEIS [A007305](https://oeis.org/A007305):

```
>>> 5.fareyTree
>>> .levelOrderValues
>>> .numerator
[
	1 1 2 1 2 3 3 1 2 3
	3 4 5 5 4 1 2 3 3 4
	5 5 4 5 7 8 7 7 8 7
	5
]
```

Denominators of Farey tree fractions,
OEIS [A007306](https://oeis.org/A007306):

```
>>> 5.fareyTree
>>> .levelOrderValues
>>> .denominator
[
	 2  3  3  4  5  5  4  5  7  8
	 7  7  8  7  5  6  9 11 10 11
	13 12  9  9 12 13 11 10 11  9
	 6
]
```

Triangle of relativistically added fractional velocities,
with velocities enumerated by the Farey series,
OEIS [A348051](https://oeis.org/A348051)
and
OEIS [A348052](https://oeis.org/A348052):

```
>>> let a = 4.fareyTree.levelOrderValues;
>>> 1:8.triangularArray { :i :j |
>>> 	let u = a[i];
>>> 	let v = a[j];
>>> 	(u + v) / (u * v + 1)
>>> }
[
	4/5;
	5/7 3/5;
	7/8 9/11 12/13;
	2/3 7/13 11/14 8/17;
	3/4 11/17 16/19 13/22 20/29;
	11/13 7/9 19/21 17/23 25/31 15/17;
	10/11 13/15 17/18 16/19 23/26 27/29 24/25;
	7/11 1/2 13/17 3/7 5/9 5/7 19/23 5/13
]
```

Numerators of triangle of relativistically added fractional velocities,
with velocities enumerated by the Farey series,
OEIS [A348051](https://oeis.org/A348051):

~~~spl svg=A oeis=A348051
4.fareyTree
.levelOrderValues
.triangularArray { :u :v |
	(u + v) / (u * v + 1)
}.catenate.numerator.discretePlot
~~~

![](Help/Image/fareyTree-A.svg)

Denominators of triangle of relativistically added fractional velocities,
with velocities enumerated by the Farey series,
OEIS [A348052](https://oeis.org/A348052):

~~~spl svg=B oeis=A348052
4.fareyTree
.levelOrderValues
.triangularArray { :u :v |
	(u + v) / (u * v + 1)
}.catenate.denominator.discretePlot
~~~

![](Help/Image/fareyTree-B.svg)

* * *

See also: fareySequence, sternBrocotTree

Guides: Mathematical Sequences

References:
_W_
[1](https://en.wikipedia.org/wiki/Stern%E2%80%93Brocot_tree)
[2](https://en.wikipedia.org/wiki/Farey_sequence)
