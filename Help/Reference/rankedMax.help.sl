# rankedMax

- _rankedMax(aList, anInteger)_

Answer the _n_-th largest element in _aList_.
If the integer is negative answer the _n_-th smallest element in _aList_.

The second largest of three numbers:

```
>>> [12 13 11].rankedMax(2)
12
```

The third largest of four numbers:

```
>>> [1.pi 2.sqrt 1.e 3].rankedMax(3)
1.e
```

The fourth smallest,
i.e. the smallest,
of four numbers:

```
>>> [12 13 48.5 1.pi].rankedMax(4)
1.pi
```

The second smallest of five numbers:

```
>>> [2.5 1.e 12 15 485].rankedMax(-2)
1.e
```

The fourth smallest of five numbers:

```
>>> [2.5 1.e 12 15 485].rankedMax(-4)
15
```

* * *

See also: quantile, rankedMin, sort

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RankedMax.html)

Categories: Statistics
