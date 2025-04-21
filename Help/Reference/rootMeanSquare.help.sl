# rootMeanSquare

- _rootMeanSquare(aCollection)_

For a set of numbers the root-mean-square (sometimes called the quadratic mean) is the square root of mean of the values.

At `List`:

```
>>> [1 5 5 4].rootMeanSquare
(67.sqrt / 2)

>>> [2 10 2 8].rootMeanSquare
43.sqrt
```

At `Range`:

```
>>> 1:4.rootMeanSquare
(15 / 2).sqrt
```

The root mean square of columns of a matrix:

```
>>> [1 2; 5 10; 5 2; 4 8].rootMeanSquare
[67.sqrt / 2, 43.sqrt]
```

At `WeightedData`:

```
>>> let x = [
>>> 	8 3 5 4 9
>>> 	1 4 2 2 3
>>> ];
>>> let w = [
>>> 	0.15 0.09 0.12 0.10 0.16
>>> 	0.3 0.11 0.08 0.08 0.09
>>> ];
>>> WeightedData(x, w)
>>> .rootMeanSquare
4.9592
```

Find the root mean square value for the heights of children in a class:

```
>>> [
>>> 	134 143 131 140 145
>>> 	136 131 136 143 136
>>> 	133 145 147 150 150
>>> 	146 137 143 132 142
>>> 	145 136 144 135 141
>>> ].rootMeanSquare
140.157
```

* * *

See also: mean, norm, standardDeviation, variance

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Root-Mean-Square.html)
[2](https://reference.wolfram.com/language/ref/RootMeanSquare.html)

Categories: Statistics
