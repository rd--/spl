# reshape

_reshape(aCollection, shape)_

Reshape answers a list with the indicated _shape_ and with elements drawn from _aCollection_.
Elements are drawn in ravel order,
truncating if the result has smaller bound than the right argument,
and repeating cyclically if it has larger bound.

```
>>> 9.iota.reshape([3 3])
[1 2 3; 4 5 6; 7 8 9]

>>> 3.iota.reshape([3 3])
[1 2 3; 1 2 3; 1 2 3]

>>> 9.iota.reshape([2 2])
[1 2; 3 4]

>>> 12.iota.reshape([3 4])
[1 2 3 4; 5 6 7 8; 9 10 11 12]

>>> 4.iota.reshape([12])
[1 2 3 4 1 2 3 4 1 2 3 4]
```

Reshape can decrease the rank or bound of a list:

```
>>> [1 2 3; 4 5 6; 7 8 9].reshape([9])
[1 2 3 4 5 6 7 8 9]

>>> [1 2 3; 4 5 6; 7 8 9].reshape([3])
[1 2 3]

>>> [1 2; 3 4].reshape([2 4])
[1 2 3 4; 1 2 3 4]
```

Reshape can be used to produce an identity matrix by reshaping a vector which is one longer than the desired side length.

```
>>> [1 0 0 0 0].reshape([4 4])
[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
```

* * *

See also: rank, shape

References:
_Apl_
[1](https://aplwiki.com/wiki/Reshape)

