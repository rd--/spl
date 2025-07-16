# mean

- _mean(c)_

Answer the `arithmeticMean` (the mean estimate) of the collection _c_.

```
>>> [1 .. 9].mean
5

>>> [1.21 3.4 2.15 4 1.55].mean
2.462
```

The `mean` is the `sum` divided by the `size`:

```
>>> 1:4.mean
5/2

>>> let r = 1:4;
>>> r.sum / r.size
5/2
```

The mean of a matrix is a vector (columnwise):

```
>>> [1 2; 2 3; 3 4; 4 5; 5 6].mean
[1:5.mean, 2:6.mean]
```

When the input is an `Dictionary`, `mean` works on its values:

```
>>> (x: 1, y: 2, z: 3).mean
(1 + 2 + 3) / 3
```

Find the `mean` for the heights of children in a class.
The mean is the `moment` of ordinal one:

```
>>> let h = [
>>> 	134 143 131 140 145
>>> 	136 131 136 143 136
>>> 	133 145 147 150 150
>>> 	146 137 143 132 142
>>> 	145 136 144 135 141
>>> ];
>>> (h.mean, h.moment(1))
(140.04, 140.04)
```

Compute the mean of every column of a matrix:

```
>>> [5 3].iota.mean
[7 8 9]
```

Compute the mean of every row of a matrix:

```
>>> [3 5].iota.collect(mean:/1)
[3 8 13]
```

Mean of complex numbers:

```
>>> [2J1 3J-2 5J4].mean
(10 / 3 + 1.i)
```

Mean of a probability distribution:

```
>>> UniformDistribution([-1 1]).mean
0

>>> NormalDistribution(0, 1).mean
0
```

* * *

See also: arithmeticMean, arithmeticGeometricMean, geometricMean, median

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mean.html)
[2](https://mathworld.wolfram.com/WeightedMean.html)
[3](https://reference.wolfram.com/language/ref/Mean.html),
_W_
[1](https://en.wikipedia.org/wiki/Mean)
[2](https://en.wikipedia.org/wiki/Arithmetic_mean)

Categories: Statistics
