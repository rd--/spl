# movingMedian

- _movingMedian(aSequence, anInteger)_

Answer the moving median of _aSequence_, computed using spans of _anInteger_ elements.
The `size` of the answer is _aSequence.size - anInteger + 1_.

Moving median of a vector:

```
>>> [1 2 5 6 1 4 3].movingMedian(3)
[2 5 5 4 3]

>>> [4 8 6 -1 -2 -3 -1 3 4 5].movingMedian(3)
[6 6 -1 -2 -2 -1 3 4]
```

Moving median of a matrix is a matrix:

```
>>> [
>>> 	1 2;
>>> 	5 3;
>>> 	1 4;
>>> 	3 2;
>>> 	5 5
>>> ].movingMedian(2)
[
	3.0 2.5;
	3.0 3.5;
	2.0 3.0;
	4.0 3.5
]
```

Lists of approximate numbers yield approximate numbers:

```
>>> [1, e, pi.sqrt, 2, 10, e ^ 2]
>>> .movingMedian(3)
[pi.sqrt, 2, 2, e ^ 2]
```

Integer moving averages of a matrix:

```
>>> [
>>> 	1 2;
>>> 	2 3;
>>> 	3 4;
>>> 	4 5;
>>> 	5 6;
>>> 	6 7
>>> ].movingMedian(3)
[
	2 3;
	3 4;
	4 5;
	5 6
]
```

* * *

See also: accumulate, exponentialMovingMedian, mean, movingAverage, movingMap, partition

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MovingMedian.html)
[2](https://reference.wolfram.com/language/ref/MovingMedian.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/movmedian.html),
_W_
[1](https://en.wikipedia.org/wiki/Moving_average)
