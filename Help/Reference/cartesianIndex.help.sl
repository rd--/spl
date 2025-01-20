# cartesianIndex

- _cartesianIndex(shape, linearIndex)_

Answer the cartesian index of _linearIndex_ given an array _shape_.

At vector:

```
>>> let shape = [3];
>>> (1 .. 3).collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[1; 2; 3]
```

At matrix:

```
>>> let shape = [2 4];
>>> (1 .. 2 * 4).collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[1 1; 2 1; 3 1; 4 1; 1 2; 2 2; 3 2; 4 2]

>>> let shape = [3 3];
>>> (1 .. 3 * 3).collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[1 1; 2 1; 3 1; 1 2; 2 2; 3 2; 1 3; 2 3; 3 3]
```

At volume:

```
>>> let shape = [2 2 2];
>>> (1 .. 2 * 2 * 2).collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[
	1 1 1;
	2 1 1;
	1 2 1;
	2 2 1;
	1 1 2;
	2 1 2;
	1 2 2;
	2 2 2
]
```

* * *

See also: linearIndex

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/arrays/#Base.IteratorsMD.CartesianIndex),
_MathWorks_
[1](https://mathworks.com/help/matlab/ref/ind2sub.html)
