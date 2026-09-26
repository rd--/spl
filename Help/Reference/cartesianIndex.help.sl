# cartesianIndex

- _cartesianIndex(⍴, i)_

Answer the cartesian index of the linear index _i_ given an array shape _⍴_.
The indices are counted such that the rightmost index increments first.
The inverse is `linearIndex`.

At vector:

```
>>> let shape = [3];
>>> 1:3.collect { :l |
>>> 	shape.cartesianIndex(l)
>>> }
[1; 2; 3]

>>> let shape = [3];
>>> [1; 2; 3].collect { :c |
>>> 	shape.linearIndex(c)
>>> }
[1 2 3]
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

At box, or volume:

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

Indices at 2×3×4 array:

~~~spl svg=A
let shape = [2 3 4];
[1 .. 2 * 3 * 4].collect { :each |
	shape.cartesianIndex(each)
}.transpose.colourMatrixPlot
~~~

![](Help/Image/cartesianIndex-A.svg)

* * *

See also: deepIndices, linearIndex, mixedRadixEncode, shapeIndices

Guides: Indexing Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/arrays/#Base.IteratorsMD.CartesianIndex),
_MathWorks_
[1](https://mathworks.com/help/matlab/ref/ind2sub.html)
