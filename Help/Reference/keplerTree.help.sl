# keplerTree

- _keplerTree(anInteger)_

Answer Kepler’s tree of fractions to depth _anInteger_.

The first five levels of the tree:

```
>>> 5.keplerTree.levelOrderValues
[
	1/1
	1/2
	1/3 2/3
	1/4 3/4	2/5 3/5
	1/5 4/5 3/7 4/7 2/7 5/7 3/8 5/8
]
```

The numerators of the tree to depth nine,
c.f. OEIS A020651:

```
>>> 7.keplerTree
>>> .levelOrderValues
>>> .collect(numerator:/1)
[
	1  1  1  2  1  3  2  3  1  4
	3  4  2  5  3  5  1  5  4  5
	3  7  4  7  2  7  5  7  3  8
	5  8  1  6  5  6  4  9  5  9
	3 10  7 10  4 11  7 11  2  9
	7  9  5 12  7 12  3 11  8 11
	5 13  8 13
]
```

* * *

See also: calkinWilfTree, minkowskiQuestionMark, sternBrocotTree

References:
_OEIS_
[1](https://oeis.org/A294442)
[2](https://oeis.org/A020651),
_W_
[1](https://en.m.wikipedia.org/wiki/Calkin%E2%80%93Wilf_tree)

Further Reading: Kepler 1619

Categories: Collection
