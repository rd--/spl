# windowedReduce

- _windowedReduce([x₁ x₂ …], n, f:/2)_

Insert the binary block _f_ between overlapping windows of size _n_ drawn from th sequence _x_,
and evaluate into a `List` in left-to-right order.

Sum adjacent triples:

```
>>> [5 1 4 1 8].windowedReduce(3, +)
[
	5 + (1 + 4),
	1 + (4 + 1),
	4 + (1 + 8)
]
```

Within each window, evaluation is by `foldRight`:

```
>>> [5 1 4 1 8].windowedReduce(3, -)
[
	5 - (1 - 4),
	1 - (4 - 1),
	4 - (1 - 8)
]
```

Adjacent differences:

```
>>> [1 2 4 7 11].windowedReduce(2, -)
[
	1 -  2,
	2 -  4,
	4 -  7,
	7 - 11
]
```

Adjacent differences with swapped operator,
c.f. `differences`:

```
>>> [1 2 4 7 11]
>>> .windowedReduce(2, -.swap)
[
	 2 - 1,
	 4 - 2,
	 7 - 4,
	11 - 7
]
```

Adjacent ratios with swapped operator,
c.f. `ratios`:

```
>>> [1 .. 5].windowedReduce(2, /.swap)
[2/1 3/2 4/3 5/4]
```

Adjacent triples collected into a `List`:

```
>>> [1 .. 5].windowedReduce(
>>> 	3,
>>> 	++.over(nest:/1)
>>> )
[1 2 3; 2 3 4; 3 4 5]

>>> [1 .. 5].windowedReduce(3) { :p :q |
>>> 	p.nest ++ q.nest
>>> }
[1 2 3; 2 3 4; 3 4 5]
```

When the window size is negative, each window is reversed before the reduction is done:

```
>>> [1 2 3 4 5].windowedReduce(-2, -)
[
	2 - 1,
	3 - 2,
	4 - 3,
	5 - 4
]

>>> [1 2 3 4 5].windowedReduce(2, -)
[
	1 - 2,
	2 - 3,
	3 - 4,
	4 - 5
]
```

Adjacent comparisons, edge detection:

```
>>> [1 1 2 2 2 3 3]
>>> .windowedReduce(2, !=)
>>> .boole
[0 1 0 0 1 0]
```

* * *

See also: adjacentPairsCollect, collect, foldRight, movingMap, pairsCollect, partition, reduce

Guides: List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Windowed_Reduce)
