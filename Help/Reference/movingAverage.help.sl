# movingAverage

- _movingAverage(x, r | w)_

Answer the moving average of the `List` _x_,
computed by averaging runs of _r_ elements.
The `size` of the answer is _x.size - r + 1_.

Lists of integers yield rational numbers,
although not `Fraction` values:

```
>>> [1 5 7 3 6 2].movingAverage(3)
[13/3 5 16/3 11/3]

>>> [4 8 6 -1 -2 -3 -1 3 4 5]
>>> .movingAverage(3)
[6 13/3 1 -2 -2 -1/3 2 4]
```

Lists of approximate numbers yield approximate numbers:

```
>>> [1.2 5.2 3.4 4.5 2.3 4.5]
>>> .movingAverage(3)
[3.2666 4.3666 3.4 3.7666]
```

Compute weighted moving averages:

```
>>> [1 5 7 3 6 2].movingAverage([1 2 3])
[16/3 14/3 31/6 7/2]
```

Moving averages of matrices are matrices:

```
>>> [
>>> 	1 2 3;
>>> 	2 3 4;
>>> 	3 4 5;
>>> 	4 5 6;
>>> 	5 6 7;
>>> 	6 7 8
>>> ].movingAverage(3)
[
	2 3 4;
	3 4 5;
	4 5 6;
	5 6 7
]
```

Smooth noisy data:

~~~spl svg=A
let r = Sfc32(613724);
let x = [1 .. 20];
let p = x + r.randomReal([-2 2], [20]);
let q = p.movingAverage(3);
[x, p, q].linePlot
~~~

![](sw/spl/Help/Image/movingAverage-A.svg)

Average with long window:

~~~spl svg=B
Sfc32(367214)
.randomReal([0.9 1.1], 200)
.movingAverage(100)
.scatterPlot
~~~

![](sw/spl/Help/Image/movingAverage-B.svg)

* * *

See also: median, exponentialMovingAverage, movingMap, movingMedian, partition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MovingAverage.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/movmean.html),
_W_
[1](https://en.wikipedia.org/wiki/Moving_average)
