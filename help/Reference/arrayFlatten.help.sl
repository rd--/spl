# arrayFlatten

- _arrayFlatten(aMatix)_

Create a block matrix by flattening out a matrix of matrices:

```
>>> let m = [1 2; 3 4];
>>> [m m m; m m m].arrayFlatten
[
	1 2 1 2 1 2;
	3 4 3 4 3 4;
	1 2 1 2 1 2;
	3 4 3 4 3 4
]
```

With zero matrices:

```
>>> let m = [1 2; 3 4];
>>> let z = [0].reshape(m.shape);
>>> [z z m; m m z].arrayFlatten
[
	0 0 0 0 1 2;
	0 0 0 0 3 4;
	1 2 1 2 0 0;
	3 4 3 4 0 0
]
```

Flatten a rank-four array to rank two:

```
>>> [0].reshape([1 2 3 4]).arrayFlatten.shape
[3 8]
```

Flatten only the first four levels of a rank-6 array:

```
>>> [0].reshape([1 2 3 4 5 6]).arrayFlatten.shape
[3 8 5 6]
```

`kroneckerProduct` is the `arrayFlatten` of an `outer` product:

```
>>> let m = [2 2].iota;
>>> let k = m.kroneckerProduct(m * 7);
>>> let o = *.outer(m, m * 7);
>>> k = o.arrayFlatten
true
```

* * *

See also: ++, arrayReduce, concatenation, flatten, isArray, join, kroneckerProduct

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayFlatten.html)

Categories: Math, Matrix
