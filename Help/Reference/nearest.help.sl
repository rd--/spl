# nearest

- _nearest([e₁, e₂, …], x)_
- _nearest([e₁, e₂, …], x, n)_

Answer the items _e_ that are the nearest to _x_,
according to the `euclideanDistance` metric.

Find the elements in a list nearest to twenty:

```
>>> [1 2 4 8 16 32].nearest(20)
[16]
```

There may be elements that are equally near:

```
>>> [1 2 4 8 16 32].nearest(6)
[4 8]
```

In the case of a tie, all nearest elements are returned in order:

```
>>> [5 1 13 9 16].nearest(3)
[5 1]
```

Find which element is nearest to _(2,3)_:

```
>>> [-1 -1; 1 -1; 1 1; -1 1].nearest([2 3])
[[1 1]]
```

Answer the three nearest elements:

```
>>> [1 2 4 8 16 32].nearest(20, 3)
[16 8 32]

>>> [1 2 3 4 5 6 7 8 9 10].nearest(5, 3)
[5 4 6]
```

Compare the answers given by specific distance functions:

```
>>> [1.5 0.6; 2 0; 1.25 1.25]
>>> .nearest([0 0])
[[1.5 0.6]]

>>> [1.5 0.6; 2 0; 1.25 1.25]
>>> .nearestBy(
>>> 	[0 0],
>>> 	manhattanDistance:/2
>>> )
[[2 0]]

>>> [1.5 0.6; 2 0; 1.25 1.25]
>>> .nearestBy(
>>> 	[0 0],
>>> 	chessboardDistance:/2
>>> )
[[1.25 1.25]]
```

Plot the `nearest` of a list of numbers:

~~~spl svg=A
(0 -- 10).functionPlot { :x |
	[1 3 4 7 8].nearest(x).first
}
~~~

![](sw/spl/Help/Image/nearest-A.svg)

* * *

See also: -, abs, nearestNeighbourAlgorithm, nearestNeighbourGraph

Guides: Distance Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nearest.html)
