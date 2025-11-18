# cartesianIndex

- _cartesianIndex(⍴, i)_

Answer the cartesian index of the linear index _i_ given an array shape _⍴_.
The indices are counted such that the rightmost index increments first.

At vector:

```
>>> let shape = [3];
>>> 1:3.collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[1; 2; 3]
```

At matrix:

```
>>> let shape = [2 4];
>>> [1 .. 2 * 4].collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[
	1 1; 1 2; 1 3; 1 4;
	2 1; 2 2; 2 3; 2 4
]

>>> let shape = [3 3];
>>> [1 .. 3 * 3].collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[
	1 1; 1 2; 1 3;
	2 1; 2 2; 2 3;
	3 1; 3 2; 3 3
]
```

At volume:

```
>>> let shape = [2 2 2];
>>> [1 .. 2 * 2 * 2].collect { :each |
>>> 	shape.cartesianIndex(each)
>>> }
[
	1 1 1;
	1 1 2;
	1 2 1;
	1 2 2;
	2 1 1;
	2 1 2;
	2 2 1;
	2 2 2
]
```

* * *

See also: deepIndices, linearIndex, mixedRadixEncode, shapeIndices

Guides: Indexing Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/arrays/#Base.IteratorsMD.CartesianIndex),
_MathWorks_
[1](https://mathworks.com/help/matlab/ref/ind2sub.html)
