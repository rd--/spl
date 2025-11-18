# arrayReduce

- _arrayReduce(f:/1, a, n)_

Reduces dimension _n_ of the array _a_ by applying the block _f_.

Compute the mean of every row of a matrix:

```
>>> let m = [1 .. 15].reshape([3 5]);
>>> mean:/1.arrayReduce(m, 1)
[3 8 13]
```

Compute the mean of every column of a matrix:

```
>>> let m = [1 .. 15].reshape([3 5]);
>>> mean:/1.arrayReduce(m, 2)
[6 7 8 9 10]
```

* * *

See also: arrayFlatten, collect, columnCollect, flatten, map, reduce, reshape, transpose

Guides: Array Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayReduce.html)
