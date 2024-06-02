# arrayReduce

- _arrayReduce(aBlock:/1, anArray, anInteger)_

Reduces dimension _anInteger_ of _anArray_ by applying _aBlock_.

Compute the mean of every row of a matrix:

```
>>> let m = 1:15.reshape([3 5]);
>>> mean:/1.arrayReduce(m, 1)
[3 8 13]
```

Compute the mean of every column of a matrix:

```
>>> let m = 1:15.reshape([3 5]);
>>> mean:/1.arrayReduce(m, 2)
[6 7 8 9 10]
```

* * *

See also: arrayFlattem, collect, columnCollect, flatten, map, reduce, reshape, transpose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayReduce.html)
