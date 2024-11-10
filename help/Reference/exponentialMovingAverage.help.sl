# exponentialMovingAverage

- _exponentialMovingAverage(aSequence, alpha)_

Answer the gives the exponential moving average of list with smoothing constant α.
The `size` of the answer is _aSequence.size_.

Lists of integers yield rational numbers:

```
>>> 1:9.exponentialMovingAverage(1/3)
[1 4/3 17/9 70/27 275/81 1036/243 3773/729 13378/2187 46439/6561]
```

Lists of approximate numbers yield approximate numbers:

```
>>> [1 5 7 3 6 2].exponentialMovingAverage(0.5)
[1 3 5 4 5 3.5]
```

Exponential moving averages of matrices are matrices:

```
>>> [1 2; 2 3; 3 4; 4 5; 5 6; 6 7].exponentialMovingAverage(0.5)
[1 2; 1.5 2.5; 2.25 3.25; 3.125 4.125; 4.0625 5.0625; 5.03125 6.03125]
```

Exponential moving average with a smoothing coefficient of 0 is a constant:

```
>>> 1:5.exponentialMovingAverage(0)
[1 1 1 1 1]
```

Exponential moving average with a smoothing coefficient of 1 is the original list:

```
>>> 1:5.exponentialMovingAverage(1)
[1 2 3 4 5]
```

* * *

See also: accumulate, movingAverage, mean, movingMap, movingMedian, partition

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ExponentialMovingAverage.html)
[2](https://reference.wolfram.com/language/ref/ExponentialMovingAverage.html),
_W_
[1](https://en.wikipedia.org/wiki/Exponential_smoothing)
