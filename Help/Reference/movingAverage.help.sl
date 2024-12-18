# movingAverage

- _movingAverage(aSequence, anInteger)_

Answer the moving average of _aSequence_, computed by averaging runs of _anInteger_ elements.
The `size` of the answer is _aSequence.size - anInteger + 1_.

Lists of integers yield rational numbers, although not `Fraction` values:

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

* * *

See also: median, exponentialMovingAverage, movingMap, movingMedian, partition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MovingAverage.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/movmean.html),
_W_
[1](https://en.wikipedia.org/wiki/Moving_average)
