# linearIndex

- _linearIndex(shape, cartesianIndex)_

Answer the linear index of _cartesianIndex_ given an array _shape_.

At vector:

```
>>> let shape = [2];
>>> [1; 2; 3].collect { :each | shape.linearIndex(each) }
[1 2 3]
```

At matrix:

```
>>> let shape = [2 2];
>>> [1 1; 2 1; 1 2; 2 2].collect { :each | shape.linearIndex(each) }
[1 2 3 4]

>>> let shape = [3 3];
>>> [1 2; 2 2; 3 2; 1 3].collect { :each | shape.linearIndex(each) }
[4 5 6 7]
```

At volume:

```
>>> let shape = [2 2 2];
>>> [1 2 1; 2 2 1; 1 1 2; 2 1 2].collect { :each | shape.linearIndex(each) }
[3 4 5 6]
```

See also: cartesianIndex

References:
_MathWorks_
[1](https://au.mathworks.com/help/matlab/ref/sub2ind.html)
