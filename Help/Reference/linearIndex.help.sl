# linearIndex

- _linearIndex(shape, cartesianIndex)_

Answer the linear index of `cartesianIndex` given an array _shape_.
The indices are counted such that the rightmost index increments first.

At vector:

```
>>> let shape = [2];
>>> [1; 2; 3].collect { :each |
>>> 	shape.linearIndex(each)
>>> }
[1 2 3]
```

At matrix:

```
>>> let shape = [2 2];
>>> [1 1; 1 2; 2 1; 2 2].collect { :each |
>>> 	shape.linearIndex(each)
>>> }
[1 2 3 4]

>>> let shape = [3 3];
>>> [2 1; 2 2; 2 3; 3 1].collect { :each |
>>> 	shape.linearIndex(each)
>>> }
[4 5 6 7]
```

At volume:

```
>>> let shape = [2 2 2];
>>> [1 2 1; 1 2 2; 2 1 1; 2 1 2].collect { :each |
>>> 	shape.linearIndex(each)
>>> }
[3 4 5 6]
```

* * *

See also: cartesianIndex, deepIndices, mixedRadixDecode, shapeIndices

References:
_MathWorks_
[1](https://mathworks.com/help/matlab/ref/sub2ind.html)
