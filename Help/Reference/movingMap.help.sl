# movingMap

- _movingMap(aBlock:/1, aSequence, anInteger)_

Answer a `List` of the answers of applying _aBlock_ to successive windows of _aSequence_, each of _anInteger_ elements.
The `size` of the answer is _aSequence.size - anInteger + 1_.

`movingMap` of `mean` over regular data is equivalent to `movingAverage`:

```
>>> mean:/1.movingMap([1 5 7 3 6 2], 3)
[13/3 5 16/3 11/3]
```

`movingMap` of `median` over regular data is equivalent to `movingMedian`:

```
>>> median:/1.movingMap(
>>> 	[-6 8 -10 -4 9 -9 8 0 1 4],
>>> 	3
>>> )
[-6 -4 -4 -4 8 0 1 1]
```

Can implement `differences`:

```
>>> let l = 0:10.collect { :i |
>>> 	3 * i + 6
>>> };
>>> { :each |
>>> 	each.last - each.first
>>> }.movingMap(l, 2)
[3 3 3 3 3 3 3 3 3 3]
```

* * *

See also: accumulate, exponentialMovingAverage, mean, movingAverage, movingMedian, partition, windowedReduce

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MovingMap.html)
