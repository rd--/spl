# movingAverage

- _movingAverage(aSequence, anInteger)_

Answer the moving average of _aSequence_, computed by averaging runs of _anInteger_ elements.
The `size` of the answer is _aSequence.size - anInteger + 1_.

Lists of integers yield rational numbers:

```
>>> [1 5 7 3 6 2].movingAverage(3)
[13/3 5 16/3 11/3]
```

Lists of approximate numbers yield approximate numbers:

```
>>> [1.2 5.2 3.4 4.5 2.3 4.5].movingAverage(3)
[3.2666, 4.3666, 3.4, 3.7666]
```

At lists of integers: of approximate numbers yield approximate numbers:

```
>>> [1 5 7 3 6 2].movingMedian(3)
[5 5 6 3]
```

Moving averages of matrices are matrices:

```
>>> [1 2; 2 3; 3 4; 4 5; 5 6; 6 7].movingMedian(3)
[2 3; 3 4; 4 5; 5 6]
```

* * *

See also: median, movingAverage, partition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MovingMedian.html),
