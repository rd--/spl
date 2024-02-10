# shape

_shape(aSequence | anObject)_

Answer the shape of the argument, a vector of lengths of the array along each axis.

The shape of a scalar is the empty list:

```
>>> 1.shape
[]
```

The shape of a vector is a one element list:

```
>>> 1:5.shape
[5]
```

The shape of a matrix is a two element list:

```
>>> [1 2; 3 4; 5 6].shape
[3 2]

>>> [1 2 3; 4 5 6].shape
[2 3]

>>> [[1]].shape
[1 1]
```

The shape of a volume is a three element list:

```
>>> [1 2; 3 4;; 5 6; 7 8].shape
[2 2 2]

>>> [1; 2; 3;; 4; 5; 6].shape
[2 3 1]

>>> [1 2; 3 4; 5 6;; 7 8; 9 10; 11 12].shape
[2 3 2]

>>> [[1 2; 3 4; 5 6]].shape
[1 3 2]

>>> [[[1]]].shape
[1 1 1]
```

Irregular arrays do not have a shape:

```
>>> { [1; 2 3].shape }.ifError { true }
true

>>> [1; 2 3].isArray
false
```

Find the dimensions of a matrix:

```
>>> [1 2 3; 4 5 6].shape
[2 3]
```

Works with arrays of any depth:

```
>>> [[[[1, 2]]]].shape
[1 1 1 2]
```

The empty sequence has shape [0]:

```
>>> [].shape
[0]
```

See also: isArray, isSequence, rank, reshape

References:
_Apl_
[1](https://aplwiki.com/wiki/Shape),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Dimensions.html)

